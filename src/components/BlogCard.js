import React from 'react';
import './BlogCard.css';

const BlogCard = ({ post }) => {
  return (
    <article className="blog-card">
      <div className="card-image-wrapper">
        <img src={post.image} alt={post.title} className="card-image" />
        <span className="card-category">{post.category}</span>
      </div>
      
      <div className="card-content">
        <div className="card-meta">
          <span className="card-date">{post.date}</span>
          <span className="card-read-time">{post.readTime}</span>
        </div>
        
        <h3 className="card-title">{post.title}</h3>
        <p className="card-excerpt">{post.excerpt}</p>
        
        <div className="card-footer">
          <div className="card-author">
            <div className="author-avatar">
              {post.author.charAt(0)}
            </div>
            <span className="author-name">{post.author}</span>
          </div>
          <a href="#" className="card-link">
            Read More →
          </a>
        </div>
      </div>
    </article>
  );
};

export default BlogCard;
