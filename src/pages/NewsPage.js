import React, { useState } from 'react';
import Header from '../components/Header';
import './NewsPage.css';

const NewsPage = () => {
  const [selectedCategory, setSelectedCategory] = useState('all');
  
  const categories = [
    { id: 'all', name: 'All News' },
    { id: 'company', name: 'Company News' },
    { id: 'industry', name: 'Industry Updates' },
    { id: 'events', name: 'Events' },
    { id: 'awards', name: 'Awards' },
    { id: 'products', name: 'Products' }
  ];

  const newsArticles = [
    {
      id: 1,
      title: "Shanthi Groups Expands Operations to Southeast Asia",
      excerpt: "We are excited to announce our expansion into the Southeast Asian market with new offices in Singapore and Malaysia.",
      date: "September 8, 2025",
      category: "company",
      image: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600&h=400&fit=crop",
      author: "Admin",
      featured: true
    },
    {
      id: 2,
      title: "Jasmine Concrete Exports Wins Excellence Award",
      excerpt: "Our subsidiary Jasmine Concrete Exports has been recognized with the Industry Excellence Award for sustainable practices.",
      date: "September 5, 2025",
      category: "awards",
      image: "https://images.unsplash.com/photo-1567427017947-545c5f8d16ad?w=600&h=400&fit=crop",
      author: "PR Team"
    },
    {
      id: 3,
      title: "New Product Launch: Eco-Friendly Construction Materials",
      excerpt: "Introducing our revolutionary eco-friendly construction materials that reduce carbon footprint by 40%.",
      date: "September 3, 2025",
      category: "products",
      image: "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=600&h=400&fit=crop",
      author: "Product Team"
    },
    {
      id: 4,
      title: "Annual Conference 2025: Building Tomorrow Together",
      excerpt: "Join us for our annual conference featuring industry leaders and innovative discussions about the future of construction.",
      date: "August 28, 2025",
      category: "events",
      image: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=600&h=400&fit=crop",
      author: "Events Team"
    },
    {
      id: 5,
      title: "Industry Report: Construction Sector Growth in 2025",
      excerpt: "Latest industry analysis shows promising growth trends in the construction and materials sector.",
      date: "August 25, 2025",
      category: "industry",
      image: "https://images.unsplash.com/photo-1460472178825-e5240623afd5?w=600&h=400&fit=crop",
      author: "Research Team"
    },
    {
      id: 6,
      title: "Partnership Announcement with Global Tech Leader",
      excerpt: "Strategic partnership formed to integrate AI and IoT solutions in construction management.",
      date: "August 20, 2025",
      category: "company",
      image: "https://images.unsplash.com/photo-1521791136064-7986c2920216?w=600&h=400&fit=crop",
      author: "Admin"
    },
    {
      id: 7,
      title: "Sustainability Initiative: Zero Waste by 2030",
      excerpt: "Shanthi Groups commits to achieving zero waste operations across all facilities by 2030.",
      date: "August 15, 2025",
      category: "company",
      image: "https://images.unsplash.com/photo-1532996122724-e3c354a0b15b?w=600&h=400&fit=crop",
      author: "Sustainability Team"
    },
    {
      id: 8,
      title: "Q2 2025 Financial Results Exceed Expectations",
      excerpt: "Strong financial performance with 25% growth in revenue compared to previous quarter.",
      date: "August 10, 2025",
      category: "company",
      image: "https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=600&h=400&fit=crop",
      author: "Finance Team"
    },
    {
      id: 9,
      title: "New Manufacturing Facility Opening in Chennai",
      excerpt: "State-of-the-art manufacturing facility to create 500 new jobs in the Chennai region.",
      date: "August 5, 2025",
      category: "company",
      image: "https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=600&h=400&fit=crop",
      author: "Operations Team"
    }
  ];

  const filteredNews = selectedCategory === 'all' 
    ? newsArticles 
    : newsArticles.filter(article => article.category === selectedCategory);

  const featuredArticle = newsArticles.find(article => article.featured);

  return (
    <div className="news-page">
      <Header />
      
      <div className="news-hero">
        <div className="hero-overlay"></div>
        <div className="hero-content">
          <h1>Latest News & Updates</h1>
          <p>Stay informed about Shanthi Groups' latest developments</p>
        </div>
      </div>

      <div className="container">
        {/* Featured Article */}
        {featuredArticle && (
          <div className="featured-article">
            <div className="featured-image">
              <img src={featuredArticle.image} alt={featuredArticle.title} />
              <span className="featured-badge">Featured</span>
            </div>
            <div className="featured-content">
              <h2>{featuredArticle.title}</h2>
              <p className="featured-excerpt">{featuredArticle.excerpt}</p>
              <div className="featured-meta">
                <span className="date">📅 {featuredArticle.date}</span>
                <span className="author">✍️ {featuredArticle.author}</span>
                <span className="category">{featuredArticle.category}</span>
              </div>
              <button className="read-more-btn">Read Full Article →</button>
            </div>
          </div>
        )}

        {/* Category Filter */}
        <div className="category-filter">
          <h3>Filter by Category:</h3>
          <div className="category-buttons">
            {categories.map(category => (
              <button
                key={category.id}
                className={`category-btn ${selectedCategory === category.id ? 'active' : ''}`}
                onClick={() => setSelectedCategory(category.id)}
              >
                {category.name}
              </button>
            ))}
          </div>
        </div>

        {/* News Grid */}
        <div className="news-grid">
          {filteredNews.map(article => (
            <article key={article.id} className="news-article">
              <div className="article-image">
                <img src={article.image} alt={article.title} />
                <span className="article-category">{article.category}</span>
              </div>
              <div className="article-content">
                <h3>{article.title}</h3>
                <p>{article.excerpt}</p>
                <div className="article-meta">
                  <span className="date">📅 {article.date}</span>
                  <span className="author">✍️ {article.author}</span>
                </div>
                <a href={`/blog/${article.id}`} className="article-link">
                  Read More →
                </a>
              </div>
            </article>
          ))}
        </div>

        {/* Newsletter Section */}
        <div className="newsletter-section">
          <div className="newsletter-content">
            <h2>Subscribe to Our Newsletter</h2>
            <p>Get the latest news and updates delivered to your inbox</p>
            <form className="newsletter-form">
              <input type="email" placeholder="Enter your email address" />
              <button type="submit">Subscribe</button>
            </form>
          </div>
        </div>

        {/* Archive Section */}
        <div className="archive-section">
          <h2 className="section-title text-orange">News Archive</h2>
          <div className="archive-grid">
            <div className="archive-column">
              <h3>2025</h3>
              <ul>
                <li><a href="#">September (5)</a></li>
                <li><a href="#">August (12)</a></li>
                <li><a href="#">July (8)</a></li>
                <li><a href="#">June (10)</a></li>
              </ul>
            </div>
            <div className="archive-column">
              <h3>2024</h3>
              <ul>
                <li><a href="#">December (15)</a></li>
                <li><a href="#">November (11)</a></li>
                <li><a href="#">October (9)</a></li>
                <li><a href="#">September (7)</a></li>
              </ul>
            </div>
            <div className="archive-column">
              <h3>Popular Tags</h3>
              <div className="tags">
                <span className="tag">Construction</span>
                <span className="tag">Sustainability</span>
                <span className="tag">Innovation</span>
                <span className="tag">Awards</span>
                <span className="tag">Partnership</span>
                <span className="tag">Technology</span>
              </div>
            </div>
            <div className="archive-column">
              <h3>Quick Links</h3>
              <ul>
                <li><a href="#">Press Releases</a></li>
                <li><a href="#">Media Kit</a></li>
                <li><a href="#">Company Reports</a></li>
                <li><a href="#">Contact PR Team</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <footer className="news-footer">
        <div className="container">
          <p>© 2025 Shanthi Groups. All Rights Reserved.</p>
        </div>
      </footer>
    </div>
  );
};

export default NewsPage;
