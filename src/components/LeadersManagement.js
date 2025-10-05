import React, { useState, useEffect } from 'react';
import leaderService from '../services/leaderService';
import LeaderForm from './LeaderForm';
import { API_BASE_URL } from '../services/api';
import './LeadersManagement.css';

const LeadersManagement = () => {
  const [leaders, setLeaders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [editingLeader, setEditingLeader] = useState(null);
  const [deleteConfirm, setDeleteConfirm] = useState(null);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(null);

  useEffect(() => {
    fetchLeaders();
  }, []);

  const fetchLeaders = async () => {
    try {
      setLoading(true);
      const data = await leaderService.getAllLeadersForAdmin();
      setLeaders(data);
      setError(null);
    } catch (err) {
      console.error('Error loading leaders:', err);
      setError('Failed to load leaders');
    } finally {
      setLoading(false);
    }
  };

  const handleAdd = () => {
    setEditingLeader(null);
    setShowForm(true);
  };

  const handleEdit = (leader) => {
    setEditingLeader(leader);
    setShowForm(true);
  };

  const handleDelete = async (id) => {
    try {
      await leaderService.deleteLeader(id);
      setSuccess('Leader deleted successfully');
      setDeleteConfirm(null);
      fetchLeaders();
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.message || 'Failed to delete leader');
      setTimeout(() => setError(null), 3000);
    }
  };

  const handleFormSubmit = async (formData) => {
    try {
      if (editingLeader) {
        await leaderService.updateLeader(editingLeader.id, formData);
        setSuccess('Leader updated successfully');
      } else {
        await leaderService.createLeader(formData);
        setSuccess('Leader created successfully');
      }
      setShowForm(false);
      setEditingLeader(null);
      fetchLeaders();
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.message || 'Failed to save leader');
      setTimeout(() => setError(null), 3000);
    }
  };

  const handleFormCancel = () => {
    setShowForm(false);
    setEditingLeader(null);
  };

  if (loading) {
    return (
      <div className="leaders-management">
        <div className="loading-spinner">Loading...</div>
      </div>
    );
  }

  return (
    <div className="leaders-management">
      <div className="management-header">
        <h1>Meet Our Leaders - Management</h1>
        {!showForm && (
          <button className="btn-primary" onClick={handleAdd}>
            + Add New Leader
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
        <LeaderForm
          leader={editingLeader}
          onSubmit={handleFormSubmit}
          onCancel={handleFormCancel}
        />
      ) : (
        <div className="leaders-table-container">
          {leaders.length === 0 ? (
            <div className="no-data">
              <p>No leaders found. Click "Add New Leader" to create one.</p>
            </div>
          ) : (
            <table className="leaders-table">
              <thead>
                <tr>
                  <th>Image</th>
                  <th>Name</th>
                  <th>Title</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {leaders.map(leader => (
                  <tr key={leader.id}>
                    <td>
                      {leader.image ? (
                        <img
                          src={`${API_BASE_URL}${leader.image}`}
                          alt={leader.name}
                          className="table-leader-image"
                          onError={(e) => {
                            e.target.style.display = 'none';
                          }}
                        />
                      ) : (
                        <div className="table-leader-placeholder">
                          {leader.icon || '👤'}
                        </div>
                      )}
                    </td>
                    <td className="leader-name-cell">{leader.name}</td>
                    <td>{leader.title}</td>
                    <td>
                      <span className={`status-badge status-${leader.status}`}>
                        {leader.status}
                      </span>
                    </td>
                    <td className="actions-cell">
                      <button
                        className="btn-icon btn-edit"
                        onClick={() => handleEdit(leader)}
                        title="Edit"
                      >
                        ✏️
                      </button>
                      <button
                        className="btn-icon btn-delete"
                        onClick={() => setDeleteConfirm(leader.id)}
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
            <p>Are you sure you want to delete this leader?</p>
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

export default LeadersManagement;
