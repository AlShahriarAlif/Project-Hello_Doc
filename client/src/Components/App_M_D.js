import React, { useState, useEffect, useContext } from 'react';
import './App_M_D.css';
import { AmbulanceLogInContext } from './ambulancelogincotext';
import { LoginContext } from './logincontext';

const RepairPage = () => {
  const {userID} = useContext(LoginContext);
  const { AmbulanceID } = useContext(AmbulanceLogInContext);
  const [problem, setProblem] = useState('');
  const [cost, setCost] = useState('');

  console.log(userID);
  console.log(AmbulanceID);
  const handleSubmit = async (e) => {
    e.preventDefault();
    const response = await fetch('http://localhost:5000/applyformoney', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
     
      body: JSON.stringify({
        driverID: userID,
        problem,
        cost,
        ambulanceId: AmbulanceID,
      }),
    });
    
    const data = await response.json();
    if(data.success===0) {
      alert("Data was submitted properly");
    } else {
      alert("Maybe some error occurred we are trying to fix it");
    }  
  };

  return (
    <body className='body'>
      <div class="container">
        <div class="text">
          Apply For Grant Form
        </div>
        <form onSubmit={handleSubmit}>
          <div class="form-row">
            <div class="input-data">
              <input type="text" required value={problem} onChange={e => setProblem(e.target.value)}/>
              <div class="underline"></div>
              <label for="">Describe Your Problem</label>
            </div>
          </div>
          <div class="form-row">
            <div class="input-data">
              <input type="text" required value={cost} onChange={e => setCost(e.target.value)}/>
              <div class="underline"></div>
              <label for="">Amount</label>
            </div>
          </div>
          <div class="form-row submit-btn">
            <div class="input-data">
              <div class="inner"></div>
              <input type="submit" value="submit"/>
            </div>
          </div>
        </form>
      </div>
    </body>
  );
}

export default RepairPage;
