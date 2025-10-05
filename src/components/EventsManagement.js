import React, { useState, useEffect } from 'react';
import eventService from '../services/eventService';
import EventModal from './EventModal';
import { useAuth } from '../contexts/AuthContext';
import './EventsManagement.css';

const EventsManagement = ({ isOpen, onClose }) => {
    const [events, setEvents] = useState([]);
    const [loading, setLoading] = useState(false);
    const [showModal, setShowModal] = useState(false);
    const [editingEvent, setEditingEvent] = useState(null);
    const [message, setMessage] = useState('');
    const [messageType, setMessageType] = useState(''); // 'success' or 'error'
    const { user } = useAuth();

    useEffect(() => {
        if (isOpen) {
            fetchEvents();
        }
    }, [isOpen]);

    const fetchEvents = async () => {
        setLoading(true);
        try {
            const response = await eventService.getAllEvents();
            if (response.success) {
                setEvents(response.data);
            } else {
                showMessage('Failed to fetch events', 'error');
            }
        } catch (error) {
            console.error('Error fetching events:', error);
            showMessage('Error fetching events', 'error');
        } finally {
            setLoading(false);
        }
    };

    const showMessage = (msg, type) => {
        setMessage(msg);
        setMessageType(type);
        setTimeout(() => {
            setMessage('');
            setMessageType('');
        }, 3000);
    };

    const handleCreateEvent = () => {
        setEditingEvent(null);
        setShowModal(true);
    };

    const handleEditEvent = (event) => {
        setEditingEvent(event);
        setShowModal(true);
    };

    const handleDeleteEvent = async (eventId) => {
        if (!window.confirm('Are you sure you want to delete this event?')) {
            return;
        }

        try {
            const response = await eventService.deleteEvent(eventId);
            if (response.success) {
                setEvents(events.filter(event => event.id !== eventId));
                showMessage('Event deleted successfully', 'success');
            } else {
                showMessage(response.error || 'Failed to delete event', 'error');
            }
        } catch (error) {
            console.error('Error deleting event:', error);
            showMessage('Error deleting event', 'error');
        }
    };

    const handleSaveEvent = async (eventData, eventId) => {
        try {
            let response;
            if (eventId) {
                // Update existing event
                response = await eventService.updateEvent(eventId, eventData);
            } else {
                // Create new event
                response = await eventService.createEvent(eventData);
            }

            if (response.success) {
                showMessage(response.message || `Event ${eventId ? 'updated' : 'created'} successfully`, 'success');
                setShowModal(false);
                setEditingEvent(null);
                fetchEvents(); // Refresh the list
            } else {
                showMessage(response.error || `Failed to ${eventId ? 'update' : 'create'} event`, 'error');
            }
        } catch (error) {
            console.error('Error saving event:', error);
            showMessage(`Error ${eventId ? 'updating' : 'creating'} event`, 'error');
        }
    };

    const formatDate = (dateString) => {
        const options = {
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        };
        return new Date(dateString).toLocaleDateString('en-US', options);
    };

    const handleClose = () => {
        if (!loading) {
            onClose();
        }
    };

    if (!isOpen) return null;

    return (
        <>
            <div className="events-management-overlay" onClick={handleClose}>
                <div className="events-management-content" onClick={(e) => e.stopPropagation()}>
                    <div className="events-management-header">
                        <h2>Events Management</h2>
                        <button 
                            className="events-management-close" 
                            onClick={handleClose}
                            disabled={loading}
                        >
                            ×
                        </button>
                    </div>

                    {message && (
                        <div className={`message ${messageType}`}>
                            {message}
                        </div>
                    )}

                    <div className="events-management-body">
                        <div className="events-actions">
                            <button 
                                className="btn-create"
                                onClick={handleCreateEvent}
                                disabled={loading}
                            >
                                + Create New Event
                            </button>
                        </div>

                        {loading && events.length === 0 ? (
                            <div className="loading-state">
                                <div className="spinner"></div>
                                <p>Loading events...</p>
                            </div>
                        ) : events.length === 0 ? (
                            <div className="empty-state">
                                <p>No events found. Create your first event!</p>
                            </div>
                        ) : (
                            <div className="events-list">
                                {events.map(event => (
                                    <div key={event.id} className="event-card">
                                        <div className="event-info">
                                            <h3 className="event-name">{event.event_name}</h3>
                                            <p className="event-date">{formatDate(event.event_date)}</p>
                                            {event.description && (
                                                <p className="event-description">{event.description}</p>
                                            )}
                                            <small className="event-meta">
                                                Created by: {event.created_by_name || 'Unknown'} • 
                                                Created: {formatDate(event.created_date)}
                                            </small>
                                        </div>
                                        <div className="event-actions">
                                            <button
                                                className="btn-edit"
                                                onClick={() => handleEditEvent(event)}
                                                title="Edit Event"
                                            >
                                                ✏️
                                            </button>
                                            <button
                                                className="btn-delete"
                                                onClick={() => handleDeleteEvent(event.id)}
                                                title="Delete Event"
                                            >
                                                🗑️
                                            </button>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </div>
            </div>

            <EventModal
                isOpen={showModal}
                onClose={() => setShowModal(false)}
                onSave={handleSaveEvent}
                editEvent={editingEvent}
            />
        </>
    );
};

export default EventsManagement;
