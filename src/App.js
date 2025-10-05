import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import './App.css';
import { AuthProvider } from './contexts/AuthContext';
import { SocketProvider } from './contexts/SocketContext';
import Header from './components/Header';
import HomePage from './pages/HomePage';
import CompanyPage from './pages/CompanyPage';
import ContactPage from './pages/ContactPage';
import NewsPage from './pages/NewsPage';
import Login from './components/Login';
import BlogList from './components/BlogList';
import BlogPost from './components/BlogPost';
import BlogEditor from './components/BlogEditor';
import Dashboard from './components/Dashboard';
import PrivateRoute from './components/PrivateRoute';
import EmployeeModal from './components/EmployeeModal';
import LeadersManagement from './components/LeadersManagement';
import NewsManagement from './components/NewsManagement';
import NewsDetailPage from './pages/NewsDetailPage';

function App() {
  const [selectedEmployee, setSelectedEmployee] = useState(null);

  return (
    <AuthProvider>
      <SocketProvider>
        <Router>
        <div className="App">
          <Header />
          <div className="app-content">
            <Routes>
              {/* Public Routes */}
              <Route path="/" element={<HomePage setSelectedEmployee={setSelectedEmployee} />} />
              <Route path="/login" element={<Login />} />
              <Route path="/blog" element={<BlogList />} />
              <Route path="/blog/:slug" element={<BlogPost />} />
              <Route path="/company/:companyName" element={<CompanyPage />} />
              <Route path="/contact" element={<ContactPage />} />
              <Route path="/news" element={<NewsPage />} />
              <Route path="/news/:id" element={<NewsDetailPage />} />
              
              {/* Protected Routes - Only for logged in employees */}
              <Route path="/dashboard" element={
                <PrivateRoute>
                  <Dashboard />
                </PrivateRoute>
              } />
              <Route path="/blog/new" element={
                <PrivateRoute>
                  <BlogEditor />
                </PrivateRoute>
              } />
              <Route path="/blog/edit/:id" element={
                <PrivateRoute>
                  <BlogEditor />
                </PrivateRoute>
              } />
              
              {/* Admin Only - Leaders Management */}
              <Route path="/leaders/manage" element={
                <PrivateRoute adminOnly={true}>
                  <LeadersManagement />
                </PrivateRoute>
              } />
              
              {/* Admin Only - News Management */}
              <Route path="/news/manage" element={
                <PrivateRoute adminOnly={true}>
                  <NewsManagement />
                </PrivateRoute>
              } />
              
              {/* Redirect any unknown routes to home */}
              <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
          </div>
          
          {/* Employee Modal */}
          {selectedEmployee && (
            <EmployeeModal 
              employee={selectedEmployee} 
              onClose={() => setSelectedEmployee(null)} 
            />
          )}
        </div>
      </Router>
        </SocketProvider>
        </AuthProvider>
  );
}

export default App;
