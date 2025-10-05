import React from 'react';
import { Link } from 'react-router-dom';
import './CompanyPage.css';

const CompanyPage = () => {
  const executives = [
    { name: 'Amy Smith', role: 'Chief Operating Professional', color: '#17a2b8' },
    { name: 'Amy Bennett', role: 'Chief Operating Professional', color: '#8bc34a' },
    { name: 'Amy Bennett', role: 'Chief Operating Professional', color: '#ff5252' },
    { name: 'Amy Bennett', role: 'Chief Operating Professional', color: '#7cb342' }
  ];

  const financialTeam = [
    { name: 'John', role: 'Business professional', avatar: 'https://i.pravatar.cc/60?img=7' },
    { name: 'John', role: 'Business professional', avatar: 'https://i.pravatar.cc/60?img=8' },
    { name: 'John', role: 'Business professional', avatar: 'https://i.pravatar.cc/60?img=11' }
  ];

  const salesTeam = [
    { name: 'John', role: 'Business professional', avatar: 'https://i.pravatar.cc/60?img=12' },
    { name: 'John', role: 'Business professional', avatar: 'https://i.pravatar.cc/60?img=13' },
    { name: 'John', role: 'Business professional', avatar: 'https://i.pravatar.cc/60?img=14' }
  ];

  const policies = [
    { title: 'Excel Document', date: 'Jul 2, 2025', icon: '📊', color: '#4CAF50' },
    { title: 'Word Document', date: 'Jul 2, 2025', icon: '📄', color: '#2196F3' },
    { title: 'Power Point Presentation', date: 'Jul 2, 2025', icon: '📊', color: '#ff5722' }
  ];

  const onboardingContacts = [
    { name: 'Rosa Bell', role: 'HR Manager', avatar: 'https://i.pravatar.cc/50?img=5' },
    { name: 'James Smith', role: 'IT Manager', avatar: 'https://i.pravatar.cc/50?img=6' }
  ];

  const locations = [
    {
      title: 'Head / Registered Office',
      address: 'Raghu Ram 5, No.56 Ashok Street, Nungambakkam, Chennai PIN 600034.',
      phone: 'Ph no : +91 44 2820 2439, +91 944 217 1239, +91 944 337 1025'
    },
    {
      title: 'Industrial / Unit',
      address: 'Raghu Ram 5, No.56 6th, 50CO Industrial Estate, Ambattur, Chennai PIN 600098'
    },
    {
      title: 'Manufacturing / Unit',
      address: 'Raghu Ram 5, S.F.No.684/1, Jalupatti Pirivu, Mettur Gate (PO), Mettupalayam Taluk (Village), Kodai Road (Via), Dindigul PIN 624208.',
      phone: 'Ph no : +91'
    },
    {
      title: 'Manufacturing / Unit',
      address: 'Raghu Ram 5, No. 526/1-B, Bilichi Post (Chinnaareddampalayam), Karamadai, Coimbatore PIN 638109, Karkata'
    }
  ];

  return (
    <div className="company-page">
      
      {/* <div className="company-sub-header">
        <div className="container">
          <div className="company-nav">
            <div className="company-logo">
              <span className="logo-icon">🌸</span>
              <span className="logo-text">Jasmine concrete exports</span>
            </div>
            <Link to="/contact" className="contact-link">Contact</Link>
          </div>
        </div>
      </div> */}

      <div className="company-hero">
        <div className="hero-overlay"></div>
        <div className="hero-content">
          <h1>Group of company has created to do work for various sectors<br />
          like the electronics and Raw materials about flowers</h1>
        </div>
      </div>

      <div className="container">
        <section className="executives-section">
          <h2 className="section-title text-orange">Company Executives</h2>
          <div className="executives-grid">
            {executives.map((exec, index) => (
              <div key={index} className="executive-card">
                <div className="exec-avatar">
                  <img src={`https://i.pravatar.cc/150?img=${index + 20}`} alt={exec.name} />
                </div>
                <div className="exec-info" style={{ backgroundColor: exec.color }}>
                  <h3>{exec.name}</h3>
                  <p>{exec.role}</p>
                </div>
              </div>
            ))}
          </div>
        </section>

        <section className="teams-section">
          <div className="team-column">
            <h3 className="team-title text-orange">Financial</h3>
            {financialTeam.map((member, index) => (
              <div key={index} className="team-member">
                <img src={member.avatar} alt={member.name} />
                <div>
                  <h4>{member.name}</h4>
                  <p>{member.role}</p>
                </div>
              </div>
            ))}
          </div>
          
          <div className="team-column">
            <h3 className="team-title text-orange">Sales</h3>
            {salesTeam.map((member, index) => (
              <div key={index} className="team-member">
                <img src={member.avatar} alt={member.name} />
                <div>
                  <h4>{member.name}</h4>
                  <p>{member.role}</p>
                </div>
              </div>
            ))}
          </div>
        </section>

        <section className="policies-section">
          <h2 className="section-title text-orange">Policies</h2>
          <div className="policy-content">
            <div className="policy-illustration">
              <img src="https://images.unsplash.com/photo-1521791136064-7986c2920216?w=400&h=300&fit=crop" alt="Policies" />
              <button className="view-btn">Click here to View</button>
            </div>
            <div className="policy-list">
              {policies.map((policy, index) => (
                <div key={index} className="policy-item">
                  <div className="policy-icon" style={{ backgroundColor: policy.color }}>
                    {policy.icon}
                  </div>
                  <div className="policy-info">
                    <h4>{policy.title}</h4>
                    <p>{policy.date}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="onboarding-section">
          <h2 className="section-title text-orange">Onboarding contacts</h2>
          <div className="onboarding-grid">
            {onboardingContacts.map((contact, index) => (
              <div key={index} className="onboarding-card">
                <img src={contact.avatar} alt={contact.name} />
                <h4>{contact.name}</h4>
                <p>{contact.role}</p>
              </div>
            ))}
            <div className="onboarding-card add-card">
              <div className="add-icon">+</div>
              <p>Add Contact</p>
            </div>
          </div>
        </section>

        <section className="locations-section">
          <h2 className="section-title text-orange">Locations</h2>
          <div className="locations-grid">
            {locations.map((location, index) => (
              <div key={index} className="location-card">
                <div className="location-icon">📍</div>
                <h3>{location.title}</h3>
                <p>{location.address}</p>
                {location.phone && <p className="location-phone">📞 {location.phone}</p>}
              </div>
            ))}
          </div>
        </section>

        <div className="company-footer">
          <div className="footer-links">
            <div className="footer-item">
              <span className="footer-icon">💼</span>
              <div>
                <h4>Official Site : Registrar / Business Data :</h4>
                <p>Directory :</p>
              </div>
            </div>
            <div className="footer-item">
              <span className="footer-icon">📧</span>
              <div>
                <p>jasminecncl@jasmine.in<br />
                accountscncl@jasmine.inindustry<br />
                jasmineindia@vsnl.net</p>
              </div>
            </div>
          </div>
          <p className="copyright">© copyright Jasmine All Rights Reserved</p>
        </div>
      </div>
    </div>
  );
};

export default CompanyPage;
