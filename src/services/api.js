// API service that works in browser environment with better error handling
const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';

class ApiClient {
    constructor() {
        this.baseURL = API_URL;
    }

    getAuthHeader() {
        const token = localStorage.getItem('token');
        return token ? { 'Authorization': `Bearer ${token}` } : {};
    }

    async request(endpoint, options = {}) {
        const url = `${this.baseURL}${endpoint}`;
        
        const config = {
            ...options,
            headers: {
                'Content-Type': 'application/json',
                ...this.getAuthHeader(),
                ...options.headers,
            },
        };

        try {
            const response = await fetch(url, config);
            
            // Handle 401 Unauthorized
            if (response.status === 401) {
                localStorage.removeItem('token');
                localStorage.removeItem('user');
                window.location.href = '/login';
                throw new Error('Unauthorized');
            }

            // Check if response is JSON
            const contentType = response.headers.get('content-type');
            let data;
            
            if (contentType && contentType.includes('application/json')) {
                data = await response.json();
            } else {
                // If not JSON, try to read as text
                const text = await response.text();
                console.error('Non-JSON response:', text);
                data = { error: text || 'Server error' };
            }
            
            if (!response.ok) {
                throw { response: { data, status: response.status } };
            }
            
            // Return in axios-like format
            return { data };
        } catch (error) {
            console.error('API Error:', error);
            
            // If already formatted, return as is
            if (error.response) {
                throw error;
            }
            
            // Format other errors
            throw { 
                response: { 
                    data: { error: error.message || 'Network error' }, 
                    status: 500 
                } 
            };
        }
    }

    async get(endpoint, config = {}) {
        const queryString = config.params ? new URLSearchParams(config.params).toString() : '';
        const url = queryString ? `${endpoint}?${queryString}` : endpoint;
        return this.request(url, { method: 'GET' });
    }

    async post(endpoint, data = {}) {
        return this.request(endpoint, {
            method: 'POST',
            body: JSON.stringify(data),
        });
    }

    async put(endpoint, data = {}) {
        return this.request(endpoint, {
            method: 'PUT',
            body: JSON.stringify(data),
        });
    }

    async delete(endpoint) {
        return this.request(endpoint, {
            method: 'DELETE',
        });
    }
}

const api = new ApiClient();
export default api;
