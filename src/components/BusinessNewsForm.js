import React, { useState, useEffect } from 'react';
import { API_BASE_URL } from '../services/api';
import './BusinessNewsManagement.css';

const BusinessNewsForm = ({ news, onSubmit, onCancel }) => {
  const [formData, setFormData] = useState({
    title: '',
    content: '',
    excerpt: '',
    category: '',
    display_order: 0,
    status: 'active',
    published_date: '',
    image: null
  });
  const [imagePreview, setImagePreview] = useState(null);
  const [errors, setErrors] = useState({});
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    if (news) {
      setFormData({
        title: news.title || '',
        content: news.content || '',
        excerpt: news.excerpt || '',
        category: news.category || '',
        display_order: news.display_order || 0,
        status: news.status || 'active',
        published_date: news.published_date ? new Date(news.published_date).toISOString().split('T')[0] : '',
        image: null
      });
      if (news.image) {
        setImagePreview(`${API_BASE_URL}${news.image}`);
      }
    } else {
      // Set today's date for new news
      const today = new Date().toISOString().split('T')[0];
      setFormData(prev => ({ ...prev, published_date: today }));
    }
  }, [news]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
    if (errors[name]) {
      setErrors(prev => ({ ...prev, [name]: '' }));
    }
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      if (!file.type.startsWith('image/')) {
        setErrors(prev => ({ ...prev, image: 'Please select an image file' }));
        return;
      }
      
      if (file.size > 5 * 1024 * 1024) {
        setErrors(prev => ({ ...prev, image: 'Image size should be less than 5MB' }));
        return;
      }

      setFormData(prev => ({
        ...prev,
        image: file
      }));

      const reader = new FileReader();
      reader.onloadend = () => {
        setImagePreview(reader.result);
      };
      reader.readAsDataURL(file);

      if (errors.image) {
        setErrors(prev => ({ ...prev, image: '' }));
      }
    }
  };

  const removeImage = () => {
    setFormData(prev => ({
      ...prev,
      image: null
    }));
    setImagePreview(null);
    if (news && news.image) {
      setImagePreview(`${API_BASE_URL}${news.image}`);
    }
  };

  const validate = () => {
    const newErrors = {};

    if (!formData.title.trim()) {
      newErrors.title = 'Title is required';
    }

    if (!formData.content.trim()) {
      newErrors.content = 'Content is required';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validate()) {
      return;
    }

    setSubmitting(true);
    try {
      await onSubmit(formData);
    } catch (error) {
      console.error('Form submission error:', error);
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="news-form-container">
      <h2>{news ? 'Edit Business News' : 'Add New Business News'}</h2>
      <form onSubmit={handleSubmit} className="news-form">
        <div className="form-grid">
          {/* Image Upload */}
          <div className="form-group full-width">
            <label>Business News Image</label>
            <div className="image-upload-container">
              {imagePreview ? (
                <div className="image-preview-wrapper">
                  <img src={imagePreview} alt="Preview" className="image-preview news-image-preview" />
                  <button
                    type="button"
                    className="btn-remove-image"
                    onClick={removeImage}
                  >
                    ✕
                  </button>
                </div>
              ) : (
                <div className="image-placeholder">
                  <span>📷</span>
                  <p>No image selected</p>
                </div>
              )}
              <input
                type="file"
                accept="image/*"
                onChange={handleImageChange}
                className="file-input"
                id="business-news-image-input"
              />
              <label htmlFor="business-news-image-input" className="file-input-label">
                {imagePreview ? 'Change Image' : 'Choose Image'}
              </label>
            </div>
            {errors.image && <span className="error-text">{errors.image}</span>}
            <small className="help-text">Max size: 5MB. Formats: JPG, PNG, GIF</small>
          </div>

          {/* Title */}
          <div className="form-group full-width">
            <label htmlFor="title">Title *</label>
            <input
              type="text"
              id="title"
              name="title"
              value={formData.title}
              onChange={handleChange}
              className={errors.title ? 'error' : ''}
              placeholder="Enter business news title"
            />
            {errors.title && <span className="error-text">{errors.title}</span>}
          </div>

          {/* Excerpt */}
          <div className="form-group full-width">
            <label htmlFor="excerpt">Excerpt (Optional)</label>
            <textarea
              id="excerpt"
              name="excerpt"
              value={formData.excerpt}
              onChange={handleChange}
              rows="2"
              placeholder="Brief summary (shown in news list)"
            ></textarea>
            <small className="help-text">Short description shown in preview</small>
          </div>

          {/* Content */}
          <div className="form-group full-width">
            <label htmlFor="content">Content *</label>
            <textarea
              id="content"
              name="content"
              value={formData.content}
              onChange={handleChange}
              className={errors.content ? 'error' : ''}
              rows="6"
              placeholder="Enter business news content"
            ></textarea>
            {errors.content && <span className="error-text">{errors.content}</span>}
          </div>

          {/* Category */}
          <div className="form-group">
            <label htmlFor="category">Category (Optional)</label>
            <input
              type="text"
              id="category"
              name="category"
              value={formData.category}
              onChange={handleChange}
              placeholder="e.g., Market Update, Industry News"
            />
          </div>

          {/* Published Date */}
          <div className="form-group">
            <label htmlFor="published_date">Published Date</label>
            <input
              type="date"
              id="published_date"
              name="published_date"
              value={formData.published_date}
              onChange={handleChange}
            />
          </div>

          {/* Status */}
          <div className="form-group">
            <label htmlFor="status">Status</label>
            <select
              id="status"
              name="status"
              value={formData.status}
              onChange={handleChange}
            >
              <option value="active">Active</option>
              <option value="inactive">Inactive</option>
            </select>
          </div>
        </div>

        <div className="form-actions">
          <button
            type="button"
            className="btn-secondary"
            onClick={onCancel}
            disabled={submitting}
          >
            Cancel
          </button>
          <button
            type="submit"
            className="btn-primary"
            disabled={submitting}
          >
            {submitting ? 'Saving...' : (news ? 'Update Business News' : 'Create Business News')}
          </button>
        </div>
      </form>
    </div>
  );
};

export default BusinessNewsForm;
