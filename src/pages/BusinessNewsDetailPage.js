import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import businessNewsService from '../services/businessNewsService';
import { API_BASE_URL } from '../services/api';
import './BusinessNewsDetailPage.css';

const BusinessNewsDetailPage = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [news, setNews] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchNews();
  }, [id]);

  const fetchNews = async () => {
    try {
      setLoading(true);
      const data = await businessNewsService.getById(id);
      setNews(data);
    } catch (error) {
      setError('Failed to load business news');
      console.error('Error fetching business news:', error);
    } finally {
      setLoading(false);
    }
  };

  const getImageUrl = (imagePath) => {
    if (!imagePath) return null;
    if (imagePath.startsWith('http')) return imagePath;
    return `${API_BASE_URL}${imagePath}`;
  };

  const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
  };

  if (loading) {
    return <div className="loading">Loading business news...</div>;
  }

  if (error || !news) {
    return (
      <div className="error-container">
        <h2>Business News Not Found</h2>
        <p>{error || 'The business news you are looking for does not exist.'}</p>
        <button onClick={() => navigate('/')} className="btn-back">
          Back to Home
        </button>
      </div>
    );
  }

  return (
    <div className="business-news-detail-page">
      <div className="news-detail-container">
        <button onClick={() => navigate('/')} className="btn-back">
          ← Back to Home
        </button>

        <article className="news-article">
          {news.image && (
            <div className="news-hero-image">
              <img src={getImageUrl(news.image)} alt={news.title} />
            </div>
          )}

          <div className="news-header">
            <h1 className="news-title">{news.title}</h1>
            
            <div className="news-meta">
              {news.category && (
                <span className="news-category">{news.category}</span>
              )}
              <span className="news-date">
                {formatDate(news.published_date || news.created_date)}
              </span>
              {news.created_by_username && (
                <span className="news-author">By {news.created_by_username}</span>
              )}
            </div>
          </div>

          {news.excerpt && (
            <div className="news-excerpt">
              <p>{news.excerpt}</p>
            </div>
          )}

          <div className="news-content">
            <div dangerouslySetInnerHTML={{ __html: news.content }} />
          </div>
        </article>
      </div>
    </div>
  );
};

export default BusinessNewsDetailPage;
