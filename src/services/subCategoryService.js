import api from './api';

const subCategoryService = {
    // Get all subcategories or filter by category (public - no auth required)
    getAllPublic: async (categoryId = null) => {
        try {
            const url = categoryId ? `/subcategories/public?category_id=${categoryId}` : '/subcategories/public';
            const response = await api.get(url);
            return response.data;
        } catch (error) {
            console.error('Error fetching subcategories:', error);
            throw error;
        }
    },

    // Get all subcategories or filter by category
    getAll: async (categoryId = null) => {
        try {
            const url = categoryId ? `/subcategories?category_id=${categoryId}` : '/subcategories';
            const response = await api.get(url);
            return response.data;
        } catch (error) {
            console.error('Error fetching subcategories:', error);
            throw error;
        }
    },

    // Get subcategory by ID
    getById: async (id) => {
        try {
            const response = await api.get(`/subcategories/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching subcategory:', error);
            throw error;
        }
    },

    // Create subcategory
    create: async (subCategoryData) => {
        try {
            const response = await api.post('/subcategories', subCategoryData);
            return response.data;
        } catch (error) {
            console.error('Error creating subcategory:', error);
            throw error;
        }
    },

    // Update subcategory
    update: async (id, subCategoryData) => {
        try {
            const response = await api.put(`/subcategories/${id}`, subCategoryData);
            return response.data;
        } catch (error) {
            console.error('Error updating subcategory:', error);
            throw error;
        }
    },

    // Delete subcategory
    delete: async (id) => {
        try {
            const response = await api.delete(`/subcategories/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error deleting subcategory:', error);
            throw error;
        }
    }
};

export default subCategoryService;
