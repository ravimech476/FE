import React, { useState } from 'react';
import './EventsCalendar.css';

const EventsCalendar = () => {
  const [currentMonth, setCurrentMonth] = useState(6); // July
  const [currentYear, setCurrentYear] = useState(2023);
  
  const events = [
    { date: 29, title: 'Memorial Day', time: '12:00 pm - 1:00 pm' },
    { date: 3, title: 'Independence Day', time: '12:00 pm - 1:00 pm' }
  ];

  const getDaysInMonth = (month, year) => {
    return new Date(year, month + 1, 0).getDate();
  };

  const getFirstDayOfMonth = (month, year) => {
    return new Date(year, month, 1).getDay();
  };

  const renderCalendarDays = () => {
    const daysInMonth = getDaysInMonth(currentMonth, currentYear);
    const firstDay = getFirstDayOfMonth(currentMonth, currentYear);
    const days = [];
    
    // Previous month days
    for (let i = 0; i < firstDay; i++) {
      days.push(<div key={`empty-${i}`} className="calendar-day empty"></div>);
    }
    
    // Current month days
    for (let day = 1; day <= daysInMonth; day++) {
      const hasEvent = events.some(event => event.date === day);
      days.push(
        <div key={day} className={`calendar-day ${hasEvent ? 'has-event' : ''} ${day === 29 ? 'highlighted' : ''}`}>
          {day}
        </div>
      );
    }
    
    return days;
  };

  return (
    <section className="events-section">
      <div className="container">
        <h2 className="section-title">Events</h2>
        <div className="calendar-container">
          <div className="calendar-header">
            <button className="nav-button">←</button>
            <span className="month-year">July 2023</span>
            <button className="nav-button">→</button>
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
            {renderCalendarDays()}
          </div>
          <div className="events-list">
            {events.map((event, index) => (
              <div key={index} className="event-item">
                <div className="event-date">{event.date}</div>
                <div className="event-details">
                  <div className="event-title">{event.title}</div>
                  <div className="event-time">{event.time}</div>
                </div>
                <button className="event-button">Register</button>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default EventsCalendar;
