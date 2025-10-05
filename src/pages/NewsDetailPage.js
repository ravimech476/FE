import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import newsService from '../services/newsService';
import { API_BASE_URL } from '../services/api';
import './NewsDetailPage.css';

const NewsDetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [news, setNews] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchNewsDetail();
  }, [id]);

  const fetchNewsDetail = async () => {
    try {
      setLoading(true);
      const data = await newsService.getNews(id);
      setNews(data);
      setError(null);
    } catch (err) {
      console.error('Error loading news detail:', err);
      setError('Failed to load news');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString) => {
    if (!dateString) return '';
    return new Date(dateString).toLocaleDateString('en-US', {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  };

  if (loading) {
    return (
      <div className="news-detail-page">
        <div className="container">
          <div className="loading-message">Loading news...</div>
        </div>
      </div>
    );
  }

  if (error || !news) {
    return (
      <div className="news-detail-page">
        <div className="container">
          <div className="error-message">
            {error || 'News not found'}
          </div>
          <button onClick={() => navigate('/')} className="btn-back">
            ← Back to Home
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="news-detail-page">
      <div className="container">
        <button onClick={() => navigate('/')} className="btn-back">
          ← Back to Home
        </button>

        <article className="news-detail">
          {news.image && (
            <div className="news-detail-image-wrapper">
              <img
                src={`${API_BASE_URL}${news.image}`}
                alt={news.title}
                className="news-detail-image"
                onError={(e) => {
                  e.target.style.display = 'none';
                }}
              />
            </div>
          )}

          <div className="news-detail-header">
            <h1 className="news-detail-title">{news.title}</h1>
            
            <div className="news-detail-meta">
              {news.published_date && (
                <span className="news-detail-date">
                  📅 {formatDate(news.published_date)}
                </span>
              )}
              {news.created_by_username && (
                <span className="news-detail-author">
                  ✍️ By {news.created_by_username}
                </span>
              )}
            </div>
          </div>

          <div className="news-detail-content">
            {news.excerpt && (
              <div className="news-detail-excerpt">
                {news.excerpt}
              </div>
            )}
            
            <div className="news-detail-body">
              {news.content.split('\n').map((paragraph, index) => (
                paragraph.trim() && <p key={index}>{paragraph}</p>
              ))}
            </div>
          </div>
        </article>
      </div>
    </div>
  );
};

export default NewsDetailPage;
