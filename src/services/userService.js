import api from './api';

const userService = {
    // Get all users (Admin only)
    getAllUsers: async () => {
        const response = await api.get('/users');
        return response.data;
    },

    // Get upcoming birthdays
    getUpcomingBirthdays: async (days = 30) => {
        const response = await api.get('/users/birthdays', { params: { days } });
        return response.data;
    }
};

export default userService;
