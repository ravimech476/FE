import React from 'react';
import BlogCard from './BlogCard';
import './BlogGrid.css';

const BlogGrid = () => {
  const blogPosts = [
    {
      id: 1,
      title: "Modern Construction Techniques",
      excerpt: "Explore the latest innovations in construction technology and how they're revolutionizing the industry.",
      date: "September 5, 2025",
      author: "John Smith",
      category: "Technology",
      image: "https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=500&h=300&fit=crop",
      readTime: "5 min read"
    },
    {
      id: 2,
      title: "Sustainable Building Materials",
      excerpt: "Discover eco-friendly alternatives that are changing the way we think about construction materials.",
      date: "September 3, 2025",
      author: "Sarah Johnson",
      category: "Sustainability",
      image: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500&h=300&fit=crop",
      readTime: "7 min read"
    },
    {
      id: 3,
      title: "Project Management Best Practices",
      excerpt: "Learn effective strategies for managing construction projects from start to finish.",
      date: "September 1, 2025",
      author: "Mike Davis",
      category: "Management",
      image: "https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=500&h=300&fit=crop",
      readTime: "6 min read"
    },
    {
      id: 4,
      title: "Concrete Innovation Trends",
      excerpt: "The future of concrete: self-healing materials and smart concrete solutions.",
      date: "August 28, 2025",
      author: "Emily Chen",
      category: "Innovation",
      image: "https://images.unsplash.com/photo-1587582345426-bf07f534b063?w=500&h=300&fit=crop",
      readTime: "4 min read"
    },
    {
      id: 5,
      title: "Safety Standards in Construction",
      excerpt: "Understanding and implementing the latest safety protocols on construction sites.",
      date: "August 25, 2025",
      author: "Robert Wilson",
      category: "Safety",
      image: "https://images.unsplash.com/photo-1578662996442-48f60103fc31?w=500&h=300&fit=crop",
      readTime: "8 min read"
    },
    {
      id: 6,
      title: "Cost-Effective Building Solutions",
      excerpt: "Maximize your budget without compromising on quality with these proven strategies.",
      date: "August 22, 2025",
      author: "Lisa Anderson",
      category: "Finance",
      image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=500&h=300&fit=crop",
      readTime: "5 min read"
    }
  ];

  return (
    <section className="blog-section" id="blog">
      <div className="container">
        <div className="section-header">
          <h2 className="section-title">Latest Blog Posts</h2>
          <p className="section-subtitle">
            Stay updated with the latest trends and insights in the construction industry
          </p>
        </div>
        
        <div className="blog-grid">
          {blogPosts.map(post => (
            <BlogCard key={post.id} post={post} />
          ))}
        </div>
        
        <div className="blog-footer">
          <button className="btn btn-primary">Load More Articles</button>
        </div>
      </div>
    </section>
  );
};

export default BlogGrid;
