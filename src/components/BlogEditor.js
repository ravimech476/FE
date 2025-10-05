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
        status: 'draft',
        categories: []
    });
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
            
            setFormData({
                title: post.title || '',
                content: post.content || '',
                excerpt: post.excerpt || '',
                featured_image: post.featured_image || '',
                status: post.status || 'draft',
                categories: []
            });
        } catch (err) {
            setError('Failed to load post');
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
                            <input
                                type="url"
                                name="featured_image"
                                value={formData.featured_image}
                                onChange={handleChange}
                                placeholder="Image URL (optional)"
                                className="input-field"
                            />
                            {formData.featured_image && (
                                <div className="image-preview">
                                    <img src={formData.featured_image} alt="Preview" />
                                </div>
                            )}
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
