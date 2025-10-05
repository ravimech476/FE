import React, { useState, useEffect } from 'react';
import { useAuth } from '../contexts/AuthContext';
import blogService from '../services/blogService';
import './CommentsSection.css';

const CommentsSection = ({ postId, initialComments = [] }) => {
    const { user, isAuthenticated, isAdmin } = useAuth();
    const [comments, setComments] = useState(initialComments);
    const [newComment, setNewComment] = useState('');
    const [editingComment, setEditingComment] = useState(null);
    const [editContent, setEditContent] = useState('');
    const [loading, setLoading] = useState(false);
    const [submitLoading, setSubmitLoading] = useState(false);
    const [error, setError] = useState('');
    const [message, setMessage] = useState('');

    useEffect(() => {
        if (postId && initialComments.length === 0) {
            fetchComments();
        } else {
            setComments(initialComments);
        }
    }, [postId, initialComments]);

    const fetchComments = async () => {
        setLoading(true);
        try {
            const response = await blogService.getPostComments(postId);
            if (response.success) {
                setComments(response.comments || []);
            }
        } catch (error) {
            console.error('Error fetching comments:', error);
            setError('Failed to load comments');
        } finally {
            setLoading(false);
        }
    };

    const showMessage = (msg, type = 'success') => {
        if (type === 'error') {
            setError(msg);
            setMessage('');
        } else {
            setMessage(msg);
            setError('');
        }
        
        setTimeout(() => {
            setError('');
            setMessage('');
        }, 3000);
    };

    const handleSubmitComment = async (e) => {
        e.preventDefault();
        
        if (!newComment.trim()) {
            showMessage('Please enter a comment', 'error');
            return;
        }

        setSubmitLoading(true);
        try {
            const response = await blogService.createComment(postId, newComment.trim());
            if (response.success) {
                setNewComment('');
                showMessage('Comment added successfully!');
                // Add the new comment to the list
                const commentWithUser = {
                    ...response.comment,
                    first_name: user.first_name,
                    last_name: user.last_name,
                    username: user.username
                };
                setComments(prev => [commentWithUser, ...prev]);
            } else {
                showMessage(response.error || 'Failed to add comment', 'error');
            }
        } catch (error) {
            console.error('Error adding comment:', error);
            showMessage(error.response?.data?.error || 'Failed to add comment', 'error');
        } finally {
            setSubmitLoading(false);
        }
    };

    const handleEditComment = (comment) => {
        setEditingComment(comment.id);
        setEditContent(comment.content);
    };

    const handleSaveEdit = async (commentId) => {
        if (!editContent.trim()) {
            showMessage('Please enter a comment', 'error');
            return;
        }

        try {
            const response = await blogService.updateComment(commentId, editContent.trim());
            if (response.success) {
                setComments(prev => 
                    prev.map(comment => 
                        comment.id === commentId 
                            ? { ...comment, content: editContent.trim() }
                            : comment
                    )
                );
                setEditingComment(null);
                setEditContent('');
                showMessage('Comment updated successfully!');
            } else {
                showMessage(response.error || 'Failed to update comment', 'error');
            }
        } catch (error) {
            console.error('Error updating comment:', error);
            showMessage(error.response?.data?.error || 'Failed to update comment', 'error');
        }
    };

    const handleDeleteComment = async (commentId) => {
        if (!window.confirm('Are you sure you want to delete this comment?')) {
            return;
        }

        try {
            const response = await blogService.deleteComment(commentId);
            if (response.success) {
                setComments(prev => prev.filter(comment => comment.id !== commentId));
                showMessage('Comment deleted successfully!');
            } else {
                showMessage(response.error || 'Failed to delete comment', 'error');
            }
        } catch (error) {
            console.error('Error deleting comment:', error);
            showMessage(error.response?.data?.error || 'Failed to delete comment', 'error');
        }
    };

    const canEditComment = (comment) => {
        return isAdmin || (user && user.id === comment.user_id);
    };

    const canDeleteComment = (comment) => {
        return isAdmin || (user && user.id === comment.user_id);
    };

    const formatDate = (dateString) => {
        const date = new Date(dateString);
        return date.toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    };

    return (
        <div className="comments-section">
            <div className="comments-header">
                <h3>Comments ({comments.length})</h3>
            </div>

            {/* Error/Success Messages */}
            {message && (
                <div className="message success">{message}</div>
            )}
            {error && (
                <div className="message error">{error}</div>
            )}

            {/* Add Comment Form - Only for authenticated users */}
            {isAuthenticated && (
                <div className="add-comment-section">
                    <div className="comment-form">
                        <div className="comment-user">
                            <div className="user-avatar">
                                {user.first_name?.[0]}{user.last_name?.[0]}
                            </div>
                            <span className="user-name">
                                {user.first_name} {user.last_name}
                            </span>
                        </div>
                        <form onSubmit={handleSubmitComment}>
                            <textarea
                                value={newComment}
                                onChange={(e) => setNewComment(e.target.value)}
                                placeholder="Write your comment..."
                                className="comment-textarea"
                                rows="4"
                                disabled={submitLoading}
                            />
                            <div className="comment-actions">
                                <button 
                                    type="submit" 
                                    className="btn-submit"
                                    disabled={submitLoading || !newComment.trim()}
                                >
                                    {submitLoading ? 'Posting...' : 'Post Comment'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            {/* Comments List */}
            <div className="comments-list">
                {loading && comments.length === 0 ? (
                    <div className="comments-loading">
                        <div className="spinner"></div>
                        <p>Loading comments...</p>
                    </div>
                ) : comments.length === 0 ? (
                    <div className="no-comments">
                        <p>No comments yet. {isAuthenticated ? 'Be the first to comment!' : 'Login to add a comment.'}</p>
                    </div>
                ) : (
                    comments.map(comment => (
                        <div key={comment.id} className="comment-item">
                            <div className="comment-user">
                                <div className="user-avatar">
                                    {comment.first_name?.[0]}{comment.last_name?.[0]}
                                </div>
                                <div className="user-info">
                                    <span className="user-name">
                                        {comment.first_name} {comment.last_name}
                                    </span>
                                    <span className="comment-date">
                                        {formatDate(comment.created_date)}
                                    </span>
                                </div>
                            </div>
                            
                            <div className="comment-content">
                                {editingComment === comment.id ? (
                                    <div className="edit-comment">
                                        <textarea
                                            value={editContent}
                                            onChange={(e) => setEditContent(e.target.value)}
                                            className="comment-textarea"
                                            rows="3"
                                        />
                                        <div className="comment-actions">
                                            <button 
                                                onClick={() => handleSaveEdit(comment.id)}
                                                className="btn-save"
                                            >
                                                Save
                                            </button>
                                            <button 
                                                onClick={() => {
                                                    setEditingComment(null);
                                                    setEditContent('');
                                                }}
                                                className="btn-cancel"
                                            >
                                                Cancel
                                            </button>
                                        </div>
                                    </div>
                                ) : (
                                    <>
                                        <p className="comment-text">{comment.content}</p>
                                        {isAuthenticated && (
                                            <div className="comment-controls">
                                                {canEditComment(comment) && (
                                                    <button 
                                                        onClick={() => handleEditComment(comment)}
                                                        className="btn-edit-comment"
                                                        title="Edit Comment"
                                                    >
                                                        ✏️ Edit
                                                    </button>
                                                )}
                                                {canDeleteComment(comment) && (
                                                    <button 
                                                        onClick={() => handleDeleteComment(comment.id)}
                                                        className="btn-delete-comment"
                                                        title="Delete Comment"
                                                    >
                                                        🗑️ Delete
                                                    </button>
                                                )}
                                            </div>
                                        )}
                                    </>
                                )}
                            </div>
                        </div>
                    ))
                )}
            </div>

            {/* Login prompt for non-authenticated users */}
            {!isAuthenticated && (
                <div className="login-prompt">
                    <p>Want to join the discussion? <a href="/login">Login here</a> to add your comments.</p>
                </div>
            )}
        </div>
    );
};

export default CommentsSection;