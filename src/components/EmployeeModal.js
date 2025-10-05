import React from 'react';
import './EmployeeModal.css';

const EmployeeModal = ({ employee, onClose }) => {
  if (!employee) return null;

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <button className="modal-close" onClick={onClose}>✕</button>
        
        <div className="employee-profile">
          <div className="profile-header">
            <img 
              src={employee.photo || 'https://i.pravatar.cc/200?img=1'} 
              alt={employee.name} 
              className="profile-photo"
            />
            <div className="profile-location">
              <span className="location-icon">📍</span>
              <span>San Francisco</span>
              <span className="office-label">Office</span>
            </div>
            <div className="profile-department">
              <span className="department-icon">💼</span>
              <span>Executive Management</span>
              <span className="department-label">Department</span>
            </div>
            <div className="profile-country">
              <span className="country-icon">🇺🇸</span>
              <span>Denver, Colorado</span>
            </div>
            <div className="profile-flag">
              <span className="flag-icon">🇺🇸</span>
              <span>United States</span>
            </div>
          </div>

          <div className="profile-main">
            <h1>Hanna Booth</h1>
            <h2>Sales and Marketing</h2>
            
            <div className="contact-info">
              <div className="contact-item">
                <span className="contact-icon">✉️</span>
                <a href="mailto:hanna.booth@example.com">hanna.booth@example.com</a>
                <span className="contact-label">Email</span>
              </div>
              
              <div className="contact-item">
                <span className="contact-icon">💬</span>
                <a href="#">Call in Teams or Start a chat</a>
                <span className="contact-label">Microsoft Teams</span>
              </div>
              
              <div className="contact-item">
                <span className="contact-icon">📞</span>
                <span>809-512-7775</span>
                <span className="contact-label">Work Phone</span>
              </div>
              
              <div className="contact-item">
                <span className="contact-icon">📱</span>
                <span>402-514-2690</span>
                <span className="contact-label">Mobile Phone</span>
              </div>
            </div>

            <div className="about-section">
              <h3>About Me</h3>
              <p>Hanna is a fearless leader whose strategic vision and entrepreneurial spirit have catapulted our company to the forefront of the industry. Her leadership is defined by a commitment to innovation and excellence, guiding our team to new heights with agility and foresight.</p>
            </div>

            <div className="profile-meta">
              <div className="meta-item">
                <span className="meta-icon">🎂</span>
                <span>2 February</span>
                <span className="meta-label">Birthday</span>
              </div>
              
              <div className="meta-item">
                <span className="meta-icon">🏷️</span>
                <span>Started 14 years ago (Feb 2010)</span>
                <span className="meta-label">Hire Date</span>
              </div>
            </div>

            <div className="skills-section">
              <h3>Skills</h3>
              <div className="skills-grid">
                <span className="skill-tag">Active-HDL</span>
                <span className="skill-tag">Cultural Awareness</span>
                <span className="skill-tag">Knowledge Management</span>
                <span className="skill-tag">Krakatoa</span>
                <span className="skill-tag">MPBGP</span>
                <span className="skill-tag">SAP-SD</span>
                <span className="skill-tag">XDCAM</span>
              </div>
            </div>
          </div>

          <div className="profile-sidebar">
            <div className="sidebar-tabs">
              <button className="tab-btn active">People</button>
              <button className="tab-btn">Reporting Line</button>
            </div>

            <div className="direct-reports">
              <h4>Direct Reports <span className="count">6</span></h4>
              <div className="reports-list">
                <div className="report-item">
                  <img src="https://i.pravatar.cc/40?img=5" alt="Adrienne Decker" />
                  <div>
                    <h5>Adrienne Decker</h5>
                    <p>VP - Research</p>
                  </div>
                </div>
                <div className="report-item">
                  <img src="https://i.pravatar.cc/40?img=8" alt="April Larson" />
                  <div>
                    <h5>April Larson</h5>
                    <p>VP Technology</p>
                  </div>
                </div>
                <div className="report-item">
                  <img src="https://i.pravatar.cc/40?img=12" alt="Darryl Rich" />
                  <div>
                    <h5>Darryl Rich</h5>
                    <p>VP - Business Systems</p>
                  </div>
                </div>
                <div className="report-item">
                  <img src="https://i.pravatar.cc/40?img=3" alt="Francis Jefferson" />
                  <div>
                    <h5>Francis Jefferson</h5>
                    <p>CFO</p>
                  </div>
                </div>
                <div className="report-item">
                  <img src="https://i.pravatar.cc/40?img=14" alt="Harwilll Bricksey" />
                  <div>
                    <h5>Harwilll Bricksey</h5>
                    <p>VP - Marketing and Sales</p>
                  </div>
                </div>
                <div className="report-item">
                  <img src="https://i.pravatar.cc/40?img=11" alt="Levi Bates" />
                  <div>
                    <h5>Levi Bates</h5>
                    <p>Personal Assistant</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default EmployeeModal;
