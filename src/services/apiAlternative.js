// Alternative API service using native fetch instead of axios
const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';

class ApiService {
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

            // Parse JSON response
            const data = await response.json();
            
            if (!response.ok) {
                throw new Error(data.error || `HTTP error! status: ${response.status}`);
            }
            
            return data;
        } catch (error) {
            console.error('API request failed:', error);
            throw error;
        }
    }

    get(endpoint, params = {}) {
        const queryString = new URLSearchParams(params).toString();
        const url = queryString ? `${endpoint}?${queryString}` : endpoint;
        return this.request(url, { method: 'GET' });
    }

    post(endpoint, data = {}) {
        return this.request(endpoint, {
            method: 'POST',
            body: JSON.stringify(data),
        });
    }

    put(endpoint, data = {}) {
        return this.request(endpoint, {
            method: 'PUT',
            body: JSON.stringify(data),
        });
    }

    delete(endpoint) {
        return this.request(endpoint, {
            method: 'DELETE',
        });
    }
}

const apiService = new ApiService();

// Create an axios-like interface for compatibility
const api = {
    get: (url, config = {}) => apiService.get(url, config.params),
    post: (url, data) => apiService.post(url, data),
    put: (url, data) => apiService.put(url, data),
    delete: (url) => apiService.delete(url),
};

export default api;
