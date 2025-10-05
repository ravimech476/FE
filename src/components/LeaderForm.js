import React, { useState, useEffect } from 'react';
import './LeadersManagement.css';

const LeaderForm = ({ leader, onSubmit, onCancel }) => {
  const [formData, setFormData] = useState({
    name: '',
    title: '',
    description: '',
    icon: '',
    display_order: 0,
    status: 'active',
    image: null
  });
  const [imagePreview, setImagePreview] = useState(null);
  const [errors, setErrors] = useState({});
  const [submitting, setSubmitting] = useState(false);

  const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000';

  useEffect(() => {
    if (leader) {
      setFormData({
        name: leader.name || '',
        title: leader.title || '',
        description: leader.description || '',
        icon: leader.icon || '',
        display_order: leader.display_order || 0,
        status: leader.status || 'active',
        image: null
      });
      if (leader.image) {
        setImagePreview(`${API_URL}${leader.image}`);
      }
    }
  }, [leader, API_URL]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
    // Clear error for this field
    if (errors[name]) {
      setErrors(prev => ({ ...prev, [name]: '' }));
    }
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      // Validate file type
      if (!file.type.startsWith('image/')) {
        setErrors(prev => ({ ...prev, image: 'Please select an image file' }));
        return;
      }
      
      // Validate file size (5MB)
      if (file.size > 5 * 1024 * 1024) {
        setErrors(prev => ({ ...prev, image: 'Image size should be less than 5MB' }));
        return;
      }

      setFormData(prev => ({
        ...prev,
        image: file
      }));

      // Create preview
      const reader = new FileReader();
      reader.onloadend = () => {
        setImagePreview(reader.result);
      };
      reader.readAsDataURL(file);

      // Clear image error
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
    // If editing, keep the existing image preview if available
    if (leader && leader.image) {
      setImagePreview(`${API_URL}${leader.image}`);
    }
  };

  const validate = () => {
    const newErrors = {};

    if (!formData.name.trim()) {
      newErrors.name = 'Name is required';
    }

    if (!formData.title.trim()) {
      newErrors.title = 'Title is required';
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
    <div className="leader-form-container">
      <h2>{leader ? 'Edit Leader' : 'Add New Leader'}</h2>
      <form onSubmit={handleSubmit} className="leader-form">
        <div className="form-grid">
          {/* Image Upload */}
          <div className="form-group full-width">
            <label>Profile Image</label>
            <div className="image-upload-container">
              {imagePreview ? (
                <div className="image-preview-wrapper">
                  <img src={imagePreview} alt="Preview" className="image-preview" />
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
                id="image-input"
              />
              <label htmlFor="image-input" className="file-input-label">
                {imagePreview ? 'Change Image' : 'Choose Image'}
              </label>
            </div>
            {errors.image && <span className="error-text">{errors.image}</span>}
            <small className="help-text">Max size: 5MB. Formats: JPG, PNG, GIF</small>
          </div>

          {/* Name */}
          <div className="form-group">
            <label htmlFor="name">Name *</label>
            <input
              type="text"
              id="name"
              name="name"
              value={formData.name}
              onChange={handleChange}
              className={errors.name ? 'error' : ''}
              placeholder="Enter leader's name"
            />
            {errors.name && <span className="error-text">{errors.name}</span>}
          </div>

          {/* Title */}
          <div className="form-group">
            <label htmlFor="title">Title/Designation *</label>
            <input
              type="text"
              id="title"
              name="title"
              value={formData.title}
              onChange={handleChange}
              className={errors.title ? 'error' : ''}
              placeholder="e.g., CEO, Managing Director"
            />
            {errors.title && <span className="error-text">{errors.title}</span>}
          </div>

          {/* Icon */}
          <div className="form-group">
            <label htmlFor="icon">Icon (Optional)</label>
            <input
              type="text"
              id="icon"
              name="icon"
              value={formData.icon}
              onChange={handleChange}
              placeholder="e.g., 👤 or emoji"
              maxLength="10"
            />
            <small className="help-text">Used as fallback if no image</small>
          </div>

          {/* Display Order */}
          <div className="form-group">
            <label htmlFor="display_order">Display Order</label>
            <input
              type="number"
              id="display_order"
              name="display_order"
              value={formData.display_order}
              onChange={handleChange}
              min="0"
            />
            <small className="help-text">Lower numbers appear first</small>
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

          {/* Description */}
          <div className="form-group full-width">
            <label htmlFor="description">Description (Optional)</label>
            <textarea
              id="description"
              name="description"
              value={formData.description}
              onChange={handleChange}
              rows="4"
              placeholder="Brief description about the leader"
            ></textarea>
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
            {submitting ? 'Saving...' : (leader ? 'Update Leader' : 'Create Leader')}
          </button>
        </div>
      </form>
    </div>
  );
};

export default LeaderForm;
