import React, { createContext, useContext, useEffect, useState } from 'react';
import { io } from 'socket.io-client';
import { useAuth } from './AuthContext';

const SocketContext = createContext();

export const useSocket = () => {
    const context = useContext(SocketContext);
    if (!context) {
        throw new Error('useSocket must be used within SocketProvider');
    }
    return context;
};

export const SocketProvider = ({ children }) => {
    const { user } = useAuth();
    const [socket, setSocket] = useState(null);
    const [isConnected, setIsConnected] = useState(false);
    const [onlineUsers, setOnlineUsers] = useState([]);

    useEffect(() => {
        // Only connect if user is logged in
        if (!user) {
            if (socket) {
                socket.disconnect();
                setSocket(null);
                setIsConnected(false);
            }
            return;
        }

        // Get token from localStorage
        const token = localStorage.getItem('token');
        if (!token) return;

        // Create socket connection
        const newSocket = io(process.env.REACT_APP_API_URL || 'http://localhost:5000', {
            auth: {
                token: token
            },
            reconnection: true,
            reconnectionDelay: 1000,
            reconnectionDelayMax: 5000,
            reconnectionAttempts: 5
        });

        // Connection event handlers
        newSocket.on('connect', () => {
            console.log('✅ Socket connected');
            setIsConnected(true);
        });

        newSocket.on('disconnect', () => {
            console.log('❌ Socket disconnected');
            setIsConnected(false);
        });

        newSocket.on('connect_error', (error) => {
            console.error('Socket connection error:', error);
            setIsConnected(false);
        });

        // Listen for online users updates
        newSocket.on('online_users', (userIds) => {
            setOnlineUsers(userIds);
        });

        setSocket(newSocket);

        // Cleanup on unmount or user logout
        return () => {
            newSocket.disconnect();
        };
    }, [user]);

    const value = {
        socket,
        isConnected,
        onlineUsers
    };

    return (
        <SocketContext.Provider value={value}>
            {children}
        </SocketContext.Provider>
    );
};
