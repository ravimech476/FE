import React from 'react';
import './NewsSection.css';

const NewsSection = () => {
  const newsItems = [
    {
      id: 1,
      title: "Experience the Essence of Elegance Pure Jasmine, Perfectly Captured.",
      image: "https://images.unsplash.com/photo-1562088287-bde35a1ea917?w=400&h=250&fit=crop",
      readMore: "#"
    },
    {
      id: 2,
      title: "A cup of jasmine tea provides a refreshing and calming experience.",
      image: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=250&fit=crop",
      readMore: "#"
    },
    {
      id: 3,
      title: "The sweet fragrance of jasmine fills the air on warm summer nights.",
      image: "https://images.unsplash.com/photo-1528821128474-27f963b062bf?w=400&h=250&fit=crop",
      readMore: "#"
    },
    {
      id: 4,
      title: "A cup of jasmine tea provides a refreshing and calming experience.",
      image: "https://images.unsplash.com/photo-1587735243615-c03f25aaff15?w=400&h=250&fit=crop",
      readMore: "#"
    }
  ];

  return (
    <section className="news-section">
      <h2 className="section-title text-orange">Company news</h2>
      <div className="news-grid">
        {newsItems.map(item => (
          <div key={item.id} className="news-card">
            <div className="news-image-wrapper">
              <img src={item.image} alt={item.title} className="news-image" />
              <div className="news-overlay">
                <h3 className="news-title">{item.title}</h3>
                <a href={item.readMore} className="read-more-btn">Read More</a>
              </div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
};

export default NewsSection;
