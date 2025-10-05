import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import blogService from '../services/blogService';
import './Dashboard.css';

const Dashboard = () => {
    const { user, logout } = useAuth();
    const navigate = useNavigate();
    const [myPosts, setMyPosts] = useState([]);
    const [recentPosts, setRecentPosts] = useState([]);
    const [popularPosts, setPopularPosts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [activeTab, setActiveTab] = useState('my-posts');

    useEffect(() => {
        loadDashboardData();
    }, []);

    const loadDashboardData = async () => {
        setLoading(true);
        try {
            // For admin users, load ALL posts from ALL employees
            if (user?.role === 'admin') {
                const allPostsResponse = await blogService.getAllPosts({
                    limit: 50, // Get more posts for admin
                    // Don't filter by my_posts for admin
                });
                setMyPosts(allPostsResponse.posts || []);
            } else {
                // Load user's posts for regular employees
                const myPostsResponse = await blogService.getAllPosts({
                    my_posts: 'true',
                    limit: 20
                });
                setMyPosts(myPostsResponse.posts || []);
            }

            // Load recent posts
            const recentResponse = await blogService.getRecentPosts(10);
            setRecentPosts(recentResponse.posts || []);

            // Load popular posts
            const popularResponse = await blogService.getPopularPosts(10);
            setPopularPosts(popularResponse.posts || []);
        } catch (err) {
            console.error('Failed to load dashboard data:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleDeletePost = async (postId, postTitle, authorName) => {
        const isAdmin = user?.role === 'admin';
        const confirmMessage = isAdmin 
            ? `Are you sure you want to delete "${postTitle}" by ${authorName}?`
            : 'Are you sure you want to delete this post?';
            
        if (!window.confirm(confirmMessage)) return;

        try {
            await blogService.deletePost(postId);
            setMyPosts(myPosts.filter(post => post.id !== postId));
            const message = isAdmin 
                ? `Post "${postTitle}" deleted successfully`
                : 'Post deleted successfully';
            alert(message);
        } catch (err) {
            alert('Failed to delete post');
        }
    };

    const handleLogout = () => {
        logout();
        navigate('/');
    };

    const formatDate = (dateString) => {
        return new Date(dateString).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });
    };

    if (loading) {
        return <div className="loading">Loading dashboard...</div>;
    }

    return (
        <div className="dashboard-container">
            <div className="dashboard-header">
                <div>
                    <h1>Welcome, {user.first_name}! {user?.role === 'admin' && <span className="admin-badge">ADMIN</span>}</h1>
                    <p>{user?.role === 'admin' ? 'Manage all employee blog posts and view analytics' : 'Manage your blog posts and view analytics'}</p>
                </div>
                <div className="header-actions">
                    <Link to="/blog/new" className="create-post-btn">
                        + Create New Post
                    </Link>
                    <button onClick={handleLogout} className="logout-btn">
                        Logout
                    </button>
                </div>
            </div>

            <div className="dashboard-stats">
                <div className="stat-card">
                    <h3>Total Posts</h3>
                    <p className="stat-number">{myPosts.length}</p>
                </div>
                <div className="stat-card">
                    <h3>Published</h3>
                    <p className="stat-number">
                        {myPosts.filter(p => p.status === 'published').length}
                    </p>
                </div>
                <div className="stat-card">
                    <h3>Drafts</h3>
                    <p className="stat-number">
                        {myPosts.filter(p => p.status === 'draft').length}
                    </p>
                </div>
                <div className="stat-card">
                    <h3>Total Views</h3>
                    <p className="stat-number">
                        {myPosts.reduce((sum, post) => sum + (post.view_count || 0), 0)}
                    </p>
                </div>
            </div>

            <div className="dashboard-tabs">
            <button
            className={activeTab === 'my-posts' ? 'tab active' : 'tab'}
            onClick={() => setActiveTab('my-posts')}
            >
            {user?.role === 'admin' ? 'All Employee Posts' : 'My Posts'}
            </button>
                <button
                    className={activeTab === 'recent' ? 'tab active' : 'tab'}
                    onClick={() => setActiveTab('recent')}
                >
                    Recent Posts
                </button>
                <button
                    className={activeTab === 'popular' ? 'tab active' : 'tab'}
                    onClick={() => setActiveTab('popular')}
                >
                    Popular Posts
                </button>
            </div>

            <div className="dashboard-content">
                {activeTab === 'my-posts' && (
                    <div className="posts-table">
                        <h2>{user?.role === 'admin' ? 'All Employee Posts' : 'My Posts'}</h2>
                        {myPosts.length === 0 ? (
                            <div className="no-posts">
                                <p>{user?.role === 'admin' ? 'No posts found from employees.' : "You haven't created any posts yet."}</p>
                                <Link to="/blog/new">Create {user?.role === 'admin' ? 'a' : 'your first'} post</Link>
                            </div>
                        ) : (
                            <table>
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        {user?.role === 'admin' && <th>Author</th>}
                                        <th>Status</th>
                                        <th>Views</th>
                                        <th>Comments</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {myPosts.map(post => (
                                        <tr key={post.id}>
                                            <td>
                                                <Link to={`/blog/${post.slug}`}>
                                                    {post.title}
                                                </Link>
                                            </td>
                                            {user?.role === 'admin' && (
                                                <td className="author-cell">
                                                    <strong>{post.author_first_name} {post.author_last_name}</strong>
                                                    <br />
                                                    <small>@{post.author_username}</small>
                                                </td>
                                            )}
                                            <td>
                                                <span className={`status ${post.status}`}>
                                                    {post.status}
                                                </span>
                                            </td>
                                            <td>{post.view_count || 0}</td>
                                            <td>{post.comment_count || 0}</td>
                                            <td>{formatDate(post.created_date)}</td>
                                            <td className="actions">
                                                <button
                                                    onClick={() => navigate(`/blog/edit/${post.id}`)}
                                                    className="edit-btn"
                                                    title={user?.role === 'admin' ? `Edit ${post.author_first_name}'s post` : 'Edit post'}
                                                >
                                                    Edit
                                                </button>
                                                <button
                                                    onClick={() => handleDeletePost(
                                                        post.id, 
                                                        post.title, 
                                                        `${post.author_first_name} ${post.author_last_name}`
                                                    )}
                                                    className="delete-btn"
                                                    title={user?.role === 'admin' ? `Delete ${post.author_first_name}'s post` : 'Delete post'}
                                                >
                                                    Delete
                                                </button>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        )}
                    </div>
                )}

                {activeTab === 'recent' && (
                    <div className="posts-list">
                        <h2>Recent Posts</h2>
                        {recentPosts.map(post => (
                            <div key={post.id} className="post-item">
                                <h3>
                                    <Link to={`/blog/${post.slug}`}>{post.title}</Link>
                                </h3>
                                <p className="post-meta">
                                    By {post.author_first_name} {post.author_last_name} • 
                                    {formatDate(post.published_date)}
                                </p>
                                <p className="post-excerpt">{post.excerpt}</p>
                                {user?.role === 'admin' && (
                                    <div className="admin-actions">
                                        <button
                                            onClick={() => navigate(`/blog/edit/${post.id}`)}
                                            className="edit-btn-small"
                                        >
                                            Edit
                                        </button>
                                        <button
                                            onClick={() => handleDeletePost(
                                                post.id, 
                                                post.title, 
                                                `${post.author_first_name} ${post.author_last_name}`
                                            )}
                                            className="delete-btn-small"
                                        >
                                            Delete
                                        </button>
                                    </div>
                                )}
                            </div>
                        ))}
                    </div>
                )}

                {activeTab === 'popular' && (
                    <div className="posts-list">
                        <h2>Popular Posts</h2>
                        {popularPosts.map(post => (
                            <div key={post.id} className="post-item">
                                <h3>
                                    <Link to={`/blog/${post.slug}`}>{post.title}</Link>
                                </h3>
                                <p className="post-meta">
                                    By {post.author_first_name} {post.author_last_name} • 
                                    {post.view_count} views
                                </p>
                                {user?.role === 'admin' && (
                                    <div className="admin-actions">
                                        <button
                                            onClick={() => navigate(`/blog/edit/${post.id}`)}
                                            className="edit-btn-small"
                                        >
                                            Edit
                                        </button>
                                        <button
                                            onClick={() => handleDeletePost(
                                                post.id, 
                                                post.title, 
                                                `${post.author_first_name} ${post.author_last_name}`
                                            )}
                                            className="delete-btn-small"
                                        >
                                            Delete
                                        </button>
                                    </div>
                                )}
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
};

export default Dashboard;
