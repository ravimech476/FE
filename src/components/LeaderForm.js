import React, { useState, useEffect } from 'react';
import userService from '../services/userService';
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
  const [userError, setUserError] = useState(null);

  const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000';

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
        setImagePreview(`${API_URL}${leader.image}`);
      }
    }
  }, [leader, API_URL]);

  const fetchUsers = async () => {
    try {
      setLoadingUsers(true);
      setUserError(null);
      console.log('🔄 Fetching users...');
      
      const data = await userService.getAllUsers();
      console.log('✅ Users fetched:', data);
      console.log('📊 Number of users:', data?.length || 0);
      
      if (Array.isArray(data)) {
        setUsers(data);
        console.log('✅ Users set in state:', data.length);
      } else {
        console.error('❌ Data is not an array:', data);
        setUserError('Invalid data format received');
      }
    } catch (err) {
      console.error('❌ Error loading users:', err);
      console.error('Error details:', err.response?.data || err.message);
      setUserError(err.response?.data?.error || err.message || 'Failed to load users');
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

  const handleUserSelect = (e) => {
    const userId = e.target.value;
    console.log('👤 User selected, ID:', userId);
    
    if (userId) {
      const selectedUser = users.find(u => u.id === parseInt(userId));
      console.log('👤 Found user:', selectedUser);
      
      if (selectedUser) {
        setFormData(prev => ({
          ...prev,
          name: selectedUser.full_name
        }));
        console.log('✅ Name auto-filled:', selectedUser.full_name);
      }
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

          {/* User Selection Dropdown */}
          <div className="form-group full-width">
            <label htmlFor="user-select">Select User (Optional)</label>
            {userError ? (
              <div className="user-error-message">
                ⚠️ {userError}
              </div>
            ) : (
              <select
                id="user-select"
                onChange={handleUserSelect}
                disabled={loadingUsers}
                className="user-select-dropdown"
              >
                <option value="">
                  {loadingUsers 
                    ? 'Loading users...' 
                    : users.length === 0 
                      ? 'No users available'
                      : '-- Select a user to auto-fill name --'
                  }
                </option>
                {users.map(user => (
                  <option key={user.id} value={user.id}>
                    {user.display_name}
                  </option>
                ))}
              </select>
            )}
            <small className="help-text">
              {loadingUsers 
                ? 'Loading users...' 
                : userError 
                  ? 'Unable to load users. You can still enter name manually below.'
                  : users.length > 0 
                    ? `${users.length} users available - Select one or enter name manually below`
                    : 'No users found. Enter name manually below.'
              }
            </small>
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
