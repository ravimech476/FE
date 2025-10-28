import api from './api';

const businessNewsService = {
    // Get all business news (PUBLIC)
    getAll: async () => {
        try {
            const response = await api.get('/business-news');
            return response.data;
        } catch (error) {
            console.error('Error fetching business news:', error);
            throw error;
        }
    },

    // Get all business news for admin (ADMIN)
    getAllForAdmin: async () => {
        try {
            const response = await api.get('/business-news/admin/all');
            return response.data;
        } catch (error) {
            console.error('Error fetching business news for admin:', error);
            throw error;
        }
    },

    // Get business news by ID
    getById: async (id) => {
        try {
            const response = await api.get(`/business-news/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching business news:', error);
            throw error;
        }
    },

    // Create business news (ADMIN)
    create: async (businessNewsData) => {
        try {
            const formData = new FormData();
            formData.append('title', businessNewsData.title);
            formData.append('content', businessNewsData.content);
            
            if (businessNewsData.excerpt) {
                formData.append('excerpt', businessNewsData.excerpt);
            }
            
            if (businessNewsData.image) {
                formData.append('image', businessNewsData.image);
            }
            
            if (businessNewsData.category) {
                formData.append('category', businessNewsData.category);
            }
            
            if (businessNewsData.display_order) {
                formData.append('display_order', businessNewsData.display_order);
            }
            
            if (businessNewsData.status) {
                formData.append('status', businessNewsData.status);
            }
            
            if (businessNewsData.published_date) {
                formData.append('published_date', businessNewsData.published_date);
            }
            
            const response = await api.post('/business-news', formData);
            return response.data;
        } catch (error) {
            console.error('Error creating business news:', error);
            throw error;
        }
    },

    // Update business news (ADMIN)
    update: async (id, businessNewsData) => {
        try {
            const formData = new FormData();
            formData.append('title', businessNewsData.title);
            formData.append('content', businessNewsData.content);
            
            if (businessNewsData.excerpt) {
                formData.append('excerpt', businessNewsData.excerpt);
            }
            
            if (businessNewsData.image && businessNewsData.image instanceof File) {
                formData.append('image', businessNewsData.image);
            }
            
            if (businessNewsData.category) {
                formData.append('category', businessNewsData.category);
            }
            
            if (businessNewsData.display_order !== undefined) {
                formData.append('display_order', businessNewsData.display_order);
            }
            
            if (businessNewsData.status) {
                formData.append('status', businessNewsData.status);
            }
            
            if (businessNewsData.published_date) {
                formData.append('published_date', businessNewsData.published_date);
            }
            
            const response = await api.put(`/business-news/${id}`, formData);
            return response.data;
        } catch (error) {
            console.error('Error updating business news:', error);
            throw error;
        }
    },

    // Delete business news (ADMIN)
    delete: async (id) => {
        try {
            const response = await api.delete(`/business-news/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error deleting business news:', error);
            throw error;
        }
    }
};

export default businessNewsService;
