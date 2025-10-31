import React, { useState, useEffect } from 'react';
import eventService from '../services/eventService';
import './EventsSection.css';

const EventsSection = () => {
  const [currentDate, setCurrentDate] = useState(new Date());
  const [upcomingEvents, setUpcomingEvents] = useState([]);
  const [completedEvents, setCompletedEvents] = useState([]);
  const [calendarEvents, setCalendarEvents] = useState([]);
  const [selectedDate, setSelectedDate] = useState(null);
  const [selectedDateEvents, setSelectedDateEvents] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchAllEvents();
  }, []);

  useEffect(() => {
    fetchCalendarEvents();
  }, [currentDate]);

  const fetchAllEvents = async () => {
    try {
      setLoading(true);
      const upcomingResponse = await eventService.getUpcomingEvents(50);
      
      if (upcomingResponse.success) {
        setUpcomingEvents(upcomingResponse.data);
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

  const fetchCalendarEvents = async () => {
    try {
      const year = currentDate.getFullYear();
      const month = currentDate.getMonth() + 1;
      const response = await eventService.getEventsByMonth(year, month);
      
      if (response.success) {
        setCalendarEvents(response.data);
      }
    } catch (error) {
      console.error('Error fetching calendar events:', error);
    }
  };

  const getDaysInMonth = (date) => {
    return new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();
  };

  const getFirstDayOfMonth = (date) => {
    return new Date(date.getFullYear(), date.getMonth(), 1).getDay();
  };

  const handleDateClick = (day) => {
    const clickedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), day);
    clickedDate.setHours(0, 0, 0, 0);
    
    // Filter events for this specific date
    const eventsOnDate = calendarEvents.filter(event => {
      const eventDate = new Date(event.event_date);
      eventDate.setHours(0, 0, 0, 0);
      return eventDate.getTime() === clickedDate.getTime();
    });

    if (eventsOnDate.length > 0) {
      setSelectedDate(clickedDate);
      setSelectedDateEvents(eventsOnDate);
      setShowModal(true);
    }
  };

  const closeModal = () => {
    setShowModal(false);
    setSelectedDate(null);
    setSelectedDateEvents([]);
  };

  const renderCalendar = () => {
    const daysInMonth = getDaysInMonth(currentDate);
    const firstDay = getFirstDayOfMonth(currentDate);
    const days = [];
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    // Add empty cells for days before month starts
    for (let i = 0; i < firstDay; i++) {
      days.push(<div key={`empty-${i}`} className="calendar-day empty"></div>);
    }
    
    // Add days of the month
    for (let day = 1; day <= daysInMonth; day++) {
      const currentDayDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), day);
      currentDayDate.setHours(0, 0, 0, 0);
      
      // Check for upcoming events
      const hasUpcomingEvent = calendarEvents.some(event => {
        const eventDate = new Date(event.event_date);
        eventDate.setHours(0, 0, 0, 0);
        return eventDate.getTime() === currentDayDate.getTime() && eventDate >= today;
      });
      
      // Check for completed events
      const hasCompletedEvent = calendarEvents.some(event => {
        const eventDate = new Date(event.event_date);
        eventDate.setHours(0, 0, 0, 0);
        return eventDate.getTime() === currentDayDate.getTime() && eventDate < today;
      });
      
      const isToday = day === today.getDate() && 
                      currentDate.getMonth() === today.getMonth() &&
                      currentDate.getFullYear() === today.getFullYear();
      
      const hasEvent = hasUpcomingEvent || hasCompletedEvent;
      
      days.push(
        <div 
          key={day} 
          className={`calendar-day 
            ${hasUpcomingEvent ? 'has-upcoming-event' : ''} 
            ${hasCompletedEvent ? 'has-completed-event' : ''} 
            ${isToday ? 'today' : ''}
            ${hasEvent ? 'clickable' : ''}`}
          onClick={() => hasEvent && handleDateClick(day)}
        >
          {day}
          {hasEvent && (
            <span className="event-indicator"></span>
          )}
        </div>
      );
    }
    
    return days;
  };

  const formatEventDate = (dateString) => {
    const eventDate = new Date(dateString);
    return {
      day: eventDate.getDate(),
      date: eventDate.toLocaleDateString('en-US', { 
        weekday: 'short',
        year: 'numeric', 
        month: 'short', 
        day: 'numeric' 
      }),
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
      
      {/* Upcoming Events List */}
      <div className="events-list">
        <h3 className="events-list-title">Upcoming Events</h3>
        {loading ? (
          <div className="events-loading">
            <p>Loading events...</p>
          </div>
        ) : error ? (
          <div className="events-error">
            <p>{error}</p>
            <button onClick={fetchAllEvents} className="retry-btn">Retry</button>
          </div>
        ) : upcomingEvents.length === 0 ? (
          <div className="no-events">
            <p>No upcoming events</p>
          </div>
        ) : (
          upcomingEvents.map((event, index) => {
            const { day, time } = formatEventDate(event.event_date);
            
            return (
              <div key={event.id || index} className="event-item">
                <div className="event-date upcoming">{day}</div>
                <div className="event-details">
                  <h4>{event.event_name}</h4>
                  <p>{time}</p>
                  {event.description && (
                    <p className="event-description">{event.description}</p>
                  )}
                </div>
                <div className="event-status">
                  <span className="event-badge upcoming">Upcoming</span>
                </div>
              </div>
            );
          })
        )}
      </div>

      {/* Event Modal */}
      {showModal && (
        <div className="event-modal-overlay" onClick={closeModal}>
          <div className="event-modal" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <h3>Events on {selectedDate?.toLocaleDateString('en-US', { 
                weekday: 'long',
                year: 'numeric', 
                month: 'long', 
                day: 'numeric' 
              })}</h3>
              <button className="modal-close" onClick={closeModal}>×</button>
            </div>
            <div className="modal-body">
              {selectedDateEvents.map((event, index) => {
                const { time } = formatEventDate(event.event_date);
                const eventDate = new Date(event.event_date);
                const today = new Date();
                eventDate.setHours(0, 0, 0, 0);
                today.setHours(0, 0, 0, 0);
                const isUpcoming = eventDate >= today;
                
                return (
                  <div key={event.id || index} className="modal-event-item">
                    <div className={`modal-event-badge ${isUpcoming ? 'upcoming' : 'completed'}`}>
                      {isUpcoming ? 'Upcoming' : 'Completed'}
                    </div>
                    <h4>{event.event_name}</h4>
                    <p className="modal-event-time">⏰ {time}</p>
                    {event.description && (
                      <p className="modal-event-description">{event.description}</p>
                    )}
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      )}
    </section>
  );
};

export default EventsSection;
