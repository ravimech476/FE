import api from './api';

const eventService = {
    // Get all events
    getAllEvents: async () => {
        try {
            const response = await api.get('/events');
            return {
                success: true,
                data: response.data.data || response.data
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
            const response = await api.get(`/events/upcoming?limit=${limit}`);
            return {
                success: true,
                data: response.data.data || response.data
            };
        } catch (error) {
            console.error('Error fetching upcoming events:', error);
            return {
                success: false,
                error: error.response?.data?.error || 'Failed to fetch upcoming events'
            };
        }
    },

    // Get single event
    getEvent: async (id) => {
        try {
            const response = await api.get(`/events/${id}`);
            return {
                success: true,
                data: response.data.data || response.data
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
            const response = await api.post('/events', eventData);
            return {
                success: true,
                data: response.data.data || response.data,
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
            const response = await api.put(`/events/${id}`, eventData);
            return {
                success: true,
                data: response.data.data || response.data,
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
            const response = await api.delete(`/events/${id}`);
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
