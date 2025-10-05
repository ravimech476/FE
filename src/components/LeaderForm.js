import React, { useState, useEffect } from 'react';
import userService from '../services/userService';
import { API_BASE_URL } from '../services/api';
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
  const [users, setUsers] = useState([]);
  const [imagePreview, setImagePreview] = useState(null);
  const [errors, setErrors] = useState({});
  const [submitting, setSubmitting] = useState(false);
  const [loadingUsers, setLoadingUsers] = useState(false);

  useEffect(() => {
    fetchUsers();
  }, []);

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
        setImagePreview(`${API_BASE_URL}${leader.image}`);
      }
    }
  }, [leader]);

  const fetchUsers = async () => {
    try {
      setLoadingUsers(true);
      console.log('🔄 Fetching users for dropdown...');
      
      const data = await userService.getAllUsers();
      console.log('✅ Users fetched:', data);
      
      if (Array.isArray(data)) {
        setUsers(data);
        console.log('✅ Users loaded for datalist:', data.length);
      }
    } catch (err) {
      console.error('❌ Error loading users:', err);
      // Continue anyway - user can still type manually
    } finally {
      setLoadingUsers(false);
    }
  };

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
      setImagePreview(`${API_BASE_URL}${leader.image}`);
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

          {/* Name - Combo Box (Dropdown + Text Input) */}
          <div className="form-group">
            <label htmlFor="name">Name *</label>
            <input
              type="text"
              id="name"
              name="name"
              value={formData.name}
              onChange={handleChange}
              className={errors.name ? 'error' : ''}
              placeholder="Select from list or type name"
              list="users-datalist"
              autoComplete="off"
            />
            <datalist id="users-datalist">
              {users.map(user => (
                <option key={user.id} value={user.full_name}>
                  {user.display_name}
                </option>
              ))}
            </datalist>
            {errors.name && <span className="error-text">{errors.name}</span>}
            <small className="help-text">
              {loadingUsers 
                ? 'Loading users...' 
                : users.length > 0 
                  ? `Type or select from ${users.length} users`
                  : 'Enter leader\'s name'
              }
            </small>
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
