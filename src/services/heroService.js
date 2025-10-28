import api from './api';

const heroService = {
    // Get active hero section (PUBLIC)
    getActive: async () => {
        try {
            const response = await api.get('/hero/active');
            return response.data;
        } catch (error) {
            console.error('Error fetching active hero:', error);
            throw error;
        }
    },

    // Get all hero sections (ADMIN)
    getAll: async () => {
        try {
            const response = await api.get('/hero/all');
            return response.data;
        } catch (error) {
            console.error('Error fetching all heroes:', error);
            throw error;
        }
    },

    // Get hero section by ID (ADMIN)
    getById: async (id) => {
        try {
            const response = await api.get(`/hero/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching hero:', error);
            throw error;
        }
    },

    // Create hero section (ADMIN)
    create: async (heroData) => {
        try {
            const formData = new FormData();
            formData.append('title', heroData.title);
            
            if (heroData.image) {
                formData.append('image', heroData.image);
            }
            
            const response = await api.post('/hero', formData);
            return response.data;
        } catch (error) {
            console.error('Error creating hero:', error);
            throw error;
        }
    },

    // Update hero section (ADMIN)
    update: async (id, heroData) => {
        try {
            const formData = new FormData();
            formData.append('title', heroData.title);
            formData.append('is_active', heroData.is_active);
            
            if (heroData.image && heroData.image instanceof File) {
                formData.append('image', heroData.image);
            }
            
            const response = await api.put(`/hero/${id}`, formData);
            return response.data;
        } catch (error) {
            console.error('Error updating hero:', error);
            throw error;
        }
    },

    // Set active hero section (ADMIN)
    setActive: async (id) => {
        try {
            const response = await api.put(`/hero/${id}/activate`);
            return response.data;
        } catch (error) {
            console.error('Error activating hero:', error);
            throw error;
        }
    },

    // Delete hero section (ADMIN)
    delete: async (id) => {
        try {
            const response = await api.delete(`/hero/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error deleting hero:', error);
            throw error;
        }
    }
};

export default heroService;
