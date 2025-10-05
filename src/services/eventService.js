import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';

const eventService = {
    // Get all events
    getAllEvents: async () => {
        try {
            const response = await axios.get(`${API_URL}/events`);
            return {
                success: true,
                data: response.data.data
            };
        } catch (error) {
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to fetch events'
            };
        }
    },

    // Get upcoming events (for home page)
    getUpcomingEvents: async (limit = 5) => {
        try {
            const response = await axios.get(`${API_URL}/events/upcoming?limit=${limit}`);
            return {
                success: true,
                data: response.data.data
            };
        } catch (error) {
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to fetch upcoming events'
            };
        }
    },

    // Get single event
    getEvent: async (id) => {
        try {
            const response = await axios.get(`${API_URL}/events/${id}`);
            return {
                success: true,
                data: response.data.data
            };
        } catch (error) {
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to fetch event'
            };
        }
    },

    // Create event (admin only)
    createEvent: async (eventData) => {
        try {
            const token = localStorage.getItem('token');
            const response = await axios.post(`${API_URL}/events`, eventData, {
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json'
                }
            });
            return {
                success: true,
                data: response.data.data,
                message: response.data.message
            };
        } catch (error) {
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to create event'
            };
        }
    },

    // Update event (admin only)
    updateEvent: async (id, eventData) => {
        try {
            const token = localStorage.getItem('token');
            const response = await axios.put(`${API_URL}/events/${id}`, eventData, {
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json'
                }
            });
            return {
                success: true,
                data: response.data.data,
                message: response.data.message
            };
        } catch (error) {
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to update event'
            };
        }
    },

    // Delete event (admin only)
    deleteEvent: async (id) => {
        try {
            const token = localStorage.getItem('token');
            const response = await axios.delete(`${API_URL}/events/${id}`, {
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });
            return {
                success: true,
                message: response.data.message
            };
        } catch (error) {
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to delete event'
            };
        }
    }
};

export default eventService;
