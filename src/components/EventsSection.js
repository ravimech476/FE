import React, { useState, useEffect } from 'react';
import eventService from '../services/eventService';
import './EventsSection.css';

const EventsSection = () => {
  const [currentDate, setCurrentDate] = useState(new Date());
  const [events, setEvents] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchUpcomingEvents();
  }, []);

  const fetchUpcomingEvents = async () => {
    try {
      setLoading(true);
      const response = await eventService.getUpcomingEvents(10);
      if (response.success) {
        setEvents(response.data);
      } else {
        setError('Failed to fetch events');
      }
    } catch (error) {
      console.error('Error fetching events:', error);
      setError('Error loading events');
    } finally {
      setLoading(false);
    }
  };

  const getDaysInMonth = (date) => {
    return new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();
  };

  const getFirstDayOfMonth = (date) => {
    return new Date(date.getFullYear(), date.getMonth(), 1).getDay();
  };

  const renderCalendar = () => {
    const daysInMonth = getDaysInMonth(currentDate);
    const firstDay = getFirstDayOfMonth(currentDate);
    const days = [];
    
    // Add empty cells for days before month starts
    for (let i = 0; i < firstDay; i++) {
      days.push(<div key={`empty-${i}`} className="calendar-day empty"></div>);
    }
    
    // Add days of the month
    for (let day = 1; day <= daysInMonth; day++) {
      const hasEvent = events.some(event => {
        const eventDate = new Date(event.event_date);
        return eventDate.getDate() === day && 
               eventDate.getMonth() === currentDate.getMonth() &&
               eventDate.getFullYear() === currentDate.getFullYear();
      });
      
      const today = new Date();
      const isToday = day === today.getDate() && 
                      currentDate.getMonth() === today.getMonth() &&
                      currentDate.getFullYear() === today.getFullYear();
      
      days.push(
        <div key={day} className={`calendar-day ${hasEvent ? 'has-event' : ''} ${isToday ? 'today' : ''}`}>
          {day}
        </div>
      );
    }
    
    return days;
  };

  const formatEventDate = (dateString) => {
    const eventDate = new Date(dateString);
    return {
      day: eventDate.getDate(),
      time: eventDate.toLocaleTimeString('en-US', { 
        hour: 'numeric', 
        minute: '2-digit',
        hour12: true 
      })
    };
  };

  const navigateMonth = (direction) => {
    setCurrentDate(prev => {
      const newDate = new Date(prev);
      newDate.setMonth(prev.getMonth() + direction);
      return newDate;
    });
  };

  const monthYear = currentDate.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });

  return (
    <section className="events-section">
      <h2 className="section-title text-orange">Events</h2>
      
      <div className="calendar-container">
        <div className="calendar-header">
          <button className="nav-btn" onClick={() => navigateMonth(-1)}>‹</button>
          <span className="month-year">{monthYear}</span>
          <button className="nav-btn" onClick={() => navigateMonth(1)}>›</button>
        </div>
        
        <div className="calendar-weekdays">
          <div>S</div>
          <div>M</div>
          <div>T</div>
          <div>W</div>
          <div>T</div>
          <div>F</div>
          <div>S</div>
        </div>
        
        <div className="calendar-grid">
          {renderCalendar()}
        </div>
      </div>
      
      <div className="upcoming-events">
        {loading ? (
          <div className="events-loading">
            <p>Loading events...</p>
          </div>
        ) : error ? (
          <div className="events-error">
            <p>{error}</p>
            <button onClick={fetchUpcomingEvents} className="retry-btn">Retry</button>
          </div>
        ) : events.length === 0 ? (
          <div className="no-events">
            <p>No upcoming events</p>
          </div>
        ) : (
          events.map((event, index) => {
            const { day, time } = formatEventDate(event.event_date);
            return (
              <div key={event.id || index} className="event-item">
                <div className="event-date">{day}</div>
                <div className="event-details">
                  <h4>{event.event_name}</h4>
                  <p>{time}</p>
                  {event.description && (
                    <p className="event-description">{event.description}</p>
                  )}
                </div>
                <div className="event-status">
                  <span className="event-badge">Upcoming</span>
                </div>
              </div>
            );
          })
        )}
      </div>
    </section>
  );
};

export default EventsSection;
