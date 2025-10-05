import React, { useState, useEffect } from 'react';
import userService from '../services/userService';
import './SocialCorner.css';

const SocialCorner = () => {
  const [activeTab, setActiveTab] = useState('members');
  const [message, setMessage] = useState('');
  const [upcomingBirthdays, setUpcomingBirthdays] = useState([]);
  const [loading, setLoading] = useState(true);
  
  useEffect(() => {
    loadBirthdays();
  }, []);
  
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
  
  const members = [
    { name: 'Finance', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'offline' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
    { name: 'Shankar', avatar: '👤', status: 'offline' },
    { name: 'Shankar', avatar: '👤', status: 'online' },
  ];

  const onlineMembers = upcomingBirthdays.map(user => ({
    id: user.id,
    name: user.full_name,
    role: user.birthday_message,
    avatar: `https://ui-avatars.com/api/?name=${encodeURIComponent(user.full_name)}&background=random`,
    isToday: user.is_today
  }));

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
          <h3>Upcoming Birthdays 🎂</h3>
          {loading ? (
            <p>Loading birthdays...</p>
          ) : onlineMembers.length > 0 ? (
            <div className="online-list">
              {onlineMembers.map((member) => (
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
