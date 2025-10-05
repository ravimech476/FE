import React from 'react';
import './DashboardLinks.css';

const DashboardLinks = () => {
  return (
    <section className="dashboard-links">
      <h2 className="section-title text-orange">Dashboard Links</h2>
      <div className="links-container">
        <a href="#" className="dashboard-link">
          <span className="link-icon">📝</span>
          <span className="link-text">Click here to view</span>
        </a>
      </div>
      <div className="copyright">
        <p>© copyright Jasmine All Rights Reserved</p>
      </div>
    </section>
  );
};

export default DashboardLinks;
