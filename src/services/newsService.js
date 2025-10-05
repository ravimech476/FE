import api, { API_BASE_URL } from './api';

const newsService = {
    // Public - Get all active news
    getAllNews: async () => {
        try {
            const response = await api.get('/news');
            return response.data;
        } catch (error) {
            console.error('Error fetching news:', error);
            throw error;
        }
    },

    // Admin - Get all news (including inactive)
    getAllNewsForAdmin: async () => {
        try {
            const response = await api.get('/news/admin/all');
            return response.data;
        } catch (error) {
            console.error('Error fetching news for admin:', error);
            throw error;
        }
    },

    // Get single news
    getNews: async (id) => {
        try {
            const response = await api.get(`/news/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error fetching news:', error);
            throw error;
        }
    },

    // Admin - Create news with image
    createNews: async (newsData) => {
        try {
            const formData = new FormData();
            formData.append('title', newsData.title);
            formData.append('content', newsData.content);
            
            if (newsData.excerpt) {
                formData.append('excerpt', newsData.excerpt);
            }
            
            if (newsData.category) {
                formData.append('category', newsData.category);
            }
            
            if (newsData.display_order !== undefined) {
                formData.append('display_order', newsData.display_order);
            }
            
            if (newsData.status) {
                formData.append('status', newsData.status);
            }
            
            if (newsData.published_date) {
                formData.append('published_date', newsData.published_date);
            }
            
            if (newsData.image) {
                formData.append('image', newsData.image);
            }

            const token = localStorage.getItem('token');
            const response = await fetch(`${API_BASE_URL}/api/news`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${token}`
                },
                body: formData
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.error || 'Failed to create news');
            }

            return await response.json();
        } catch (error) {
            console.error('Error creating news:', error);
            throw error;
        }
    },

    // Admin - Update news with image
    updateNews: async (id, newsData) => {
        try {
            const formData = new FormData();
            formData.append('title', newsData.title);
            formData.append('content', newsData.content);
            
            if (newsData.excerpt) {
                formData.append('excerpt', newsData.excerpt);
            }
            
            if (newsData.category) {
                formData.append('category', newsData.category);
            }
            
            if (newsData.display_order !== undefined) {
                formData.append('display_order', newsData.display_order);
            }
            
            if (newsData.status) {
                formData.append('status', newsData.status);
            }
            
            if (newsData.published_date) {
                formData.append('published_date', newsData.published_date);
            }
            
            if (newsData.image) {
                formData.append('image', newsData.image);
            }

            const token = localStorage.getItem('token');
            const response = await fetch(`${API_BASE_URL}/api/news/${id}`, {
                method: 'PUT',
                headers: {
                    'Authorization': `Bearer ${token}`
                },
                body: formData
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.error || 'Failed to update news');
            }

            return await response.json();
        } catch (error) {
            console.error('Error updating news:', error);
            throw error;
        }
    },

    // Admin - Delete news
    deleteNews: async (id) => {
        try {
            const response = await api.delete(`/news/${id}`);
            return response.data;
        } catch (error) {
            console.error('Error deleting news:', error);
            throw error;
        }
    }
};

export default newsService;
