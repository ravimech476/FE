import React, { useState, useEffect } from 'react';
import categoryService from '../services/categoryService';
import subCategoryService from '../services/subCategoryService';
import './CategoryManagement.css';

const CategoryManagement = () => {
  const [categories, setCategories] = useState([]);
  const [subCategories, setSubCategories] = useState([]);
  const [selectedCategoryFilter, setSelectedCategoryFilter] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(null);

  // Category Form
  const [showCategoryForm, setShowCategoryForm] = useState(false);
  const [editingCategory, setEditingCategory] = useState(null);
  const [categoryName, setCategoryName] = useState('');

  // SubCategory Form
  const [showSubCategoryForm, setShowSubCategoryForm] = useState(false);
  const [editingSubCategory, setEditingSubCategory] = useState(null);
  const [subCategoryData, setSubCategoryData] = useState({
    category_id: '',
    name: ''
  });

  // Delete Confirm
  const [deleteConfirm, setDeleteConfirm] = useState(null);

  useEffect(() => {
    fetchCategories();
    fetchSubCategories();
  }, []);

  useEffect(() => {
    if (selectedCategoryFilter) {
      fetchSubCategories(selectedCategoryFilter);
    } else {
      fetchSubCategories();
    }
  }, [selectedCategoryFilter]);

  const fetchCategories = async () => {
    try {
      const data = await categoryService.getAll();
      setCategories(data);
    } catch (err) {
      setError('Failed to load categories');
    }
  };

  const fetchSubCategories = async (categoryId = null) => {
    try {
      setLoading(true);
      const data = await subCategoryService.getAll(categoryId);
      setSubCategories(data);
    } catch (err) {
      setError('Failed to load subcategories');
    } finally {
      setLoading(false);
    }
  };

  // Category Handlers
  const handleAddCategory = () => {
    setEditingCategory(null);
    setCategoryName('');
    setShowCategoryForm(true);
  };

  const handleEditCategory = (category) => {
    setEditingCategory(category);
    setCategoryName(category.name);
    setShowCategoryForm(true);
  };

  const handleSaveCategory = async () => {
    try {
      if (!categoryName.trim()) {
        setError('Category name is required');
        return;
      }

      if (editingCategory) {
        await categoryService.update(editingCategory.id, { name: categoryName });
        setSuccess('Category updated successfully');
      } else {
        await categoryService.create({ name: categoryName });
        setSuccess('Category created successfully');
      }

      setShowCategoryForm(false);
      setCategoryName('');
      setEditingCategory(null);
      fetchCategories();
      fetchSubCategories();
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to save category');
      setTimeout(() => setError(null), 3000);
    }
  };

  const handleDeleteCategory = async (id) => {
    try {
      await categoryService.delete(id);
      setSuccess('Category deleted successfully');
      setDeleteConfirm(null);
      fetchCategories();
      fetchSubCategories();
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to delete category');
      setDeleteConfirm(null);
      setTimeout(() => setError(null), 3000);
    }
  };

  // SubCategory Handlers
  const handleAddSubCategory = () => {
    setEditingSubCategory(null);
    setSubCategoryData({ category_id: '', name: '' });
    setShowSubCategoryForm(true);
  };

  const handleEditSubCategory = (subCategory) => {
    setEditingSubCategory(subCategory);
    setSubCategoryData({
      category_id: subCategory.category_id,
      name: subCategory.name
    });
    setShowSubCategoryForm(true);
  };

  const handleSaveSubCategory = async () => {
    try {
      if (!subCategoryData.category_id) {
        setError('Category is required');
        return;
      }
      if (!subCategoryData.name.trim()) {
        setError('SubCategory name is required');
        return;
      }

      if (editingSubCategory) {
        await subCategoryService.update(editingSubCategory.id, subCategoryData);
        setSuccess('SubCategory updated successfully');
      } else {
        await subCategoryService.create(subCategoryData);
        setSuccess('SubCategory created successfully');
      }

      setShowSubCategoryForm(false);
      setSubCategoryData({ category_id: '', name: '' });
      setEditingSubCategory(null);
      fetchSubCategories(selectedCategoryFilter);
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to save subcategory');
      setTimeout(() => setError(null), 3000);
    }
  };

  const handleDeleteSubCategory = async (id) => {
    try {
      await subCategoryService.delete(id);
      setSuccess('SubCategory deleted successfully');
      setDeleteConfirm(null);
      fetchSubCategories(selectedCategoryFilter);
      setTimeout(() => setSuccess(null), 3000);
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to delete subcategory');
      setDeleteConfirm(null);
      setTimeout(() => setError(null), 3000);
    }
  };

  return (
    <div className="category-management">
      <div className="management-header">
        <h1>Category & SubCategory Management</h1>
      </div>

      {error && <div className="alert alert-error">{error}</div>}
      {success && <div className="alert alert-success">{success}</div>}

      <div className="management-grid">
        {/* CATEGORIES SECTION */}
        <div className="management-section">
          <div className="section-header">
            <h2>Categories</h2>
            {!showCategoryForm && (
              <button className="btn-primary" onClick={handleAddCategory}>
                + Add Category
              </button>
            )}
          </div>

          {showCategoryForm && (
            <div className="form-container">
              <h3>{editingCategory ? 'Edit Category' : 'Add New Category'}</h3>
              <div className="form-group">
                <label>Category Name *</label>
                <input
                  type="text"
                  value={categoryName}
                  onChange={(e) => setCategoryName(e.target.value)}
                  placeholder="Enter category name"
                />
              </div>
              <div className="form-actions">
                <button
                  className="btn-secondary"
                  onClick={() => {
                    setShowCategoryForm(false);
                    setCategoryName('');
                    setEditingCategory(null);
                  }}
                >
                  Cancel
                </button>
                <button className="btn-primary" onClick={handleSaveCategory}>
                  {editingCategory ? 'Update' : 'Create'}
                </button>
              </div>
            </div>
          )}

          <div className="items-list">
            {categories.length === 0 ? (
              <div className="no-data">No categories found</div>
            ) : (
              categories.map((category) => (
                <div key={category.id} className="item-card">
                  <div className="item-info">
                    <h4>{category.name}</h4>
                  </div>
                  <div className="item-actions">
                    <button
                      className="btn-icon btn-edit"
                      onClick={() => handleEditCategory(category)}
                      title="Edit"
                    >
                      ✏️
                    </button>
                    <button
                      className="btn-icon btn-delete"
                      onClick={() => setDeleteConfirm({ type: 'category', id: category.id })}
                      title="Delete"
                    >
                      🗑️
                    </button>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>

        {/* SUBCATEGORIES SECTION */}
        <div className="management-section">
          <div className="section-header">
            <h2>SubCategories</h2>
            {!showSubCategoryForm && (
              <button className="btn-primary" onClick={handleAddSubCategory}>
                + Add SubCategory
              </button>
            )}
          </div>

          {/* <div className="filter-section">
            <label>Filter by Category:</label>
            <select
              value={selectedCategoryFilter}
              onChange={(e) => setSelectedCategoryFilter(e.target.value)}
            >
              <option value="">All Categories</option>
              {categories.map((cat) => (
                <option key={cat.id} value={cat.id}>
                  {cat.name}
                </option>
              ))}
            </select>
          </div> */}

          {showSubCategoryForm && (
            <div className="form-container">
              <h3>{editingSubCategory ? 'Edit SubCategory' : 'Add New SubCategory'}</h3>
              <div className="form-group">
                <label>Category *</label>
                <select
                  value={subCategoryData.category_id}
                  onChange={(e) =>
                    setSubCategoryData({ ...subCategoryData, category_id: e.target.value })
                  }
                >
                  <option value="">Select Category</option>
                  {categories.map((cat) => (
                    <option key={cat.id} value={cat.id}>
                      {cat.name}
                    </option>
                  ))}
                </select>
              </div>
              <div className="form-group">
                <label>SubCategory Name *</label>
                <input
                  type="text"
                  value={subCategoryData.name}
                  onChange={(e) =>
                    setSubCategoryData({ ...subCategoryData, name: e.target.value })
                  }
                  placeholder="Enter subcategory name"
                />
              </div>
              <div className="form-actions">
                <button
                  className="btn-secondary"
                  onClick={() => {
                    setShowSubCategoryForm(false);
                    setSubCategoryData({ category_id: '', name: '' });
                    setEditingSubCategory(null);
                  }}
                >
                  Cancel
                </button>
                <button className="btn-primary" onClick={handleSaveSubCategory}>
                  {editingSubCategory ? 'Update' : 'Create'}
                </button>
              </div>
            </div>
          )}

          <div className="items-list">
            {loading ? (
              <div className="loading">Loading...</div>
            ) : subCategories.length === 0 ? (
              <div className="no-data">No subcategories found</div>
            ) : (
              subCategories.map((subCat) => (
                <div key={subCat.id} className="item-card">
                  <div className="item-info">
                    <h4>{subCat.name}</h4>
                    <span className="badge">{subCat.category_name}</span>
                  </div>
                  <div className="item-actions">
                    <button
                      className="btn-icon btn-edit"
                      onClick={() => handleEditSubCategory(subCat)}
                      title="Edit"
                    >
                      ✏️
                    </button>
                    <button
                      className="btn-icon btn-delete"
                      onClick={() => setDeleteConfirm({ type: 'subcategory', id: subCat.id })}
                      title="Delete"
                    >
                      🗑️
                    </button>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>

      {/* Delete Confirmation Modal */}
      {deleteConfirm && (
        <div className="modal-overlay">
          <div className="modal-content">
            <h3>Confirm Delete</h3>
            <p>Are you sure you want to delete this {deleteConfirm.type}?</p>
            <div className="modal-actions">
              <button className="btn-secondary" onClick={() => setDeleteConfirm(null)}>
                Cancel
              </button>
              <button
                className="btn-danger"
                onClick={() =>
                  deleteConfirm.type === 'category'
                    ? handleDeleteCategory(deleteConfirm.id)
                    : handleDeleteSubCategory(deleteConfirm.id)
                }
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

export default CategoryManagement;
