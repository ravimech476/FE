import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import businessNewsService from '../services/businessNewsService';
import { API_BASE_URL } from '../services/api';
import './BusinessNewsSection.css';

const BusinessNewsSection = () => {
  const navigate = useNavigate();
  const [newsItems, setNewsItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchBusinessNews();
  }, []);

  const fetchBusinessNews = async () => {
    try {
      setLoading(true);
      const data = await businessNewsService.getAll();
      // Limit to 4 most recent business news items for the homepage
      setNewsItems(data.slice(0, 4));
      setError(null);
    } catch (err) {
      console.error('Error loading business news:', err);
      setError('Failed to load business news');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString) => {
    if (!dateString) return '';
    return new Date(dateString).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric'
    });
  };

  const handleReadMore = (newsId) => {
    navigate(`/business-news/${newsId}`);
  };

  if (loading) {
    return (
      <section className="business-news-section">
        <h2 className="section-title text-blue">Business News</h2>
        <div className="loading-message">Loading business news...</div>
      </section>
    );
  }

  if (error) {
    return (
      <section className="business-news-section">
        <h2 className="section-title text-blue">Business News</h2>
        <div className="error-message">{error}</div>
      </section>
    );
  }

  if (newsItems.length === 0) {
    return (
      <section className="business-news-section">
        <h2 className="section-title text-blue">Business News</h2>
        <div className="no-news-message">No business news available</div>
      </section>
    );
  }

  return (
    <section className="business-news-section">
      <h2 className="section-title text-blue">Business News</h2>
      <div className="business-news-grid">
        {newsItems.map(item => {
          const imageUrl = item.image 
            ? `${API_BASE_URL}${item.image}` 
            : 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=250&fit=crop';
          
          return (
            <div key={item.id} className="business-news-card">
              <div className="business-news-image-wrapper">
                <img 
                  src={imageUrl} 
                  alt={item.title} 
                  className="business-news-image"
                  onError={(e) => {
                    e.target.src = 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=250&fit=crop';
                  }}
                />
                <div className="business-news-overlay">
                  <h3 className="business-news-title">{item.title}</h3>
                  {item.excerpt && (
                    <p className="business-news-excerpt">{item.excerpt}</p>
                  )}
                  {item.published_date && (
                    <span className="business-news-date">{formatDate(item.published_date)}</span>
                  )}
                  <button 
                    className="read-more-btn"
                    onClick={() => handleReadMore(item.id)}
                  >
                    Read More
                  </button>
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </section>
  );
};

export default BusinessNewsSection;
