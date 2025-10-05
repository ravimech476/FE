import React from 'react';
import './ProfileCard.css';

const ProfileCard = ({ profile }) => {
  return (
    <div className="profile-card">
      <div className="profile-header">
        <img src={profile.image} alt={profile.name} className="profile-image" />
        <div className="profile-info">
          <h1 className="profile-name">{profile.name}</h1>
          <p className="profile-department">{profile.department}</p>
        </div>
      </div>
      
      <div className="profile-contact">
        <div className="contact-item">
          <span className="contact-icon">✉️</span>
          <a href={`mailto:${profile.email}`} className="contact-link">
            {profile.email}
          </a>
        </div>
        
        <div className="contact-item">
          <span className="contact-icon">💬</span>
          <button className="teams-button">
            Call in Teams or Start a chat
            <span className="teams-label">Microsoft Teams</span>
          </button>
        </div>
        
        <div className="contact-item">
          <span className="contact-icon">📞</span>
          <div>
            <div className="phone-number">{profile.workPhone}</div>
            <span className="phone-label">Work Phone</span>
          </div>
        </div>
        
        <div className="contact-item">
          <span className="contact-icon">📱</span>
          <div>
            <div className="phone-number">{profile.mobilePhone}</div>
            <span className="phone-label">Mobile Phone</span>
          </div>
        </div>
      </div>
      
      <div className="profile-details">
        <div className="detail-item">
          <span className="detail-icon">🏢</span>
          <div>
            <div className="detail-value">{profile.office}</div>
            <div className="detail-label">Office</div>
          </div>
        </div>
        
        <div className="detail-item">
          <span className="detail-icon">👤</span>
          <div>
            <div className="detail-value">{profile.role}</div>
            <div className="detail-label">Department</div>
          </div>
        </div>
        
        <div className="detail-item">
          <span className="detail-icon">📍</span>
          <div className="detail-value">{profile.location}</div>
        </div>
        
        <div className="detail-item">
          <span className="detail-icon">🇺🇸</span>
          <div className="detail-value">{profile.country}</div>
        </div>
      </div>
      
      <div className="about-section">
        <h3>About Me</h3>
        <p>{profile.about}</p>
      </div>
      
      <div className="profile-meta">
        <div className="meta-item">
          <span className="meta-icon">🎂</span>
          <span>{profile.birthday}</span>
        </div>
        <div className="meta-item">
          <span className="meta-icon">📅</span>
          <span>Started {profile.startDate}</span>
        </div>
        <div className="meta-item">
          <span className="meta-label">Hire Date</span>
        </div>
      </div>
      
      <div className="skills-section">
        <h3>Skills</h3>
        <div className="skills-grid">
          {profile.skills.map((skill, index) => (
            <div key={index} className="skill-tag">
              {skill}
            </div>
          ))}
        </div>
      </div>
      
      <div className="direct-reports">
        <h3>Direct Reports <span className="reports-count">{profile.directReports.length}</span></h3>
        <div className="reports-list">
          {profile.directReports.map((report, index) => (
            <div key={index} className="report-item">
              <img src={report.image} alt={report.name} className="report-image" />
              <div className="report-info">
                <div className="report-name">{report.name}</div>
                <div className="report-role">{report.role}</div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ProfileCard;
