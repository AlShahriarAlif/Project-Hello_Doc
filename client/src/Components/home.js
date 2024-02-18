import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom"; 
import "./homepage.css"; 

const Navbar = () => {
  
  
  const navigate = useNavigate(); 
  return (
    <nav class="navbar navbar-expand-custom navbar-mainbg">
    <a class="navbar-brand navbar-logo" href="#">Hello_Doc</a>
    {/* <button class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <i class="fas fa-bars text-white"></i>
    </button> */}
    <div  id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <div class="hori-selector"><div class="left"></div><div class="right"></div></div>
            <li class="nav-item">
                <Link to="/hospitals" class="nav-link"><i class="fas fa-tachometer-alt"></i>HOSPITALS</Link>
            </li>
            <li class="nav-item">
                <Link to="/ambulance" class="nav-link"><i class="far fa-clone"></i>Ambulance</Link>
            </li>
            <li class="nav-item">
                <Link to="/doctors" class="nav-link"><i class="far fa-calendar-alt"></i>Doctor</Link>
            </li>
            <li class="nav-item">
                <a class="nav-link" onClick={() => navigate("/login")}><i class="far fa-chart-bar"></i>Login/SignUp</a>
            </li>
        </ul>
    </div>
</nav>
  );
};

export default Navbar;