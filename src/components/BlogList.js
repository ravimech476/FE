import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import blogService from '../services/blogService';
import './BlogList.css';

const BlogList = () => {
    const { isAuthenticated } = useAuth();
    const navigate = useNavigate();
    const [posts, setPosts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const [pagination, setPagination] = useState({
        page: 1,
        limit: 9,
        total: 0,
        pages: 0
    });
    const [filters, setFilters] = useState({
        search: '',
        category: ''
        // Remove status filter to show all published posts
    });
    const [categories, setCategories] = useState([]);
    const [viewMode, setViewMode] = useState('grid'); // grid or list

    useEffect(() => {
        loadCategories();
        loadPosts();
    }, []);

    useEffect(() => {
        const delayTimer = setTimeout(() => {
            loadPosts();
        }, 500); // Debounce API calls
        
        return () => clearTimeout(delayTimer);
    }, [pagination.page, filters.category]);
    
    useEffect(() => {
        const searchTimer = setTimeout(() => {
            if (filters.search !== '') {
                loadPosts();
            }
        }, 800); // Longer debounce for search
        
        return () => clearTimeout(searchTimer);
    }, [filters.search]);

    const loadCategories = async () => {
        try {
            const response = await blogService.getAllCategories();
            setCategories(response.categories || []);
        } catch (err) {
            console.error('Failed to load categories:', err);
        }
    };

    const loadPosts = async () => {
        setLoading(true);
        try {
            const response = await blogService.getAllPosts({
                page: pagination.page,
                limit: pagination.limit,
                ...filters
            });
            
            setPosts(response.posts || []);
            setPagination(response.pagination || {
                page: 1,
                limit: 9,
                total: 0,
                pages: 0
            });
            setError('');
        } catch (err) {
            setError('Failed to load blog posts');
            console.error('Error loading posts:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleSearchChange = (e) => {
        setFilters({ ...filters, search: e.target.value });
        setPagination({ ...pagination, page: 1 });
    };

    const handleCategoryChange = (category) => {
        setFilters({ ...filters, category: category === filters.category ? '' : category });
        setPagination({ ...pagination, page: 1 });
    };

    const handlePageChange = (newPage) => {
        setPagination({ ...pagination, page: newPage });
        window.scrollTo(0, 0);
    };

    const formatDate = (dateString) => {
        return new Date(dateString).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    };

    const truncateText = (text, maxLength = 150) => {
        const plainText = text.replace(/<[^>]*>/g, '');
        if (plainText.length <= maxLength) return plainText;
        return plainText.substring(0, maxLength).trim() + '...';
    };

    return (
        <div className="blog-page">
            {/* Hero Section */}
            <div className="blog-hero">
                <div className="hero-content">
                    <h1 className="hero-title">Company Blog</h1>
                    <p className="hero-subtitle">
                        Discover insights, share knowledge, and stay updated with our latest posts
                    </p>
                    {/* {isAuthenticated ? (
                        <Link to="/blog/new" className="create-post-hero-btn">
                            ✍️ Write a New Post
                        </Link>
                    ) : (
                        <Link to="/login" className="create-post-hero-btn">
                            Login to Write a Post
                        </Link>
                    )} */}
                </div>
            </div>

            {/* Search and Filters */}
            <div className="blog-controls">
                <div className="controls-container">
                    <div className="search-section">
                        <div className="search-box">
                            <span className="search-icon">🔍</span>
                            <input
                                type="text"
                                placeholder="Search posts..."
                                value={filters.search}
                                onChange={handleSearchChange}
                                className="search-input"
                            />
                        </div>
                    </div>

                    <div className="view-controls">
                        <button
                            className={`view-btn ${viewMode === 'grid' ? 'active' : ''}`}
                            onClick={() => setViewMode('grid')}
                            title="Grid View"
                        >
                            ⊞
                        </button>
                        <button
                            className={`view-btn ${viewMode === 'list' ? 'active' : ''}`}
                            onClick={() => setViewMode('list')}
                            title="List View"
                        >
                            ☰
                        </button>
                    </div>
                </div>

                {/* Categories */}
                <div className="categories-filter">
                    <button
                        className={`category-chip ${filters.category === '' ? 'active' : ''}`}
                        onClick={() => handleCategoryChange('')}
                    >
                        All Posts
                    </button>
                    {categories.map(cat => (
                        <button
                            key={cat.id}
                            className={`category-chip ${filters.category === cat.slug ? 'active' : ''}`}
                            onClick={() => handleCategoryChange(cat.slug)}
                        >
                            {cat.name} ({cat.post_count})
                        </button>
                    ))}
                </div>
            </div>

            {/* Blog Posts */}
            <div className="blog-content">
                <div className="content-container">
                    {loading && posts.length === 0 ? (
                        <div className="loading-state">
                            <div className="spinner"></div>
                            <p>Loading posts...</p>
                        </div>
                    ) : error ? (
                        <div className="error-state">
                            <p>{error}</p>
                        </div>
                    ) : posts.length === 0 ? (
                        <div className="empty-state">
                            <span className="empty-icon">📝</span>
                            <h3>No posts found</h3>
                            <p>Be the first to share your thoughts!</p>
                            {isAuthenticated && (
                                <Link to="/blog/new" className="create-first-post-btn">
                                    Create First Post
                                </Link>
                            )}
                        </div>
                    ) : (
                        <div className={`posts-${viewMode}`}>
                            {posts.map(post => (
                                <article key={post.id} className="post-card">
                                    {post.featured_image && (
                                        <div className="post-image">
                                            <img src={post.featured_image} alt={post.title} />
                                            <div className="post-category">
                                                {post.categories?.split(', ')[0] || 'General'}
                                            </div>
                                        </div>
                                    )}
                                    <div className="post-content">
                                        <div className="post-header">
                                            <div className="post-author">
                                                <span className="author-avatar">
                                                    {post.author_first_name?.[0]}{post.author_last_name?.[0]}
                                                </span>
                                                <div className="author-info">
                                                    <span className="author-name">
                                                        {post.author_first_name} {post.author_last_name}
                                                    </span>
                                                    <span className="post-date">
                                                        {formatDate(post.published_date || post.created_date)}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <h2 className="post-title">
                                            <Link to={`/blog/${post.slug}`}>{post.title}</Link>
                                        </h2>
                                        
                                        <p className="post-excerpt">
                                            {post.excerpt || truncateText(post.content)}
                                        </p>
                                        
                                        <div className="post-footer">
                                            <div className="post-stats">
                                                <span className="stat">
                                                    <span className="stat-icon">👁</span>
                                                    {post.view_count || 0}
                                                </span>
                                                <span className="stat">
                                                    <span className="stat-icon">💬</span>
                                                    {post.comment_count || 0}
                                                </span>
                                            </div>
                                            <Link to={`/blog/${post.slug}`} className="read-more-btn">
                                                Read More →
                                            </Link>
                                        </div>
                                    </div>
                                </article>
                            ))}
                        </div>
                    )}

                    {/* Pagination */}
                    {pagination.pages > 1 && (
                        <div className="pagination">
                            <button
                                onClick={() => handlePageChange(pagination.page - 1)}
                                disabled={pagination.page === 1}
                                className="page-btn"
                            >
                                ← Previous
                            </button>
                            
                            <div className="page-numbers">
                                {[...Array(pagination.pages)].map((_, index) => (
                                    <button
                                        key={index + 1}
                                        onClick={() => handlePageChange(index + 1)}
                                        className={`page-number ${pagination.page === index + 1 ? 'active' : ''}`}
                                    >
                                        {index + 1}
                                    </button>
                                ))}
                            </div>
                            
                            <button
                                onClick={() => handlePageChange(pagination.page + 1)}
                                disabled={pagination.page === pagination.pages}
                                className="page-btn"
                            >
                                Next →
                            </button>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default BlogList;
