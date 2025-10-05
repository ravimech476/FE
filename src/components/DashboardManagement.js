import React, { useState, useEffect } from 'react';
import { useAuth } from '../contexts/AuthContext';
import dashboardService from '../services/dashboardService';
import './DashboardManagement.css';

const DashboardManagement = () => {
  const { user } = useAuth();
  const [dashboards, setDashboards] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [editingDashboard, setEditingDashboard] = useState(null);
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    url: '',
    display_order: 0,
    status: 'active'
  });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    if (user && user.role === 'admin') {
      loadDashboards();
    }
  }, [user]);

  const loadDashboards = async () => {
    try {
      setLoading(true);
      const response = await dashboardService.getAllLinks();
      setDashboards(response.links || []);
    } catch (err) {
      console.error('Failed to load dashboards:', err);
      setError('Failed to load dashboards');
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
    setError('');
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    if (!formData.title || !formData.url) {
      setError('Title and URL are required');
      return;
    }

    try {
      if (editingDashboard) {
        await dashboardService.updateLink(editingDashboard.id, formData);
        setSuccess('Dashboard link updated successfully');
      } else {
        await dashboardService.createLink(formData);
        setSuccess('Dashboard link created successfully');
      }
      
      resetForm();
      loadDashboards();
      
      setTimeout(() => setSuccess(''), 3000);
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to save dashboard link');
    }
  };

  const handleEdit = (dashboard) => {
    setEditingDashboard(dashboard);
    setFormData({
      title: dashboard.title,
      description: dashboard.description || '',
      url: dashboard.url,
      display_order: dashboard.display_order || 0,
      status: dashboard.status
    });
    setShowForm(true);
  };

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure you want to delete this dashboard link?')) {
      return;
    }

    try {
      await dashboardService.deleteLink(id);
      setSuccess('Dashboard link deleted successfully');
      loadDashboards();
      setTimeout(() => setSuccess(''), 3000);
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to delete dashboard link');
    }
  };

  const resetForm = () => {
    setFormData({
      title: '',
      description: '',
      url: '',
      display_order: 0,
      status: 'active'
    });
    setEditingDashboard(null);
    setShowForm(false);
    setError('');
  };

  if (loading) {
    return <div className="dashboard-management"><p>Loading...</p></div>;
  }

  return (
    <div className="dashboard-management">
      <div className="container">
        <div className="management-header">
          <h1>Manage Dashboard Links</h1>
          {!showForm && (
            <button onClick={() => setShowForm(true)} className="btn btn-primary">
              + Add New Dashboard Link
            </button>
          )}
        </div>

        {error && <div className="alert alert-error">{error}</div>}
        {success && <div className="alert alert-success">{success}</div>}

        {showForm && (
          <div className="dashboard-form-container">
            <h2>{editingDashboard ? 'Edit Dashboard Link' : 'Add New Dashboard Link'}</h2>
            <form onSubmit={handleSubmit} className="dashboard-form">
              <div className="form-group">
                <label>Title *</label>
                <input
                  type="text"
                  name="title"
                  value={formData.title}
                  onChange={handleInputChange}
                  placeholder="e.g., Reporting, Analytics"
                  required
                />
              </div>

              <div className="form-group">
                <label>Description</label>
                <textarea
                  name="description"
                  value={formData.description}
                  onChange={handleInputChange}
                  placeholder="Brief description of the dashboard"
                  rows="4"
                />
              </div>

              <div className="form-group">
                <label>URL *</label>
                <input
                  type="url"
                  name="url"
                  value={formData.url}
                  onChange={handleInputChange}
                  placeholder="https://example.com/dashboard"
                  required
                />
              </div>

              <div className="form-group">
                <label>Status</label>
                <select
                  name="status"
                  value={formData.status}
                  onChange={handleInputChange}
                >
                  <option value="active">Active</option>
                  <option value="inactive">Inactive</option>
                </select>
              </div>

              <div className="form-actions">
                <button type="submit" className="btn btn-primary">
                  {editingDashboard ? 'Update' : 'Create'} Dashboard Link
                </button>
                <button type="button" onClick={resetForm} className="btn btn-secondary">
                  Cancel
                </button>
              </div>
            </form>
          </div>
        )}

        <div className="dashboards-list">
          <h2>Dashboard Links ({dashboards.length})</h2>
          {dashboards.length > 0 ? (
            <table className="dashboards-table">
              <thead>
                <tr>
                  <th>Title</th>
                  <th>Description</th>
                  <th>URL</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {dashboards.map((dashboard) => (
                  <tr key={dashboard.id}>
                    <td><strong>{dashboard.title}</strong></td>
                    <td className="description-cell">{dashboard.description}</td>
                    <td>
                      <a href={dashboard.url} target="_blank" rel="noopener noreferrer" className="url-link">
                        {dashboard.url.substring(0, 40)}...
                      </a>
                    </td>
                    <td>
                      <span className={`status-badge ${dashboard.status}`}>
                        {dashboard.status}
                      </span>
                    </td>
                    <td className="actions-cell">
                      <button
                        className="btn-icon btn-edit"
                        onClick={() => handleEdit(dashboard)}
                        title="Edit"
                      >
                        ✏️
                      </button>
                      <button
                        className="btn-icon btn-delete"
                        onClick={() => handleDelete(dashboard.id)}
                        title="Delete"
                      >
                        🗑️
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          ) : (
            <p className="no-data">No dashboard links yet. Add your first one!</p>
          )}
        </div>
      </div>
    </div>
  );
};

export default DashboardManagement;
