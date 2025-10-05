import React from 'react';
import { Link } from 'react-router-dom';
import './CompaniesSection.css';

const CompaniesSection = () => {
  const companies = [
    {
      id: 1,
      name: 'Jasmine',
      logo: '🌸',
      description: 'This company Exports and Imports the Raw Materials',
      link: '/company/jasmine',
      linkText: 'Click here to visit'
    },
    {
      id: 2,
      name: 'RENAH COSMETICS',
      logo: '💄',
      description: 'This company Exports and Imports the Raw Materials',
      link: '/company/renah',
      linkText: 'Click here to visit'
    },
    {
      id: 3,
      name: 'Shanthi E-media',
      logo: '📱',
      description: 'This company Exports and Imports the Raw Materials',
      link: '/company/shanthi-emedia',
      linkText: 'Click here to visit'
    },
    {
      id: 4,
      name: 'Stabilform',
      logo: '🏗️',
      description: 'This company Exports and Imports the Raw Materials',
      link: '/company/stabilform',
      linkText: 'Click here to visit'
    }
  ];

  return (
    <section className="companies-section">
      <h2 className="section-title text-orange">Companies</h2>
      <div className="companies-grid">
        {companies.map(company => (
          <div key={company.id} className="company-card">
            <div className="company-logo">{company.logo}</div>
            <h3 className="company-name">{company.name}</h3>
            <p className="company-description">{company.description}</p>
            <Link to={company.link} className="company-link">
              🔗 {company.linkText}
            </Link>
          </div>
        ))}
      </div>
    </section>
  );
};

export default CompaniesSection;
