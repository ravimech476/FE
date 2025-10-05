import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import './Login.css';

const Login = () => {
    const [credentials, setCredentials] = useState({
        username: '',
        password: ''
    });
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const { login } = useAuth();
    const navigate = useNavigate();

    const handleChange = (e) => {
        setCredentials({
            ...credentials,
            [e.target.name]: e.target.value
        });
        setError('');
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        if (!credentials.username || !credentials.password) {
            setError('Please enter both username and password');
            return;
        }

        setError('');
        setLoading(true);

        try {
            const result = await login(credentials);
            
            if (result.success) {
                // Redirect to blog page after successful login
                navigate('/blog');
            } else {
                setError(result.error || 'Invalid username or password');
            }
        } catch (err) {
            console.error('Login error:', err);
            setError('Failed to connect to server. Please try again.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="login-wrapper">
            <div className="login-container">
                <div className="login-card">
                    <div className="login-header">
                        <div className="company-logo">
                            <span className="logo-icon">🏢</span>
                        </div>
                        <h1>Employee Portal</h1>
                        <p>Login to access the company blog</p>
                    </div>

                    {error && (
                        <div className="alert alert-error">
                            {error}
                        </div>
                    )}

                    <form onSubmit={handleSubmit} className="login-form">
                        <div className="form-group">
                            <label htmlFor="username">
                                <span className="label-icon">👤</span>
                                Username
                            </label>
                            <input
                                type="text"
                                id="username"
                                name="username"
                                value={credentials.username}
                                onChange={handleChange}
                                placeholder="Enter your username"
                                autoComplete="username"
                                autoFocus
                            />
                        </div>

                        <div className="form-group">
                            <label htmlFor="password">
                                <span className="label-icon">🔒</span>
                                Password
                            </label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                value={credentials.password}
                                onChange={handleChange}
                                placeholder="Enter your password"
                                autoComplete="current-password"
                            />
                        </div>

                        <button 
                            type="submit" 
                            className="btn-login"
                            disabled={loading}
                        >
                            {loading ? (
                                <>
                                    <span className="spinner"></span>
                                    Logging in...
                                </>
                            ) : (
                                <>
                                    <span className="btn-icon">🔐</span>
                                    Login to Portal
                                </>
                            )}
                        </button>
                    </form>

                    <div className="login-help">
                        <div className="test-accounts">
                            <h3>Test Accounts</h3>
                            <div className="account-info">
                                <div className="account">
                                    <span className="account-type">Admin:</span>
                                    <code>admin / admin123</code>
                                </div>
                                <div className="account">
                                    <span className="account-type">Employee:</span>
                                    <code>john.doe / Employee@123</code>
                                </div>
                                 <div className="account">
                                    <span className="account-type">Employee:</span>
                                    <code>ravi / Ravi@476</code>
                                </div>
                            </div>
                        </div>
                        <p className="help-text">
                            Contact IT support if you forgot your password
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Login;
