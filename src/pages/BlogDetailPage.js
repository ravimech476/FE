import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';
import './BlogDetailPage.css';

const BlogDetailPage = () => {
  const [comment, setComment] = useState('');
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [website, setWebsite] = useState('');

  const morePosts = [
    { name: 'Carl Smith', title: 'Business professional like me are constantly in need of more...' },
    { name: 'Sam Smith', title: 'Business professional like me are constantly in need of more...' },
    { name: 'Katy Mills', title: 'Business professional like me are constantly in need of more...' }
  ];

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission
    console.log({ comment, name, email, website });
  };

  return (
    <div className="blog-detail-page">
      <Header />
      
      <div className="blog-sub-header">
        <div className="container">
          <div className="blog-nav">
            <div className="blog-logo">
              <span className="logo-icon">🌸</span>
              <span className="logo-text">Jasmine concrete exports</span>
            </div>
            <Link to="/" className="home-link">Home</Link>
          </div>
        </div>
      </div>

      <div className="container">
        <div className="blog-content-wrapper">
          <main className="blog-main">
            <article className="blog-article">
              <img 
                src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=400&fit=crop" 
                alt="Mountain landscape" 
                className="blog-hero-image"
              />
              
              <div className="blog-meta">
                <h1 className="blog-title">Vasanth Kumar Venkatasamy</h1>
                <h2 className="blog-subtitle">Visionary Leader in the Global Fragrance Industry</h2>
              </div>

              <div className="blog-highlight">
                <p>"Our products don't just carry the scent of nature — they carry the stories of the people and places they come from." – Vasanth Kumar Venkatasamy</p>
              </div>

              <div className="blog-body">
                <p>With over two decades of leadership excellence, Vasanth Kumar Venkatasamy has been a driving force behind the growth and global reach of Jasmine Concrete Exports Private Limited — a leader and pioneer in the natural ingredients and fragrance sector.</p>
                
                <p>Serving as the company's Managing Director since 2010, Vasanth Kumar has successfully combined tradition, innovation, and global market insight to position the company as a trusted partner for the world's finest perfumers and flavor houses.</p>
                
                <h3>Journey of Leadership</h3>
                
                <p>Vasanth Kumar began his association with Jasmine Concrete Exports in 2001, bringing a unique blend of strategic thinking and operational expertise. Under his guidance, the company expanded its sourcing networks, strengthened relationships with rural farming communities, and implemented sustainable practices that have become industry benchmarks.</p>
                
                <h3>Global Outlook, Local Roots</h3>
                
                <p>His vision has always been rooted in the idea that quality and sustainability go hand in hand. By fostering close partnerships with farmers and investing in modern processing facilities, Vasanth Kumar has ensured that Jasmine Concrete maintains its reputation for delivering natural, high-quality products to clients worldwide.</p>
                
                <h3>Beyond Jasmine Concrete</h3>
                
                <p>In addition to his role as Managing Director, Vasanth Kumar serves as a director in over 20 companies across various industries — from agri-exports and manufacturing to environmental solutions. This breadth of experience reflects his versatility and commitment to India's industrial and economic development.</p>
                
                <h3>Commitment to Sustainability</h3>
                
                <p>A strong advocate for ethical sourcing and environmental stewardship, Vasanth Kumar has championed initiatives to reduce the environmental impact of production while improving the livelihoods of local communities. His work aligns with global sustainability goals, making Jasmine Concrete a model for socially responsible business.</p>
              </div>

              <div className="comment-section">
                <h3>Leave a Reply</h3>
                <p className="comment-note">Your email address will not be published. Required fields are marked *</p>
                
                <form onSubmit={handleSubmit} className="comment-form">
                  <div className="form-group">
                    <label>Comment *</label>
                    <textarea 
                      value={comment}
                      onChange={(e) => setComment(e.target.value)}
                      rows="6"
                      required
                    ></textarea>
                  </div>
                  
                  <div className="form-group">
                    <label>Name *</label>
                    <input 
                      type="text"
                      value={name}
                      onChange={(e) => setName(e.target.value)}
                      required
                    />
                  </div>
                  
                  <div className="form-group">
                    <label>Email *</label>
                    <input 
                      type="email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      required
                    />
                  </div>
                  
                  <div className="form-group">
                    <label>Website</label>
                    <input 
                      type="url"
                      value={website}
                      onChange={(e) => setWebsite(e.target.value)}
                    />
                  </div>
                  
                  <div className="form-group">
                    <label className="checkbox-label">
                      <input type="checkbox" />
                      <span>Save my name, email, and website in this browser for the next time I comment.</span>
                    </label>
                  </div>
                  
                  <button type="submit" className="submit-btn">POST COMMENT</button>
                </form>
              </div>
            </article>
          </main>

          <aside className="blog-sidebar">
            <div className="sidebar-section">
              <h3>Written By</h3>
              <div className="author-card">
                <img src="https://i.pravatar.cc/100?img=7" alt="Carl Smith" />
                <h4>Carl Smith</h4>
                <p>Business professional like me are constantly in need of more...</p>
              </div>
            </div>

            <div className="sidebar-section">
              <h3>More Posts</h3>
              <div className="more-posts">
                {morePosts.map((post, index) => (
                  <div key={index} className="post-item">
                    <img src={`https://i.pravatar.cc/60?img=${index + 10}`} alt={post.name} />
                    <div>
                      <h4>{post.name}</h4>
                      <p>{post.title}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </aside>
        </div>

        <footer className="blog-footer">
          <p>© copyright Jasmine All Rights Reserved</p>
        </footer>
      </div>
    </div>
  );
};

export default BlogDetailPage;
