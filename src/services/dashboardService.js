import api from './api';

const dashboardService = {
    // Get all dashboard links (public)
    getAllLinks: async () => {
        const response = await api.get('/dashboard/links');
        return response.data;
    },

    // Get all dashboard links for admin (includes inactive)
    getAllLinksAdmin: async () => {
        const response = await api.get('/dashboard/links/admin/all');
        return response.data;
    },

    // Get dashboard links grouped by category (public)
    getLinksByCategory: async () => {
        const response = await api.get('/dashboard/links-by-category');
        return response.data;
    },

    // Get single link (admin)
    getLink: async (id) => {
        const response = await api.get(`/dashboard/links/${id}`);
        return response.data;
    },

    // Create dashboard link (admin)
    createLink: async (linkData) => {
        const response = await api.post('/dashboard/links', linkData);
        return response.data;
    },

    // Update dashboard link (admin)
    updateLink: async (id, linkData) => {
        const response = await api.put(`/dashboard/links/${id}`, linkData);
        return response.data;
    },

    // Delete dashboard link (admin)
    deleteLink: async (id) => {
        const response = await api.delete(`/dashboard/links/${id}`);
        return response.data;
    }
};

export default dashboardService;
