import React, { Fragment } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import './App.css';
import Test from './Components/homepage';
import SearchDoc from './Components/searchDoc';
import Searchamb from './Components/searchAmb';
import Test1 from './Components/Test';
import Login from './Components/login';
import Resigtration from './Components/Registration';
// Import other components as needed
function App() {
  return (
    <Router>
      <Fragment>
        {/* Define your routes inside the Routes component */}
        <Routes>
        <Route path="/login" element={<Login/>} />
          <Route path="/" element={<Test />} />
          <Route path="/doctors" element={<SearchDoc />} />
          <Route path="/ambulance" element={<Searchamb />} />
          <Route path="/test" element = {<Test1/>}/>
          <Route path="/Registration" element = {<Resigtration/>}/>
          {/* Add more routes as needed */}
        </Routes>
      </Fragment>
    </Router>
  );
}

export default App;
