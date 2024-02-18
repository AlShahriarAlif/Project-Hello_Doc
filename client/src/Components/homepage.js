import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import SearchDoc from './searchDoc';
import SearchAmb from './searchAmb';

// Import the images
import doc_home from './doc_home.jpg';
import red_home from './red_home.jpg';

// Define the HomePage component
const HomePage = () => {
  const navigate = useNavigate();
  const [selectedTab, setSelectedTab] = useState('');

  const handleTabChange = (tab) => {
    setSelectedTab(tab);
    if (tab === 'doctor') {
      navigate('/doctors');
    } else if (tab === 'ambulance') {
      navigate('/ambulance');
    }
  };

  // Define the image state variable for the hover effect
  const [image, setImage] = useState(null);

  // Define the handleMouseEnter function for the hover effect
  const handleMouseEnter = (button) => {
    // Set the image according to the button
    if (button === 'doctor') {
      setImage(doc_home);
    } else if (button === 'ambulance') {
      setImage(red_home);
    }
  };

  // Define the handleMouseLeave function for the hover effect
  const handleMouseLeave = () => {
    // Clear the image
    setImage(null);
  };

  return (
    <div>
      <h1 style={{fontFamily:'Georgia',position:"relative",left:"100px",top:"180px"}}>What are you looking for...</h1>
      <div className="d-flex flex-column" style={{ position: 'relative', left: '100px', top: '200px' }}>
        <button type="button" className="btn btn-danger mb-3" style={{ width: '200px' }} onClick={() => handleTabChange('doctor')} onMouseEnter={() => handleMouseEnter('doctor')} onMouseLeave={handleMouseLeave}>Doctors!</button>
        <button type="button" className="btn btn-danger mb-3" style={{ width: '200px' }} onClick={() => handleTabChange('ambulance')} onMouseEnter={() => handleMouseEnter('ambulance')} onMouseLeave={handleMouseLeave}>Ambulance!</button>
        <button type="button" className="btn btn-danger" style={{ width: '200px' }}>Hospitals!</button>
      </div>
      {selectedTab === 'doctor' && <SearchDoc />}
      {selectedTab === 'ambulance' && <SearchAmb />}

      <div style={{ position: 'absolute', right: 200, top: 0, width: '600px', height: '100%' }}>
        {image && <img src={image} alt="Hover image" style={{ width: '100%', height: '100%', objectFit: 'cover' }} />}
      </div>
    </div>
  );
};

export default HomePage;