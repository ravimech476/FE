import React, { useState } from 'react';
import Header from '../components/Header';
import './ContactPage.css';

const ContactPage = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    company: '',
    subject: '',
    message: ''
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Form submitted:', formData);
    // Handle form submission here
  };

  return (
    <div className="contact-page">
      <Header />
      
      <div className="contact-hero">
        <div className="hero-overlay"></div>
        <div className="hero-content">
          <h1>Contact Us</h1>
          <p>Get in touch with Shanthi Groups</p>
        </div>
      </div>

      <div className="container">
        <div className="contact-content">
          <div className="contact-info-section">
            <h2 className="section-title text-orange">Get In Touch</h2>
            
            <div className="contact-cards">
              <div className="contact-card">
                <div className="contact-icon">📍</div>
                <h3>Head Office</h3>
                <p>Raghu Ram 5, No.56 Ashok Street,<br/>
                Nungambakkam, Chennai<br/>
                PIN 600034</p>
              </div>
              
              <div className="contact-card">
                <div className="contact-icon">📞</div>
                <h3>Phone Numbers</h3>
                <p>+91 44 2820 2439<br/>
                +91 944 217 1239<br/>
                +91 944 337 1025</p>
              </div>
              
              <div className="contact-card">
                <div className="contact-icon">📧</div>
                <h3>Email Addresses</h3>
                <p>info@shanthigroups.com<br/>
                support@shanthigroups.com<br/>
                sales@shanthigroups.com</p>
              </div>
              
              <div className="contact-card">
                <div className="contact-icon">🕐</div>
                <h3>Business Hours</h3>
                <p>Monday - Friday: 9:00 AM - 6:00 PM<br/>
                Saturday: 9:00 AM - 1:00 PM<br/>
                Sunday: Closed</p>
              </div>
            </div>

            <div className="map-section">
              <h2 className="section-title text-orange">Our Locations</h2>
              <div className="locations-grid">
                <div className="location-item">
                  <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&h=250&fit=crop" alt="Office 1" />
                  <h3>Chennai Head Office</h3>
                  <p>Main administrative and management center</p>
                </div>
                <div className="location-item">
                  <img src="https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=400&h=250&fit=crop" alt="Office 2" />
                  <h3>Coimbatore Branch</h3>
                  <p>Manufacturing and distribution facility</p>
                </div>
                <div className="location-item">
                  <img src="https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=400&h=250&fit=crop" alt="Office 3" />
                  <h3>Dindigul Unit</h3>
                  <p>Processing and packaging center</p>
                </div>
              </div>
            </div>
          </div>

          <div className="contact-form-section">
            <h2 className="section-title">Send Us a Message</h2>
            
            <form onSubmit={handleSubmit} className="contact-form">
              <div className="form-row">
                <div className="form-group">
                  <label>Your Name *</label>
                  <input
                    type="text"
                    name="name"
                    value={formData.name}
                    onChange={handleChange}
                    required
                  />
                </div>
                
                <div className="form-group">
                  <label>Email Address *</label>
                  <input
                    type="email"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    required
                  />
                </div>
              </div>
              
              <div className="form-row">
                <div className="form-group">
                  <label>Phone Number</label>
                  <input
                    type="tel"
                    name="phone"
                    value={formData.phone}
                    onChange={handleChange}
                  />
                </div>
                
                <div className="form-group">
                  <label>Company Name</label>
                  <input
                    type="text"
                    name="company"
                    value={formData.company}
                    onChange={handleChange}
                  />
                </div>
              </div>
              
              <div className="form-group">
                <label>Subject *</label>
                <input
                  type="text"
                  name="subject"
                  value={formData.subject}
                  onChange={handleChange}
                  required
                />
              </div>
              
              <div className="form-group">
                <label>Message *</label>
                <textarea
                  name="message"
                  value={formData.message}
                  onChange={handleChange}
                  rows="6"
                  required
                ></textarea>
              </div>
              
              <button type="submit" className="submit-btn">
                Send Message
              </button>
            </form>
          </div>
        </div>

        <div className="partners-section">
          <h2 className="section-title text-orange text-center">Our Partners</h2>
          <div className="partners-grid">
            <div className="partner-logo">🏢 Partner 1</div>
            <div className="partner-logo">🏭 Partner 2</div>
            <div className="partner-logo">🏗️ Partner 3</div>
            <div className="partner-logo">🏛️ Partner 4</div>
            <div className="partner-logo">🏪 Partner 5</div>
          </div>
        </div>
      </div>

      <footer className="contact-footer">
        <div className="container">
          <div className="footer-content">
            <div className="footer-section">
              <h3>Shanthi Groups</h3>
              <p>Leading provider of quality products and services across multiple industries.</p>
              <div className="social-links">
                <a href="#">📘</a>
                <a href="#">🐦</a>
                <a href="#">💼</a>
                <a href="#">📷</a>
              </div>
            </div>
            
            <div className="footer-section">
              <h4>Quick Links</h4>
              <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/news">News</a></li>
                <li><a href="/company/jasmine">Companies</a></li>
                <li><a href="/blog/1">Blog</a></li>
              </ul>
            </div>
            
            <div className="footer-section">
              <h4>Services</h4>
              <ul>
                <li><a href="#">Raw Materials</a></li>
                <li><a href="#">Electronics</a></li>
                <li><a href="#">Consulting</a></li>
                <li><a href="#">Export Services</a></li>
              </ul>
            </div>
            
            <div className="footer-section">
              <h4>Newsletter</h4>
              <p>Subscribe to get updates</p>
              <div className="newsletter">
                <input type="email" placeholder="Your email" />
                <button>Subscribe</button>
              </div>
            </div>
          </div>
          
          <div className="footer-bottom">
            <p>© 2025 Shanthi Groups. All Rights Reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
};

export default ContactPage;
