import React from 'react';
import './TeamSection.css';

const TeamSection = () => {
  const leaders = [
    {
      name: 'Sam Altman',
      role: 'CEO',
      description: 'Sam Altman is an American entrepreneur who was president of the start-up accelerator Y Combinator from 2014 to 2019 and CEO of the AI company OpenAI beginning in 2019.',
      image: 'https://randomuser.me/api/portraits/men/1.jpg',
      social: {
        twitter: true,
        linkedin: true,
        youtube: true
      }
    },
    {
      name: 'Robert Steve',
      role: 'Co-Founder',
      description: 'Robert Altman is an American entrepreneur who was president of the start-up accelerator Y Combinator from 2014 to 2019 and CEO of the AI company OpenAI beginning in 2019.',
      image: 'https://randomuser.me/api/portraits/men/2.jpg',
      social: {
        twitter: true,
        linkedin: true,
        youtube: true
      }
    },
    {
      name: 'Robert Steve',
      role: 'CTO',
      description: 'Robert Altman is an American entrepreneur who was president of the start-up accelerator Y Combinator from 2014 to 2019 and CEO of the AI company OpenAI beginning in 2019.',
      image: 'https://randomuser.me/api/portraits/men/3.jpg',
      social: {
        twitter: true,
        linkedin: true,
        youtube: true
      }
    },
    {
      name: 'Robert Steve',
      role: 'COO',
      description: 'Robert Altman is an American entrepreneur who was president of the start-up accelerator Y Combinator from 2014 to 2019 and CEO of the AI company OpenAI beginning in 2019.',
      image: 'https://randomuser.me/api/portraits/men/4.jpg',
      social: {
        twitter: true,
        linkedin: true,
        youtube: true
      }
    }
  ];

  return (
    <section className="team-section">
      <div className="container">
        <h2 className="section-title">Meet our leaders</h2>
        <div className="leaders-grid">
          {leaders.map((leader, index) => (
            <div key={index} className="leader-card">
              <img src={leader.image} alt={leader.name} className="leader-image" />
              <h3 className="leader-name">{leader.name}</h3>
              <div className="social-links">
                {leader.social.twitter && <span className="social-icon">🐦</span>}
                {leader.social.linkedin && <span className="social-icon">💼</span>}
                {leader.social.youtube && <span className="social-icon">📺</span>}
              </div>
              <p className="leader-description">{leader.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default TeamSection;
