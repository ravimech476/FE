import React, { createContext, useState, useContext, useEffect } from 'react';
import authService from '../services/authService';

const AuthContext = createContext();

export const useAuth = () => {
    const context = useContext(AuthContext);
    if (!context) {
        throw new Error('useAuth must be used within an AuthProvider');
    }
    return context;
};

export const AuthProvider = ({ children }) => {
    const [user, setUser] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        // Check if user is logged in on mount
        const checkAuth = () => {
            const currentUser = authService.getCurrentUser();
            const token = localStorage.getItem('token');
            
            if (currentUser && token) {
                setUser(currentUser);
            }
            setLoading(false);
        };
        
        checkAuth();
    }, []);

    const login = async (credentials) => {
        try {
            const response = await authService.login(credentials);
            if (response.success) {
                setUser(response.user);
                return { success: true, user: response.user };
            }
            return { success: false, error: response.error || 'Login failed' };
        } catch (err) {
            console.error('Login error:', err);
            const errorMessage = err.response?.data?.error || 'Invalid username or password';
            return { success: false, error: errorMessage };
        }
    };

    const logout = () => {
        authService.logout();
        setUser(null);
    };

    const updateProfile = async (userData) => {
        try {
            const response = await authService.updateProfile(userData);
            if (response.success) {
                setUser(response.user);
                return { success: true, user: response.user };
            }
            return { success: false, error: response.error || 'Update failed' };
        } catch (err) {
            const errorMessage = err.response?.data?.error || 'Update failed';
            return { success: false, error: errorMessage };
        }
    };

    const value = {
        user,
        loading,
        login,
        logout,
        updateProfile,
        isAuthenticated: !!user,
        isAdmin: user?.role === 'admin' || user?.role === 'Admin',
        isEmployee: user?.role === 'customer' || user?.role === 'Customer'
    };

    return (
        <AuthContext.Provider value={value}>
            {!loading && children}
        </AuthContext.Provider>
    );
};
