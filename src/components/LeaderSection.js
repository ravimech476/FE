import React, { useState, useEffect } from 'react';
import leaderService from '../services/leaderService';
import './LeaderSection.css';

const LeaderSection = () => {
  const [leaders, setLeaders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000';

  useEffect(() => {
    fetchLeaders();
  }, []);

  const fetchLeaders = async () => {
    try {
      setLoading(true);
      const data = await leaderService.getAllLeaders();
      setLeaders(data);
      setError(null);
    } catch (err) {
      console.error('Error loading leaders:', err);
      setError('Failed to load leaders');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="leader-section">
        <h2 className="section-title text-orange">Meet our leaders</h2>
        <div className="loading-message">Loading leaders...</div>
      </section>
    );
  }

  if (error) {
    return (
      <section className="leader-section">
        <h2 className="section-title text-orange">Meet our leaders</h2>
        <div className="error-message">{error}</div>
      </section>
    );
  }

  if (leaders.length === 0) {
    return (
      <section className="leader-section">
        <h2 className="section-title text-orange">Meet our leaders</h2>
        <div className="no-leaders-message">No leaders found</div>
      </section>
    );
  }

  return (
    <section className="leader-section">
      <h2 className="section-title text-orange">Meet our leaders</h2>
      <div className="leaders-grid">
        {leaders.map(leader => (
          <div key={leader.id} className="leader-card">
            {leader.image ? (
              <img 
                src={`${API_URL}${leader.image}`} 
                alt={leader.name} 
                className="leader-image" 
                onError={(e) => {
                  e.target.src = 'https://i.pravatar.cc/150?img=33';
                }}
              />
            ) : (
              <div className="leader-image-placeholder">
                {leader.icon || '👤'}
              </div>
            )}
            <h3 className="leader-name">{leader.name}</h3>
            <h4 className="leader-title-designation">{leader.title}</h4>
            {leader.description && (
              <p className="leader-description">{leader.description}</p>
            )}
          </div>
        ))}
      </div>
    </section>
  );
};

export default LeaderSection;
