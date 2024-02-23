import React, { Fragment } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import './App.css';
import { LoginProvider } from './Components/loginprovider';
import Test from './Components/home';
import SearchDoc from './Components/searchDoc';
import Searchamb from './Components/Ambulance';
import Test1 from './Components/Test';
import Login from './Components/login';
import Resigtration from './Components/Registration';
import Test3 from './Components/test3';
import Hospitalhome from './Components/HospitalHome';
import DriverHome from './Components/DriverHome';
import Pendingamb from './Components/PendingAmb';
import Orderamb from './Components/OrderAmb';
import ServedHos from './Components/ServedHospital';
// Import other components as needed
function App() {
  return (
    <Router>
      <LoginProvider>
      <Fragment>
        {/* Define your routes inside the Routes component */}
        <Routes>
        <Route path="/login" element={<Login/>} />
          <Route path="/" element={<Test />} />
          <Route path="/doctors" element={<SearchDoc />} />
          <Route path="/ambulance" element={<Searchamb />} />
          <Route path="/test" element = {<Test1/>}/>
          <Route path="/Registration" element = {<Resigtration/>}/>
          <Route path='/test3' element ={<Test3/>}/>
          <Route path='/hospital' element ={<Hospitalhome/>}/>
          <Route path='/Driver' element ={<DriverHome/>}/>
          <Route path='/Pendingamb' element ={<Pendingamb/>}/>
          <Route path='/Orderedamb' element ={<Orderamb/>}/>
          <Route path='/ServedHos' element ={<ServedHos/>}/>
          {/* Add more routes as needed */}
        </Routes>
        </Fragment>
        </LoginProvider>
      
    </Router>
  );
}

export default App;
