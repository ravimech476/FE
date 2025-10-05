import React from 'react';
import { useNavigate } from 'react-router-dom';
import './DashboardLinks.css';

const DashboardLinks = () => {
  const navigate = useNavigate();
  
  const handleViewDashboards = () => {
    navigate('/dashboards');
  };
  
  return (
    <section className="dashboard-links">
      <h2 className="section-title text-orange">Dashboard Links</h2>
      <div className="links-container">
        <button onClick={handleViewDashboards} className="dashboard-link">
          <span className="link-icon">📝</span>
          <span className="link-text">Click here to view</span>
        </button>
      </div>
      <div className="copyright">
        <p>© copyright Jasmine All Rights Reserved</p>
      </div>
    </section>
  );
};

export default DashboardLinks;
