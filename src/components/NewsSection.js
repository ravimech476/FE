import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import newsService from '../services/newsService';
import { API_BASE_URL } from '../services/api';
import './NewsSection.css';

const NewsSection = () => {
  const navigate = useNavigate();
  const [newsItems, setNewsItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isExpanded, setIsExpanded] = useState(false);

  useEffect(() => {
    fetchNews();
  }, []);

  const fetchNews = async () => {
    try {
      setLoading(true);
      const data = await newsService.getAllNews();
      setNewsItems(data);
      setError(null);
    } catch (err) {
      console.error('Error loading news:', err);
      setError('Failed to load news');
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
    navigate(`/news/${newsId}`);
  };

  const toggleExpand = () => {
    setIsExpanded(!isExpanded);
  };

  // Show only 4 items initially, all items when expanded
  const displayedNews = isExpanded ? newsItems : newsItems.slice(0, 4);
  const hasMoreNews = newsItems.length > 4;

  if (loading) {
    return (
      <section className="news-section">
        <h2 className="section-title text-orange">Company news</h2>
        <div className="loading-message">Loading news...</div>
      </section>
    );
  }

  if (error) {
    return (
      <section className="news-section">
        <h2 className="section-title text-orange">Company news</h2>
        <div className="error-message">{error}</div>
      </section>
    );
  }

  if (newsItems.length === 0) {
    return (
      <section className="news-section">
        <h2 className="section-title text-orange">Company news</h2>
        <div className="no-news-message">No news available</div>
      </section>
    );
  }

  return (
    <section className="news-section">
      <h2 className="section-title text-orange">Company news</h2>
      <div className={`news-grid-container ${isExpanded ? 'expanded' : ''}`}>
        <div className="news-grid">
          {displayedNews.map(item => {
            const imageUrl = item.image 
              ? `${API_BASE_URL}${item.image}` 
              : 'https://images.unsplash.com/photo-1562088287-bde35a1ea917?w=400&h=250&fit=crop';
            
            return (
              <div 
                key={item.id} 
                className="news-card"
                onClick={() => handleCardClick(item.id)}
              >
                <div className="news-image-wrapper">
                  <img 
                    src={imageUrl} 
                    alt={item.title} 
                    className="news-image"
                    onError={(e) => {
                      e.target.src = 'https://images.unsplash.com/photo-1562088287-bde35a1ea917?w=400&h=250&fit=crop';
                    }}
                  />
                  <div className="news-overlay">
                    <h3 className="news-title">{item.title}</h3>
                    {item.excerpt && (
                      <p className="news-excerpt">{item.excerpt}</p>
                    )}
                    {item.published_date && (
                      <span className="news-date">{formatDate(item.published_date)}</span>
                    )}
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </div>
      
      {hasMoreNews && (
        <div className="news-expand-section">
          <button 
            className="expand-news-btn"
            onClick={toggleExpand}
          >
            {isExpanded ? 'Show Less' : 'Read More'}
          </button>
        </div>
      )}
    </section>
  );
};

export default NewsSection;
