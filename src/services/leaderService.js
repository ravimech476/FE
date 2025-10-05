import api from './api';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000';

const leaderService = {
    // Public - Get all active leaders
    getAllLeaders: async () => {
        try {
            const response = await api.get('/leaders');
            return response.data;
        } catch (error) {
            console.error('Error fetching leaders:', error);
            throw error;
        }
    },

    // Admin - Get all leaders (including inactive)
    getAllLeadersForAdmin: async () => {
        try {
            const response = await api.get('/leaders/admin/all');
            return response.data;
        } catch (error) {
            console.error('Error fetching leaders for admin:', error);
            throw error;
        }
    },

    // Get single leader
    getLeader: async (id) => {
        try {
            const response = await api.get(`/leaders/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching leader:', error);
            throw error;
        }
    },

    // Admin - Create leader with image
    createLeader: async (leaderData) => {
        try {
            const formData = new FormData();
            formData.append('name', leaderData.name);
            formData.append('title', leaderData.title);
            
            if (leaderData.description) {
                formData.append('description', leaderData.description);
            }
            
            if (leaderData.icon) {
                formData.append('icon', leaderData.icon);
            }
            
            if (leaderData.display_order !== undefined) {
                formData.append('display_order', leaderData.display_order);
            }
            
            if (leaderData.status) {
                formData.append('status', leaderData.status);
            }
            
            if (leaderData.image) {
                formData.append('image', leaderData.image);
            }

            const token = localStorage.getItem('token');
            const response = await fetch(`${API_URL}/api/leaders`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${token}`
                },
                body: formData
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.error || 'Failed to create leader');
            }

            return await response.json();
        } catch (error) {
            console.error('Error creating leader:', error);
            throw error;
        }
    },

    // Admin - Update leader with image
    updateLeader: async (id, leaderData) => {
        try {
            const formData = new FormData();
            formData.append('name', leaderData.name);
            formData.append('title', leaderData.title);
            
            if (leaderData.description) {
                formData.append('description', leaderData.description);
            }
            
            if (leaderData.icon) {
                formData.append('icon', leaderData.icon);
            }
            
            if (leaderData.display_order !== undefined) {
                formData.append('display_order', leaderData.display_order);
            }
            
            if (leaderData.status) {
                formData.append('status', leaderData.status);
            }
            
            if (leaderData.image) {
                formData.append('image', leaderData.image);
            }

            const token = localStorage.getItem('token');
            const response = await fetch(`${API_URL}/api/leaders/${id}`, {
                method: 'PUT',
                headers: {
                    'Authorization': `Bearer ${token}`
                },
                body: formData
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.error || 'Failed to update leader');
            }

            return await response.json();
        } catch (error) {
            console.error('Error updating leader:', error);
            throw error;
        }
    },

    // Admin - Delete leader
    deleteLeader: async (id) => {
        try {
            const response = await api.delete(`/leaders/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error deleting leader:', error);
            throw error;
        }
    },

    // Admin - Update display order
    updateDisplayOrder: async (updates) => {
        try {
            const response = await api.put('/leaders/admin/display-order', { updates });
            return response.data;
        } catch (error) {
            console.error('Error updating display order:', error);
            throw error;
        }
    }
};

export default leaderService;
