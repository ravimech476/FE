import React from 'react';
import { Link } from 'react-router-dom';
import './QuickNavigation.css';

const QuickNavigation = ({ onShowEmployee }) => {
  return (
    <div className="quick-nav">
      <h4>Quick Navigation:</h4>
      <div className="nav-buttons">
        <Link to="/" className="nav-btn">
          1. Homepage
        </Link>
        <Link to="/news" className="nav-btn">
          2. News Page
        </Link>
        <Link to="/company/jasmine" className="nav-btn">
          3. Company Page
        </Link>
        <Link to="/blog/1" className="nav-btn">
          4. Blog Detail
        </Link>
        <Link to="/contact" className="nav-btn">
          5. Contact Page
        </Link>
        <button 
          onClick={onShowEmployee} 
          className="nav-btn modal-btn"
        >
          6. Employee Modal
        </button>
      </div>
    </div>
  );
};

export default QuickNavigation;
