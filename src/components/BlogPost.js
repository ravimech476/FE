import React, { useState, useEffect } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import blogService from '../services/blogService';
import CommentsSection from './CommentsSection';
import './BlogPost.css';

const BlogPost = () => {
    const { slug } = useParams();
    const { user, isAuthenticated, isAdmin } = useAuth();
    const navigate = useNavigate();
    const [post, setPost] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');

    useEffect(() => {
        const loadPost = async () => {
            try {
                setLoading(true);
                const response = await blogService.getPostBySlug(slug);
                setPost(response.post);
            } catch (err) {
                setError('Failed to load blog post');
                console.error('Error loading post:', err);
            } finally {
                setLoading(false);
            }
        };
        
        loadPost();
    }, [slug]);

    const formatDate = (dateString) => {
        return new Date(dateString).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    };

    const handleDeletePost = async () => {
        if (!window.confirm('Are you sure you want to delete this post?')) {
            return;
        }

        try {
            await blogService.deletePost(post.id);
            navigate('/blog');
        } catch (error) {
            console.error('Error deleting post:', error);
            alert('Failed to delete post');
        }
    };

    if (loading) {
        return <div className="loading">Loading...</div>;
    }

    if (error || !post) {
        return (
            <div className="error-container">
                <h2>Post not found</h2>
                <p>{error}</p>
                <Link to="/blog">Back to Blog</Link>
            </div>
        );
    }

    const canEditPost = user && (user.id === post.author_id || isAdmin);
    const canDeletePost = user && (user.id === post.author_id || isAdmin);

    return (
        <div className="blog-post-container">
            <article className="blog-post">
                <div className="post-header">
                    <Link to="/blog" className="back-link">← Back to Blog</Link>
                    {(canEditPost || canDeletePost) && (
                        <div className="post-actions">
                            {canEditPost && (
                                <button 
                                    onClick={() => navigate(`/blog/edit/${post.id}`)}
                                    className="edit-btn"
                                >
                                    ✏️ Edit Post
                                </button>
                            )}
                            {canDeletePost && (
                                <button 
                                    onClick={handleDeletePost}
                                    className="delete-btn"
                                >
                                    🗑️ Delete Post
                                </button>
                            )}
                        </div>
                    )}
                </div>

                {post.featured_image && (
                    <div className="post-image">
                        <img src={post.featured_image} alt={post.title} />
                    </div>
                )}

                <h1 className="post-title">{post.title}</h1>

                <div className="post-meta">
                    <span className="author">
                        By {post.author_first_name} {post.author_last_name}
                    </span>
                    <span className="date">
                        {formatDate(post.published_date || post.created_date)}
                    </span>
                    <span className="views">
                        👁 {post.view_count} views
                    </span>
                </div>

                {post.categories && (
                    <div className="post-categories">
                        {post.categories.split(', ').map((cat, index) => (
                            <span key={index} className="category-tag">{cat}</span>
                        ))}
                    </div>
                )}

                <div 
                    className="post-content"
                    dangerouslySetInnerHTML={{ __html: post.content }}
                />

                {/* Comments Section with Role-Based Access Control */}
                <CommentsSection 
                    postId={post.id}
                    initialComments={post.comments || []}
                />
            </article>
        </div>
    );
};

export default BlogPost;
