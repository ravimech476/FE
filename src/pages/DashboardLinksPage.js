import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import dashboardService from '../services/dashboardService';
import './DashboardLinksPage.css';

const DashboardLinksPage = () => {
  const navigate = useNavigate();
  const [categoriesData, setCategoriesData] = useState([]);
  const [expandedCategories, setExpandedCategories] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    loadDashboardLinks();
  }, []);

  const loadDashboardLinks = async () => {
    try {
      setLoading(true);
      const response = await dashboardService.getLinksByCategory();
      setCategoriesData(response.data || []);
    } catch (err) {
      console.error('Failed to load dashboard links:', err);
      setError('Failed to load dashboard links');
    } finally {
      setLoading(false);
    }
  };

  const toggleCategory = (categoryId) => {
    setExpandedCategories(prev => ({
      ...prev,
      [categoryId]: !prev[categoryId]
    }));
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

        {categoriesData.length > 0 ? (
          <div className="categories-container">
            {categoriesData.map((category) => (
              <div key={category.category_id} className="category-section">
                {/* Category Header - Clickable to expand/collapse */}
                <div 
                  className={`category-header ${expandedCategories[category.category_id] ? 'expanded' : ''}`}
                  onClick={() => toggleCategory(category.category_id)}
                >
                  <div className="category-header-left">
                    <span className="category-icon">📁</span>
                    <h2 className="category-title">{category.category_name}</h2>
                  </div>
                  <span className="expand-icon">
                    {expandedCategories[category.category_id] ? '▼' : '▶'}
                  </span>
                </div>

                {/* Subcategories - Show when category is expanded */}
                {expandedCategories[category.category_id] && (
                  <div className="subcategories-container">
                    {category.subcategories && category.subcategories.length > 0 ? (
                      <div className="subcategories-grid">
                        {category.subcategories.map((subcategory) => (
                          subcategory.links && subcategory.links.length > 0 && subcategory.links.map((link) => (
                            <div 
                              key={link.id}
                              className="subcategory-card"
                              onClick={() => handleLinkClick(link.url)}
                            >
                              <div className="subcategory-header">
                                <span className="subcategory-icon">📄</span>
                                <h3 className="subcategory-title">{subcategory.subcategory_name}</h3>
                              </div>
                              <div className="subcategory-content">
                                <p className="link-title">{link.title}</p>
                                {link.description && (
                                  <p className="link-description">{link.description}</p>
                                )}
                              </div>
                              <div className="subcategory-footer">
                                <span className="open-link">Open Link →</span>
                              </div>
                            </div>
                          ))
                        ))}
                      </div>
                    ) : (
                      <p className="no-subcategories">No links available in this category</p>
                    )}
                  </div>
                )}
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
