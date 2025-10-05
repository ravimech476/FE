import React, { useState, useEffect, useRef } from 'react';
import { useAuth } from '../contexts/AuthContext';
import { useSocket } from '../contexts/SocketContext';
import userService from '../services/userService';
import chatService from '../services/chatService';
import './SocialCorner.css';

const SocialCorner = () => {
  const { user } = useAuth();
  const { socket, isConnected, onlineUsers } = useSocket();
  const [message, setMessage] = useState('');
  const [upcomingBirthdays, setUpcomingBirthdays] = useState([]);
  const [loading, setLoading] = useState(true);
  const [allUsers, setAllUsers] = useState([]);
  const [selectedContact, setSelectedContact] = useState(null);
  const [messages, setMessages] = useState([]);
  const [sendingMessage, setSendingMessage] = useState(false);
  const [isTyping, setIsTyping] = useState(false);
  const messagesEndRef = useRef(null);
  const typingTimeoutRef = useRef(null);
  
  useEffect(() => {
    loadBirthdays();
    loadUsers();
  }, []);
  
  // Socket event listeners
  useEffect(() => {
    if (!socket) return;
    
    // Listen for new messages
    socket.on('new_message', (newMessage) => {
      // Only add if it's for current conversation
      if (selectedContact && 
          (newMessage.sender_id === selectedContact.id || newMessage.receiver_id === selectedContact.id)) {
        setMessages(prev => [...prev, newMessage]);
      }
    });
    
    // Listen for message sent confirmation
    socket.on('message_sent', (sentMessage) => {
      console.log('Message sent successfully');
    });
    
    // Listen for typing indicator
    socket.on('user_typing', (data) => {
      if (selectedContact && data.userId === selectedContact.id) {
        setIsTyping(data.isTyping);
      }
    });
    
    // Listen for errors
    socket.on('error', (error) => {
      console.error('Socket error:', error);
      alert(error.message || 'An error occurred');
    });
    
    // Cleanup listeners
    return () => {
      socket.off('new_message');
      socket.off('message_sent');
      socket.off('user_typing');
      socket.off('error');
    };
  }, [socket, selectedContact]);
  
  useEffect(() => {
    if (selectedContact) {
      loadConversation(selectedContact.id);
      // Mark messages as read
      if (socket) {
        socket.emit('mark_as_read', { sender_id: selectedContact.id });
      }
    }
  }, [selectedContact, socket]);
  
  useEffect(() => {
    scrollToBottom();
  }, [messages]);
  
  // Update online status when onlineUsers changes
  useEffect(() => {
    setAllUsers(prev => {
      // Update online status
      const updated = prev.map(u => ({
        ...u,
        is_online: onlineUsers.includes(u.id)
      }));
      
      // Re-sort: online first, then alphabetically
      return updated.sort((a, b) => {
        if (a.is_online && !b.is_online) return -1;
        if (!a.is_online && b.is_online) return 1;
        return a.full_name.localeCompare(b.full_name);
      });
    });
  }, [onlineUsers]);
  
  const loadBirthdays = async () => {
    try {
      setLoading(true);
      const response = await userService.getUpcomingBirthdays(30);
      setUpcomingBirthdays(response.birthdays || []);
    } catch (error) {
      console.error('Failed to load birthdays:', error);
      setUpcomingBirthdays([]);
    } finally {
      setLoading(false);
    }
  };
  
  const loadUsers = async () => {
    try {
      const response = await chatService.getAllUsers();
      // Sort users: online first, then alphabetically by name
      const sortedUsers = (response.users || []).sort((a, b) => {
        // Online users come first
        if (a.is_online && !b.is_online) return -1;
        if (!a.is_online && b.is_online) return 1;
        // If both online or both offline, sort alphabetically
        return a.full_name.localeCompare(b.full_name);
      });
      setAllUsers(sortedUsers);
    } catch (error) {
      console.error('Failed to load users:', error);
      setAllUsers([]);
    }
  };
  
  const loadConversation = async (contactId) => {
    try {
      const response = await chatService.getConversation(contactId);
      setMessages(response.messages || []);
    } catch (error) {
      console.error('Failed to load conversation:', error);
      setMessages([]);
    }
  };
  
  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };
  
  const handleSendMessage = async (e) => {
    e.preventDefault();
    
    if (!message.trim() || !selectedContact || sendingMessage || !socket) {
      return;
    }
    
    try {
      setSendingMessage(true);
      
      // Send via Socket.io for INSTANT delivery
      socket.emit('send_message', {
        receiver_id: selectedContact.id,
        message_text: message.trim()
      });
      
      // Add to local messages immediately (optimistic update)
      const tempMessage = {
        id: Date.now(),
        sender_id: user.id,
        receiver_id: selectedContact.id,
        message_text: message.trim(),
        created_date: new Date().toISOString(),
        sender_username: user.username,
        sender_first_name: user.first_name,
        sender_last_name: user.last_name
      };
      
      setMessages(prev => [...prev, tempMessage]);
      setMessage('');
      
      // Stop typing indicator
      socket.emit('typing', { receiver_id: selectedContact.id, isTyping: false });
      
    } catch (error) {
      console.error('Failed to send message:', error);
      alert('Failed to send message. Please try again.');
    } finally {
      setSendingMessage(false);
    }
  };
  
  const handleTyping = (e) => {
    setMessage(e.target.value);
    
    if (!socket || !selectedContact) return;
    
    // Send typing indicator
    socket.emit('typing', { receiver_id: selectedContact.id, isTyping: true });
    
    // Clear previous timeout
    if (typingTimeoutRef.current) {
      clearTimeout(typingTimeoutRef.current);
    }
    
    // Stop typing after 1 second of no input
    typingTimeoutRef.current = setTimeout(() => {
      socket.emit('typing', { receiver_id: selectedContact.id, isTyping: false });
    }, 1000);
  };
  
  const handleSelectContact = (contact) => {
    setSelectedContact(contact);
    setMessages([]);
    setIsTyping(false);
  };

  const birthdayMembers = upcomingBirthdays.map(user => ({
    id: user.id,
    name: user.full_name,
    role: user.birthday_message,
    avatar: `https://ui-avatars.com/api/?name=${encodeURIComponent(user.full_name)}&background=random`,
    isToday: user.is_today
  }));

  const formatTime = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleTimeString('en-US', { 
      hour: 'numeric', 
      minute: '2-digit',
      hour12: true 
    });
  };
  
  const getUserAvatar = (username) => {
    return `https://ui-avatars.com/api/?name=${encodeURIComponent(username)}&background=random&size=32`;
  };

  return (
    <section className="social-corner">
      <h2 className="section-title text-orange">
        Social Corner 
        {isConnected && <span className="connection-status connected">● Live</span>}
        {!isConnected && <span className="connection-status disconnected">○ Offline</span>}
      </h2>
      
      <div className="social-container">
        <div className="social-left">
          <div className="members-list">
            <h4>Company Members ({allUsers.length})</h4>
            {allUsers.length > 0 ? (
              allUsers.map((member) => (
                <div 
                  key={member.id} 
                  className={`member-item ${selectedContact?.id === member.id ? 'active' : ''}`}
                  onClick={() => handleSelectContact(member)}
                >
                  <div className="member-avatar-wrapper">
                    <img 
                      src={getUserAvatar(member.full_name)} 
                      alt={member.full_name}
                      className="member-avatar-img"
                    />
                    <span className={`status-dot ${member.is_online ? 'online' : 'offline'}`}></span>
                  </div>
                  <span className="member-name">{member.full_name}</span>
                </div>
              ))
            ) : (
              <p className="no-members">No members available</p>
            )}
          </div>
          
          <div className="chat-box">
            {selectedContact ? (
              <>
                <div className="chat-header">
                  <div className="member-avatar-wrapper">
                    <img 
                      src={getUserAvatar(selectedContact.full_name)} 
                      alt={selectedContact.full_name}
                      className="chat-header-avatar"
                    />
                    <span className={`status-dot ${selectedContact.is_online ? 'online' : 'offline'}`}></span>
                  </div>
                  <div className="chat-header-info">
                    <h4>{selectedContact.full_name}</h4>
                    <p className="chat-header-email">
                      {selectedContact.is_online ? '🟢 Online' : '⚫ Offline'}
                    </p>
                  </div>
                </div>
                
                <div className="chat-messages">
                  {messages.length > 0 ? (
                    messages.map((msg, index) => {
                      const isMe = msg.sender_id === user.id;
                      const senderName = isMe 
                        ? 'You' 
                        : `${msg.sender_first_name || ''} ${msg.sender_last_name || ''}`.trim() || msg.sender_username;
                      
                      return (
                        <div key={msg.id || index} className={`message ${isMe ? 'me' : 'other'}`}>
                          {!isMe && <span className="message-sender">{senderName}</span>}
                          <div className="message-bubble">{msg.message_text}</div>
                          <span className="message-time">{formatTime(msg.created_date)}</span>
                        </div>
                      );
                    })
                  ) : (
                    <div className="no-messages">
                      <p>No messages yet. Start the conversation!</p>
                    </div>
                  )}
                  
                  {isTyping && (
                    <div className="typing-indicator">
                      <span className="typing-dot"></span>
                      <span className="typing-dot"></span>
                      <span className="typing-dot"></span>
                      <span className="typing-text">{selectedContact.full_name} is typing...</span>
                    </div>
                  )}
                  
                  <div ref={messagesEndRef} />
                </div>
                
                <form onSubmit={handleSendMessage} className="chat-input">
                  <input 
                    type="text" 
                    placeholder="Type a message..."
                    value={message}
                    onChange={handleTyping}
                    disabled={sendingMessage || !isConnected}
                  />
                  <button 
                    type="submit" 
                    className="send-btn"
                    disabled={sendingMessage || !message.trim() || !isConnected}
                    title={!isConnected ? 'Not connected' : 'Send message'}
                  >
                    {sendingMessage ? '...' : '➤'}
                  </button>
                </form>
              </>
            ) : (
              <div className="chat-placeholder">
                <p>👋 Select a member to start chatting</p>
              </div>
            )}
          </div>
        </div>
        
        <div className="social-right">
          <h3>Upcoming Birthdays 🎂</h3>
          {loading ? (
            <p>Loading birthdays...</p>
          ) : birthdayMembers.length > 0 ? (
            <div className="online-list">
              {birthdayMembers.map((member) => (
                <div key={member.id} className={`online-member ${member.isToday ? 'birthday-today' : ''}`}>
                  <img src={member.avatar} alt={member.name} className="online-avatar" />
                  <div className="online-info">
                    <h4>{member.name} {member.isToday && '🎉'}</h4>
                    <p>{member.role}</p>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <p className="no-birthdays">No upcoming birthdays in the next 30 days</p>
          )}
        </div>
      </div>
    </section>
  );
};

export default SocialCorner;
