import React, { useState, useEffect } from 'react';
import './EventModal.css';

const EventModal = ({ isOpen, onClose, onSave, editEvent = null }) => {
    const [formData, setFormData] = useState({
        event_name: '',
        event_date: '',
        description: ''
    });
    const [errors, setErrors] = useState({});
    const [loading, setLoading] = useState(false);

    // Initialize form data when modal opens or editEvent changes
    useEffect(() => {
        if (editEvent) {
            // Format date for input (YYYY-MM-DDTHH:MM)
            const eventDate = new Date(editEvent.event_date);
            const formattedDate = eventDate.toISOString().slice(0, 16);
            
            setFormData({
                event_name: editEvent.event_name || '',
                event_date: formattedDate || '',
                description: editEvent.description || ''
            });
        } else {
            setFormData({
                event_name: '',
                event_date: '',
                description: ''
            });
        }
        setErrors({});
    }, [editEvent, isOpen]);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        }));
        
        // Clear error when user starts typing
        if (errors[name]) {
            setErrors(prev => ({
                ...prev,
                [name]: ''
            }));
        }
    };

    const validateForm = () => {
        const newErrors = {};
        
        if (!formData.event_name.trim()) {
            newErrors.event_name = 'Event name is required';
        } else if (formData.event_name.length < 3) {
            newErrors.event_name = 'Event name must be at least 3 characters';
        }
        
        if (!formData.event_date) {
            newErrors.event_date = 'Event date is required';
        } else {
            const eventDate = new Date(formData.event_date);
            const now = new Date();
            if (eventDate < now) {
                newErrors.event_date = 'Event date cannot be in the past';
            }
        }
        
        if (formData.description && formData.description.length > 1000) {
            newErrors.description = 'Description cannot exceed 1000 characters';
        }
        
        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        if (!validateForm()) {
            return;
        }
        
        setLoading(true);
        
        try {
            await onSave(formData, editEvent?.id);
            onClose();
        } catch (error) {
            console.error('Error saving event:', error);
        } finally {
            setLoading(false);
        }
    };

    const handleClose = () => {
        if (!loading) {
            onClose();
        }
    };

    if (!isOpen) return null;

    return (
        <div className="event-modal-overlay" onClick={handleClose}>
            <div className="event-modal-content" onClick={(e) => e.stopPropagation()}>
                <div className="event-modal-header">
                    <h2>{editEvent ? 'Edit Event' : 'Create New Event'}</h2>
                    <button 
                        className="event-modal-close" 
                        onClick={handleClose}
                        disabled={loading}
                        type="button"
                    >
                        ×
                    </button>
                </div>
                
                <form onSubmit={handleSubmit} className="event-modal-form">
                    <div className="form-group">
                        <label htmlFor="event_name">Event Name *</label>
                        <input
                            type="text"
                            id="event_name"
                            name="event_name"
                            value={formData.event_name}
                            onChange={handleChange}
                            className={errors.event_name ? 'error' : ''}
                            placeholder="Enter event name"
                            disabled={loading}
                            required
                        />
                        {errors.event_name && <span className="error-message">{errors.event_name}</span>}
                    </div>
                    
                    <div className="form-group">
                        <label htmlFor="event_date">Event Date *</label>
                        <input
                            type="datetime-local"
                            id="event_date"
                            name="event_date"
                            value={formData.event_date}
                            onChange={handleChange}
                            className={errors.event_date ? 'error' : ''}
                            disabled={loading}
                            required
                        />
                        {errors.event_date && <span className="error-message">{errors.event_date}</span>}
                    </div>
                    
                    <div className="form-group">
                        <label htmlFor="description">Description</label>
                        <textarea
                            id="description"
                            name="description"
                            value={formData.description}
                            onChange={handleChange}
                            className={errors.description ? 'error' : ''}
                            placeholder="Enter event description (optional)"
                            rows="4"
                            disabled={loading}
                            maxLength="1000"
                        />
                        {errors.description && <span className="error-message">{errors.description}</span>}
                        <small className="char-count">
                            {formData.description.length}/1000 characters
                        </small>
                    </div>
                    
                    <div className="event-modal-actions">
                        <button 
                            type="button" 
                            className="btn-secondary"
                            onClick={handleClose}
                            disabled={loading}
                        >
                            Cancel
                        </button>
                        <button 
                            type="submit" 
                            className="btn-primary"
                            disabled={loading}
                        >
                            {loading ? 'Saving...' : (editEvent ? 'Update Event' : 'Create Event')}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
};

export default EventModal;
