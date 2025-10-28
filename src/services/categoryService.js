import api from './api';

const categoryService = {
    // Get all categories (public - no auth required)
    getAllPublic: async () => {
        try {
            const response = await api.get('/categories/public');
            return response.data;
        } catch (error) {
            console.error('Error fetching categories:', error);
            throw error;
        }
    },

    // Get all categories
    getAll: async () => {
        try {
            const response = await api.get('/categories');
            return response.data;
        } catch (error) {
            console.error('Error fetching categories:', error);
            throw error;
        }
    },

    // Get category by ID
    getById: async (id) => {
        try {
            const response = await api.get(`/categories/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching category:', error);
            throw error;
        }
    },

    // Create category
    create: async (categoryData) => {
        try {
            const response = await api.post('/categories', categoryData);
            return response.data;
        } catch (error) {
            console.error('Error creating category:', error);
            throw error;
        }
    },

    // Update category
    update: async (id, categoryData) => {
        try {
            const response = await api.put(`/categories/${id}`, categoryData);
            return response.data;
        } catch (error) {
            console.error('Error updating category:', error);
            throw error;
        }
    },

    // Delete category
    delete: async (id) => {
        try {
            const response = await api.delete(`/categories/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error deleting category:', error);
            throw error;
        }
    }
};

export default categoryService;
