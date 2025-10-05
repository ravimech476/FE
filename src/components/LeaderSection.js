import React, { useState, useEffect } from 'react';
import leaderService from '../services/leaderService';
import { API_BASE_URL } from '../services/api';
import './LeaderSection.css';

const LeaderSection = () => {
  const [leaders, setLeaders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

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
        {leaders.map(leader => {
          const imageUrl = leader.image ? `${API_BASE_URL}${leader.image}` : null;
          console.log('Leader:', leader.name);
          console.log('Image path from DB:', leader.image);
          console.log('Full image URL:', imageUrl);
          
          return (
          <div key={leader.id} className="leader-card">
            {leader.image ? (
              <img 
                src={imageUrl}
                alt={leader.name} 
                className="leader-image" 
                onError={(e) => {
                  console.error('Image failed to load:', imageUrl);
                  e.target.src = 'https://i.pravatar.cc/150?img=33';
                }}
                onLoad={() => {
                  console.log('✅ Image loaded successfully:', imageUrl);
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
        )})}
      </div>
    </section>
  );
};

export default LeaderSection;
