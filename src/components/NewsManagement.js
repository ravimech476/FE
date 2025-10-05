import React, { useState, useEffect } from 'react';
import newsService from '../services/newsService';
import NewsForm from './NewsForm';
import { API_BASE_URL } from '../services/api';
import './NewsManagement.css';

const NewsManagement = () => {
  const [newsList, setNewsList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [editingNews, setEditingNews] = useState(null);
  const [deleteConfirm, setDeleteConfirm] = useState(null);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(null);

  useEffect(() => {
    fetchNews();
  }, []);

  const fetchNews = async () => {
    try {
      setLoading(true);
      const data = await newsService.getAllNewsForAdmin();
      setNewsList(data);
      setError(null);
    } catch (err) {
      console.error('Error loading news:', err);
      setError('Failed to load news');
    } finally {
      setLoading(false);
    }
  };

  const handleAdd = () => {
    setEditingNews(null);
    setShowForm(true);
  };

  const handleEdit = (news) => {
    setEditingNews(news);
    setShowForm(true);
  };

  const handleDelete = async (id) => {
    try {
      await newsService.deleteNews(id);
      setSuccess('News deleted successfully');
      setDeleteConfirm(null);
      fetchNews();
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.message || 'Failed to delete news');
      setTimeout(() => setError(null), 3000);
    }
  };

  const handleFormSubmit = async (formData) => {
    try {
      if (editingNews) {
        await newsService.updateNews(editingNews.id, formData);
        setSuccess('News updated successfully');
      } else {
        await newsService.createNews(formData);
        setSuccess('News created successfully');
      }
      setShowForm(false);
      setEditingNews(null);
      fetchNews();
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.message || 'Failed to save news');
      setTimeout(() => setError(null), 3000);
    }
  };

  const handleFormCancel = () => {
    setShowForm(false);
    setEditingNews(null);
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    return new Date(dateString).toLocaleDateString();
  };

  if (loading) {
    return (
      <div className="news-management">
        <div className="loading-spinner">Loading...</div>
      </div>
    );
  }

  return (
    <div className="news-management">
      <div className="management-header">
        <h1>Company News - Management</h1>
        {!showForm && (
          <button className="btn-primary" onClick={handleAdd}>
            + Add New News
          </button>
        )}
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

      {showForm ? (
        <NewsForm
          news={editingNews}
          onSubmit={handleFormSubmit}
          onCancel={handleFormCancel}
        />
      ) : (
        <div className="news-table-container">
          {newsList.length === 0 ? (
            <div className="no-data">
              <p>No news found. Click "Add New News" to create one.</p>
            </div>
          ) : (
            <table className="news-table">
              <thead>
                <tr>
                  <th>Image</th>
                  <th>Title</th>
                  <th>Published</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {newsList.map(news => (
                  <tr key={news.id}>
                    <td>
                      {news.image ? (
                        <img
                          src={`${API_BASE_URL}${news.image}`}
                          alt={news.title}
                          className="table-news-image"
                          onError={(e) => {
                            e.target.style.display = 'none';
                          }}
                        />
                      ) : (
                        <div className="table-news-placeholder">
                          📰
                        </div>
                      )}
                    </td>
                    <td className="news-title-cell">
                      <div className="news-title">{news.title}</div>
                      {news.excerpt && (
                        <div className="news-excerpt">{news.excerpt.substring(0, 60)}...</div>
                      )}
                    </td>
                    <td>{formatDate(news.published_date)}</td>
                    <td>
                      <span className={`status-badge status-${news.status}`}>
                        {news.status}
                      </span>
                    </td>
                    <td className="actions-cell">
                      <button
                        className="btn-icon btn-edit"
                        onClick={() => handleEdit(news)}
                        title="Edit"
                      >
                        ✏️
                      </button>
                      <button
                        className="btn-icon btn-delete"
                        onClick={() => setDeleteConfirm(news.id)}
                        title="Delete"
                      >
                        🗑️
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      )}

      {/* Delete Confirmation Modal */}
      {deleteConfirm && (
        <div className="modal-overlay">
          <div className="modal-content">
            <h3>Confirm Delete</h3>
            <p>Are you sure you want to delete this news?</p>
            <div className="modal-actions">
              <button
                className="btn-secondary"
                onClick={() => setDeleteConfirm(null)}
              >
                Cancel
              </button>
              <button
                className="btn-danger"
                onClick={() => handleDelete(deleteConfirm)}
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default NewsManagement;
