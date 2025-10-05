import React from 'react';
import HeroSection from '../components/HeroSection';
import LeaderSection from '../components/LeaderSection';
import NewsSection from '../components/NewsSection';
import EventsSection from '../components/EventsSection';
import SocialCorner from '../components/SocialCorner';
import CompaniesSection from '../components/CompaniesSection';
import DashboardLinks from '../components/DashboardLinks';
import './HomePage.css';

const HomePage = ({ setSelectedEmployee }) => {
  return (
    <div className="home-page">
      <HeroSection />
      
      <div className="container">
        <LeaderSection />
        
        <div className="main-content-grid">
          <div className="left-column">
            <NewsSection />
            <SocialCorner />
          </div>
          
          <div className="right-column">
            <EventsSection />
          </div>
        </div>
        
        <CompaniesSection />
        <DashboardLinks />
      </div>
    </div>
  );
};

export default HomePage;
