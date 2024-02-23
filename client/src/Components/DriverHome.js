import React, { useContext } from 'react';
import { Link, useNavigate } from 'react-router-dom'; 
import { LoginContext } from './logincontext';

import "./DriverHome.css"; 

const Navbar = () => {
  
    const { isLoggedIn, username } = useContext(LoginContext);

  const navigate = useNavigate(); 
  return (
    <nav className="navbar navbar-expand-custom navbar-mainbg">
      <a className="navbar-brand navbar-logo" href="#">Hello_Doc</a>
      <div id="navbarSupportedContent">
        <ul className="navbar-nav ml-auto">
          <div className="hori-selector"><div className="left"></div><div className="right"></div></div>
          <li className="nav-item">
            <Link to="/Orderedamb" className="nav-link"><i className="fas fa-tachometer-alt"></i>Order History</Link>
          </li>
          <li className="nav-item">
            <Link to="/Pendingamb" className="nav-link"><i className="far fa-clone"></i>Pending Orders</Link>
          </li>
          <li className="nav-item">
            <Link to="/ServedHos" className="nav-link"><i className="far fa-calendar-alt"></i>Served Hospital</Link>
          </li>
          <li className="nav-item">
            {isLoggedIn ? (
              <a className="nav-link"><i className="far fa-chart-bar"></i>{username}</a>
              ) : (
                <a className="nav-link" onClick={() => navigate("/login")}><i className="far fa-chart-bar"></i>Login/SignUp</a>
              )}
            </li>
          </ul>
        </div>
      </nav>
  
  );
};

export default Navbar;