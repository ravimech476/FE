import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import blogService from '../services/blogService';
import './BlogEditor.css';

const BlogEditor = () => {
    const { id } = useParams();
    const navigate = useNavigate();
    const { user } = useAuth();
    const [loading, setLoading] = useState(false);
    const [saving, setSaving] = useState(false);
    const [categories, setCategories] = useState([]);
    const [formData, setFormData] = useState({
        title: '',
        content: '',
        excerpt: '',
        featured_image: '',
        image: null,
        status: 'draft',
        categories: []
    });
    const [imagePreview, setImagePreview] = useState(null);
    const [error, setError] = useState('');
    const [success, setSuccess] = useState('');

    useEffect(() => {
        loadCategories();
        if (id) {
            loadPost();
        }
    }, [id]);

    const loadCategories = async () => {
        try {
            const response = await blogService.getAllCategories();
            setCategories(response.categories || []);
        } catch (err) {
            console.error('Failed to load categories:', err);
        }
    };

    const loadPost = async () => {
        try {
            setLoading(true);
            const response = await blogService.getPost(id);
            const post = response.post;
            
            if (post.author_id !== user.id && user.role !== 'admin') {
                setError('You are not authorized to edit this post');
                return;
            }
            
            // Set form data with category IDs from the post
            setFormData({
                title: post.title || '',
                content: post.content || '',
                excerpt: post.excerpt || '',
                featured_image: post.featured_image || '',
                image: null,
                status: post.status || 'draft',
                categories: post.category_ids || [] // Use category_ids from backend
            });
            
            // Set image preview if exists
            if (post.featured_image) {
                setImagePreview(`http://localhost:5000${post.featured_image}`);
            }
        } catch (err) {
            setError('Failed to load post');
            console.error('Load post error:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        }));
        setError('');
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
                image: file
            }));

            // Create preview
            const reader = new FileReader();
            reader.onloadend = () => {
                setImagePreview(reader.result);
            };
            reader.readAsDataURL(file);
            
            setError('');
        }
    };
    
    const removeImage = () => {
        setFormData(prev => ({
            ...prev,
            image: null
        }));
        setImagePreview(null);
    };

    const handleSubmit = async (status = 'draft') => {
        if (!formData.title || !formData.content) {
            setError('Title and content are required');
            return;
        }

        setSaving(true);
        setError('');
        setSuccess('');

        try {
            const postData = {
                ...formData,
                status: status
            };

            if (id) {
                await blogService.updatePost(id, postData);
                setSuccess('Post updated successfully!');
            } else {
                await blogService.createPost(postData);
                setSuccess('Post created successfully!');
            }
            
            setTimeout(() => {
                navigate('/dashboard');
            }, 1500);
        } catch (err) {
            setError(err.response?.data?.error || 'Failed to save post');
        } finally {
            setSaving(false);
        }
    };

    if (loading) {
        return (
            <div className="editor-loading">
                <div className="spinner"></div>
                <p>Loading...</p>
            </div>
        );
    }

    return (
        <div className="editor-page">
            <div className="editor-container">
                <div className="editor-header">
                    <button onClick={() => navigate('/dashboard')} className="btn-back">
                        ← Back to Dashboard
                    </button>
                    <h1>{id ? 'Edit Post' : 'Create New Post'}</h1>
                </div>

                {error && (
                    <div className="alert alert-error">
                        {error}
                    </div>
                )}

                {success && (
                    <div className="alert alert-success">
                        {success}
                    </div>
                )}

                <div className="editor-content">
                    <div className="editor-main">
                        <div className="form-group">
                            <input
                                type="text"
                                name="title"
                                value={formData.title}
                                onChange={handleChange}
                                placeholder="Enter post title..."
                                className="input-title"
                            />
                        </div>

                        <div className="form-group">
                            <textarea
                                name="excerpt"
                                value={formData.excerpt}
                                onChange={handleChange}
                                placeholder="Brief description (optional)..."
                                className="input-excerpt"
                                rows="2"
                            />
                        </div>

                        <div className="form-group">
                            <textarea
                                name="content"
                                value={formData.content}
                                onChange={handleChange}
                                placeholder="Write your post content here..."
                                className="input-content"
                                rows="15"
                            />
                            <p className="help-text">
                                💡 Tip: You can use HTML tags for formatting (h2, p, ul, li, strong, etc.)
                            </p>
                        </div>
                    </div>

                    <div className="editor-sidebar">
                        <div className="sidebar-section">
                            <h3>Featured Image</h3>
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
                                    id="featured-image-input"
                                />
                                <label htmlFor="featured-image-input" className="file-input-label">
                                    {imagePreview ? 'Change Image' : 'Choose Image'}
                                </label>
                            </div>
                            <small className="help-text">Max size: 5MB. Formats: JPG, PNG, GIF</small>
                        </div>

                        <div className="sidebar-section">
                            <h3>Categories</h3>
                            <div className="categories-list">
                                {categories.map(cat => (
                                    <label key={cat.id} className="checkbox-label">
                                        <input
                                            type="checkbox"
                                            checked={formData.categories.includes(cat.id)}
                                            onChange={(e) => {
                                                if (e.target.checked) {
                                                    setFormData(prev => ({
                                                        ...prev,
                                                        categories: [...prev.categories, cat.id]
                                                    }));
                                                } else {
                                                    setFormData(prev => ({
                                                        ...prev,
                                                        categories: prev.categories.filter(id => id !== cat.id)
                                                    }));
                                                }
                                            }}
                                        />
                                        <span>{cat.name}</span>
                                    </label>
                                ))}
                            </div>
                        </div>

                        <div className="sidebar-section">
                            <h3>Actions</h3>
                            <div className="action-buttons">
                                <button
                                    onClick={() => handleSubmit('draft')}
                                    disabled={saving}
                                    className="btn btn-secondary"
                                >
                                    {saving ? 'Saving...' : 'Save as Draft'}
                                </button>
                                <button
                                    onClick={() => handleSubmit('published')}
                                    disabled={saving}
                                    className="btn btn-primary"
                                >
                                    {saving ? 'Publishing...' : 'Publish Post'}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default BlogEditor;
