import React, { useState } from 'react';
import { Link, useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import EventsManagement from './EventsManagement';
import './Header.css';

const Header = () => {
    const { user, logout, isAuthenticated, isAdmin } = useAuth();
    const navigate = useNavigate();
    const location = useLocation();
    const [showEventsManagement, setShowEventsManagement] = useState(false);

    const handleLogout = () => {
        logout();
        navigate('/login');
    };

    const isActive = (path) => {
        return location.pathname === path ? 'active' : '';
    };

    return (
        <header className="app-header">
            <div className="header-container">
                <div className="header-left">
                    <Link to="/" className="brand">
                        <span className="brand-icon">🏢</span>
                        <span className="brand-text">Company Portal</span>
                    </Link>
                </div>

                <nav className="header-nav">
                    <Link to="/" className={`nav-link ${isActive('/')}`}>
                        Home
                    </Link>
                    <Link to="/blog" className={`nav-link ${isActive('/blog')}`}>
                        Blog
                    </Link>
                    {isAuthenticated && (
                        <>
                            <Link to="/dashboard" className={`nav-link ${isActive('/dashboard')}`}>
                                My Dashboard
                            </Link>
                            <Link to="/blog/new" className={`nav-link btn-create-post`}>
                                <span>✍️</span> Create Post
                            </Link>
                            {isAdmin && (
                                <>
                                    <button 
                                        onClick={() => setShowEventsManagement(true)}
                                        className="nav-link btn-events"
                                    >
                                        <span>📅</span> Events
                                    </button>
                                    <Link 
                                        to="/leaders/manage"
                                        className={`nav-link ${isActive('/leaders/manage')}`}
                                    >
                                        <span>👥</span> Meet our Leaders
                                    </Link>
                                    <Link 
                                        to="/news/manage"
                                        className={`nav-link ${isActive('/news/manage')}`}
                                    >
                                        <span>📰</span> Company News
                                    </Link>
                                    <Link 
                                        to="/business-news/manage"
                                        className={`nav-link ${isActive('/business-news/manage')}`}
                                    >
                                        <span>💼</span> Business News
                                    </Link>
                                    <Link 
                                        to="/categories/manage"
                                        className={`nav-link ${isActive('/categories/manage')}`}
                                    >
                                        <span>📂</span> Categories
                                    </Link>
                                    <Link 
                                        to="/dashboards/manage"
                                        className={`nav-link ${isActive('/dashboards/manage')}`}
                                    >
                                        <span>📊</span> Manage Dashboards
                                    </Link>
                                    <Link 
                                        to="/hero/manage"
                                        className={`nav-link ${isActive('/hero/manage')}`}
                                    >
                                        <span>🎨</span> Hero Section
                                    </Link>
                                </>
                            )}
                        </>
                    )}
                </nav>

                <div className="header-right">
                    {isAuthenticated ? (
                        <div className="user-section">
                            <div className="user-info">
                                <span className="user-avatar">
                                    {user?.first_name?.[0]}{user?.last_name?.[0]}
                                </span>
                                <div className="user-details">
                                    <span className="user-name">
                                        {user?.first_name} {user?.last_name}
                                    </span>
                                    <span className="user-role">{user?.role}</span>
                                </div>
                            </div>
                            <button onClick={handleLogout} className="btn-logout">
                                <span>🚪</span> Logout
                            </button>
                        </div>
                    ) : (
                        <Link to="/login" className="btn-header-login">
                            <span>🔐</span> Login
                        </Link>
                    )}
                </div>
            </div>
            
            {/* Events Management Modal */}
            <EventsManagement 
                isOpen={showEventsManagement}
                onClose={() => setShowEventsManagement(false)}
            />
        </header>
    );
};

export default Header;
