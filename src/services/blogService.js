import api from './api';

const blogService = {
    // Blog Posts
    getAllPosts: async (filters = {}) => {
        const response = await api.get('/blog/posts', { params: filters });
        return response.data;
    },

    getPost: async (id) => {
        const response = await api.get(`/blog/posts/${id}`);
        return response.data;
    },

    getPostBySlug: async (slug) => {
        const response = await api.get(`/blog/posts/slug/${slug}`);
        return response.data;
    },

    createPost: async (postData) => {
        const response = await api.post('/blog/posts', postData);
        return response.data;
    },

    updatePost: async (id, postData) => {
        const response = await api.put(`/blog/posts/${id}`, postData);
        return response.data;
    },

    deletePost: async (id) => {
        const response = await api.delete(`/blog/posts/${id}`);
        return response.data;
    },

    getPopularPosts: async (limit = 5) => {
        const response = await api.get('/blog/posts/popular', { params: { limit } });
        return response.data;
    },

    getRecentPosts: async (limit = 5) => {
        const response = await api.get('/blog/posts/recent', { params: { limit } });
        return response.data;
    },

    // Categories
    getAllCategories: async () => {
        const response = await api.get('/blog/categories');
        return response.data;
    },

    createCategory: async (categoryData) => {
        const response = await api.post('/blog/categories', categoryData);
        return response.data;
    },

    updateCategory: async (id, categoryData) => {
        const response = await api.put(`/blog/categories/${id}`, categoryData);
        return response.data;
    },

    deleteCategory: async (id) => {
        const response = await api.delete(`/blog/categories/${id}`);
        return response.data;
    },

    // Comments
    getPostComments: async (postId) => {
        const response = await api.get(`/blog/posts/${postId}/comments`);
        return response.data;
    },

    createComment: async (postId, content) => {
        const response = await api.post(`/blog/posts/${postId}/comments`, { content });
        return response.data;
    },

    updateComment: async (id, content) => {
        const response = await api.put(`/blog/comments/${id}`, { content });
        return response.data;
    },

    deleteComment: async (id) => {
        const response = await api.delete(`/blog/comments/${id}`);
        return response.data;
    }
};

export default blogService;
