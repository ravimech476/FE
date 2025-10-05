import api from './api';

const chatService = {
    // Send a message
    sendMessage: async (receiverId, messageText) => {
        const response = await api.post('/chat/messages', {
            receiver_id: receiverId,
            message_text: messageText
        });
        return response.data;
    },

    // Get conversation with a specific user
    getConversation: async (contactId, limit = 50) => {
        const response = await api.get(`/chat/conversations/${contactId}`, {
            params: { limit }
        });
        return response.data;
    },

    // Get all conversations
    getAllConversations: async () => {
        const response = await api.get('/chat/conversations');
        return response.data;
    },

    // Get unread message count
    getUnreadCount: async () => {
        const response = await api.get('/chat/unread-count');
        return response.data;
    },

    // Poll for new messages
    pollMessages: async (contactId, since) => {
        const response = await api.get(`/chat/poll/${contactId}`, {
            params: { since: since ? since.toISOString() : undefined }
        });
        return response.data;
    },

    // Get all users for chat
    getAllUsers: async () => {
        const response = await api.get('/chat/users');
        return response.data;
    }
};

export default chatService;
