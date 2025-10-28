import React, { useState, useEffect } from 'react';
import heroService from '../services/heroService';
import { API_BASE_URL } from '../services/api';
import './HeroManagement.css';

const HeroManagement = () => {
  const [heroes, setHeroes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [editingHero, setEditingHero] = useState(null);
  const [formData, setFormData] = useState({
    title: '',
    image: null,
    imagePreview: null
  });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    fetchHeroes();
  }, []);

  const fetchHeroes = async () => {
    try {
      setLoading(true);
      const data = await heroService.getAll();
      setHeroes(data);
    } catch (error) {
      setError('Failed to fetch hero sections');
    } finally {
      setLoading(false);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      // Validate file type
      if (!file.type.startsWith('image/')) {
        setError('Please select an image file');
        return;
      }

      // Validate file size (5MB)
      if (file.size > 5 * 1024 * 1024) {
        setError('Image size should be less than 5MB');
        return;
      }

      setFormData(prev => ({
        ...prev,
        image: file,
        imagePreview: URL.createObjectURL(file)
      }));
      setError('');
    }
  };

  const resetForm = () => {
    setFormData({
      title: '',
      image: null,
      imagePreview: null
    });
    setEditingHero(null);
    setShowForm(false);
    setError('');
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');

    if (!formData.title.trim()) {
      setError('Title is required');
      return;
    }

    try {
      const heroData = {
        title: formData.title,
        image: formData.image,
        is_active: true
      };

      if (editingHero) {
        await heroService.update(editingHero.id, heroData);
        setSuccess('Hero section updated successfully!');
      } else {
        await heroService.create(heroData);
        setSuccess('Hero section created successfully!');
      }

      resetForm();
      fetchHeroes();
    } catch (error) {
      setError(error.response?.data?.error || 'Failed to save hero section');
    }
  };

  const handleEdit = (hero) => {
    setEditingHero(hero);
    setFormData({
      title: hero.title,
      image: null,
      imagePreview: getImageUrl(hero.image)
    });
    setShowForm(true);
    setError('');
    setSuccess('');
  };

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure you want to delete this hero section?')) {
      return;
    }

    try {
      await heroService.delete(id);
      setSuccess('Hero section deleted successfully!');
      fetchHeroes();
    } catch (error) {
      setError(error.response?.data?.error || 'Failed to delete hero section');
    }
  };

  const handleSetActive = async (id) => {
    try {
      await heroService.setActive(id);
      setSuccess('Hero section activated successfully!');
      fetchHeroes();
    } catch (error) {
      setError('Failed to activate hero section');
    }
  };

  const getImageUrl = (imagePath) => {
    if (!imagePath) return null;
    if (imagePath.startsWith('http')) return imagePath;
    return `${API_BASE_URL}${imagePath}`;
  };

  if (loading) {
    return <div className="loading">Loading...</div>;
  }

  return (
    <div className="hero-management">
      <div className="management-header">
        <h1>Hero Section Management</h1>
        <button 
          className="btn-primary"
          onClick={() => {
            resetForm();
            setShowForm(true);
          }}
        >
          + Add New Hero
        </button>
      </div>

      {error && <div className="alert alert-error">{error}</div>}
      {success && <div className="alert alert-success">{success}</div>}

      {/* Form Modal */}
      {showForm && (
        <div className="modal-overlay" onClick={resetForm}>
          <div className="modal-content" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <h2>{editingHero ? 'Edit Hero Section' : 'Create New Hero Section'}</h2>
              <button className="close-btn" onClick={resetForm}>&times;</button>
            </div>

            <form onSubmit={handleSubmit} className="hero-form">
              <div className="form-group">
                <label>Title *</label>
                <textarea
                  name="title"
                  value={formData.title}
                  onChange={handleInputChange}
                  placeholder="Enter hero section title"
                  rows="4"
                  required
                />
              </div>

              <div className="form-group">
                <label>Background Image</label>
                <input
                  type="file"
                  accept="image/*"
                  onChange={handleImageChange}
                />
                <small>Max size: 5MB. Recommended: 1600x400px</small>
              </div>

              {formData.imagePreview && (
                <div className="image-preview">
                  <img src={formData.imagePreview} alt="Preview" />
                </div>
              )}

              <div className="form-actions">
                <button type="button" className="btn-secondary" onClick={resetForm}>
                  Cancel
                </button>
                <button type="submit" className="btn-primary">
                  {editingHero ? 'Update' : 'Create'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Heroes List */}
      <div className="heroes-list">
        {heroes.length === 0 ? (
          <div className="no-data">
            <p>No hero sections found. Create your first one!</p>
          </div>
        ) : (
          <div className="heroes-grid">
            {heroes.map((hero) => (
              <div key={hero.id} className={`hero-card ${hero.is_active ? 'active' : ''}`}>
                {hero.is_active && (
                  <span className="active-badge">Active</span>
                )}
                
                <div className="hero-image">
                  {hero.image ? (
                    <img src={getImageUrl(hero.image)} alt={hero.title} />
                  ) : (
                    <div className="no-image">No Image</div>
                  )}
                </div>

                <div className="hero-content">
                  <h3>{hero.title}</h3>
                  <p className="hero-meta">
                    Created by: {hero.created_by_username || 'Unknown'}
                  </p>
                </div>

                <div className="hero-actions">
                  {!hero.is_active && (
                    <button
                      className="btn-activate"
                      onClick={() => handleSetActive(hero.id)}
                    >
                      Set Active
                    </button>
                  )}
                  <button
                    className="btn-edit"
                    onClick={() => handleEdit(hero)}
                  >
                    Edit
                  </button>
                  {!hero.is_active && (
                    <button
                      className="btn-delete"
                      onClick={() => handleDelete(hero.id)}
                    >
                      Delete
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default HeroManagement;
