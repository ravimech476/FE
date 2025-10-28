import React, { useState, useEffect } from 'react';
import heroService from '../services/heroService';
import { API_BASE_URL } from '../services/api';
import './HeroSection.css';

const HeroSection = () => {
  const [hero, setHero] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchActiveHero();
  }, []);

  const fetchActiveHero = async () => {
    try {
      const data = await heroService.getActive();
      setHero(data);
    } catch (error) {
      console.error('Error fetching hero section:', error);
      // Use default if no hero found
      setHero({
        title: 'Group of company has created to do work for various sectors like the electronics and Raw materials about flowers',
        image: 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=1600&h=400&fit=crop'
      });
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <section className="hero-section">
        <div className="hero-overlay"></div>
        <div className="hero-content">
          <p style={{ color: 'white' }}>Loading...</p>
        </div>
      </section>
    );
  }

  // Get image URL - either from server or external URL
  const getImageUrl = () => {
    if (!hero?.image) {
      return 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=1600&h=400&fit=crop';
    }
    
    // If it's an external URL (starts with http)
    if (hero.image.startsWith('http')) {
      return hero.image;
    }
    
    // If it's a server path
    return `${API_BASE_URL}${hero.image}`;
  };

  return (
    <section 
      className="hero-section"
      style={{
        backgroundImage: `url(${getImageUrl()})`
      }}
    >
      <div className="hero-overlay"></div>
      <div className="hero-content">
        <h1 className="hero-title">
          {hero?.title || 'Welcome to our company'}
        </h1>
      </div>
    </section>
  );
};

export default HeroSection;
