import React, { useState } from 'react';
import './SocialCorner.css';

const SocialCorner = () => {
  const [activeTab, setActiveTab] = useState('members');
  const [message, setMessage] = useState('');
  
  const members = [
    { name: 'Finance', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'offline' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'offline' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
  ];

  const onlineMembers = [
    { name: 'Anne Smith', role: 'Birthday today', avatar: 'https://i.pravatar.cc/40?img=1' },
    { name: 'Beth Carlson', role: 'Birthday on March 1,2023', avatar: 'https://i.pravatar.cc/40?img=5' },
    { name: 'Jason Salah', role: 'Birthday on April 19,2023', avatar: 'https://i.pravatar.cc/40?img=3' },
    { name: 'Liza McDonald', role: 'Birthday on April 21,2023', avatar: 'https://i.pravatar.cc/40?img=9' },
    { name: 'Akash Patel', role: 'Birthday on May 1,2023', avatar: 'https://i.pravatar.cc/40?img=8' },
  ];

  const messages = [
    { sender: 'other', text: 'Hello, everyone!', time: '10:25am' },
    { sender: 'me', text: 'Hi Ella!', time: '10:25am' },
    { sender: 'other', text: 'How are you?', time: '10:26am' },
    { sender: 'me', text: 'Im good, thank you!', time: '10:27am' },
  ];

  return (
    <section className="social-corner">
      <h2 className="section-title text-orange">Social Corner</h2>
      
      <div className="social-container">
        <div className="social-left">
          <div className="tab-buttons">
            <button 
              className={`tab-btn ${activeTab === 'members' ? 'active' : ''}`}
              onClick={() => setActiveTab('members')}
            >
              Company Members
            </button>
            <button 
              className={`tab-btn ${activeTab === 'groups' ? 'active' : ''}`}
              onClick={() => setActiveTab('groups')}
            >
              Group names
            </button>
          </div>
          
          <div className="members-list">
            {members.map((member, index) => (
              <div key={index} className="member-item">
                <span className="member-avatar">{member.avatar}</span>
                <span className="member-name">{member.name}</span>
                <span className={`status-dot ${member.status}`}></span>
              </div>
            ))}
          </div>
          
          <div className="chat-box">
            <div className="chat-messages">
              {messages.map((msg, index) => (
                <div key={index} className={`message ${msg.sender}`}>
                  <div className="message-bubble">{msg.text}</div>
                  <span className="message-time">{msg.time}</span>
                </div>
              ))}
            </div>
            <div className="chat-input">
              <input 
                type="text" 
                placeholder="Type a message"
                value={message}
                onChange={(e) => setMessage(e.target.value)}
              />
              <button className="send-btn">➤</button>
            </div>
          </div>
        </div>
        
        <div className="social-right">
          <h3>Online</h3>
          <div className="online-list">
            {onlineMembers.map((member, index) => (
              <div key={index} className="online-member">
                <img src={member.avatar} alt={member.name} className="online-avatar" />
                <div className="online-info">
                  <h4>{member.name}</h4>
                  <p>{member.role}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default SocialCorner;
