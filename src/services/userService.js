import api from './api';

const userService = {
    // Admin - Get all users for dropdown
    getAllUsers: async () => {
        try {
            const response = await api.get('/users');
            return response.data;
        } catch (error) {
            console.error('Error fetching users:', error);
            throw error;
        }
    }
};

export default userService;
