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
  const [isExpanded, setIsExpanded] = useState(false);

  useEffect(() => {
    fetchBusinessNews();
  }, []);

  const fetchBusinessNews = async () => {
    try {
      setLoading(true);
      const data = await businessNewsService.getAll();
      setNewsItems(data);
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

  const handleCardClick = (newsId) => {
    navigate(`/business-news/${newsId}`);
  };

  const toggleExpand = () => {
    setIsExpanded(!isExpanded);
  };

  // Show only 4 items initially, all items when expanded
  const displayedNews = isExpanded ? newsItems : newsItems.slice(0, 4);
  const hasMoreNews = newsItems.length > 4;

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
      <div className={`business-news-grid-container ${isExpanded ? 'expanded' : ''}`}>
        <div className="business-news-grid">
          {displayedNews.map(item => {
            const imageUrl = item.image 
              ? `${API_BASE_URL}${item.image}` 
              : 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=250&fit=crop';
            
            return (
              <div 
                key={item.id} 
                className="business-news-card"
                onClick={() => handleCardClick(item.id)}
              >
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
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </div>
      
      {hasMoreNews && (
        <div className="business-news-expand-section">
          <button 
            className="expand-business-news-btn"
            onClick={toggleExpand}
          >
            {isExpanded ? 'Show Less' : 'Read More'}
          </button>
        </div>
      )}
    </section>
  );
};

export default BusinessNewsSection;
