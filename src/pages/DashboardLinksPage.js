import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import dashboardService from '../services/dashboardService';
import './DashboardLinksPage.css';

const DashboardLinksPage = () => {
  const navigate = useNavigate();
  const [links, setLinks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    loadDashboardLinks();
  }, []);

  const loadDashboardLinks = async () => {
    try {
      setLoading(true);
      const response = await dashboardService.getAllLinks();
      setLinks(response.links || []);
    } catch (err) {
      console.error('Failed to load dashboard links:', err);
      setError('Failed to load dashboard links');
    } finally {
      setLoading(false);
    }
  };

  const handleLinkClick = (url) => {
    if (url) {
      window.open(url, '_blank', 'noopener,noreferrer');
    }
  };

  if (loading) {
    return (
      <div className="dashboards-page">
        <div className="container">
          <p>Loading dashboards...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="dashboards-page">
      <div className="container">
        <div className="dashboards-header">
          <button onClick={() => navigate(-1)} className="back-btn">
            ← Back
          </button>
          <h1>Dashboard Links</h1>
        </div>

        {error && (
          <div className="error-message">
            {error}
          </div>
        )}

        {links.length > 0 ? (
          <div className="dashboards-grid">
            {links.map((link) => (
              <div 
                key={link.id} 
                className="dashboard-card"
                onClick={() => handleLinkClick(link.url)}
              >
                <div className="dashboard-card-left">
                  <div className="dashboard-icon">
                    {link.title === 'Reporting' && '📝'}
                    {link.title === 'Dashboard' && '📊'}
                    {link.title === 'Analytics' && '📊'}
                    {link.title === 'Development' && '💻'}
                    {!['Reporting', 'Dashboard', 'Analytics', 'Development'].includes(link.title) && '📄'}
                  </div>
                  <h3 className="dashboard-title">{link.title}</h3>
                </div>
                <p className="dashboard-description">{link.description}</p>
              </div>
            ))}
          </div>
        ) : (
          <div className="no-dashboards">
            <p>No dashboard links available at the moment.</p>
          </div>
        )}
      </div>
    </div>
  );
};

export default DashboardLinksPage;
