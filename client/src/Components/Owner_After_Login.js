import React, { useContext } from 'react';
import { Link, useNavigate } from 'react-router-dom'; 
import { LoginContext } from './logincontext';

import "./homepage1.css"; 

const Navbar = () => {
    const{userID}=useContext(LoginContext);
    console.log("Bal: ",userID)
  return (
    <div className='newbody'>
    <nav className="navbar navbar-expand-custom navbar-mainbg">
      <a className="navbar-brand navbar-logo" href="#">Hello_Doc</a>
      <div id="navbarSupportedContent">
        <ul className="navbar-nav ml-auto">
          <div className="hori-selector"><div className="left"></div><div className="right"></div></div>
          <button className="nav-item">
            <Link to="/PendingMoney" className="nav-link"><i className="fas fa-tachometer-alt"></i>Pending Money Grant</Link>
          </button>
        </ul>
        </div>
      </nav>
      </div>
  );
};

export default Navbar;