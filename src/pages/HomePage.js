import React from 'react';
import HeroSection from '../components/HeroSection';
import LeaderSection from '../components/LeaderSection';
import NewsSection from '../components/NewsSection';
import BusinessNewsSection from '../components/BusinessNewsSection';
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
          </div>
          
          <div className="right-column">
            <BusinessNewsSection />
          </div>
        </div>
        
        <div className="events-section-full">
          <EventsSection />
        </div>
        
        {/* <CompaniesSection /> */}
        <DashboardLinks />
      </div>
    </div>
  );
};

export default HomePage;
