import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext';
import './PendingMoney.css';

const PendingMoney = () => {
    const { userID } = useContext(LoginContext);
    const [results, setResults] = useState([]);
    console.log(userID);
    
    const getData = async () => {
        try {
            const response = await fetch(`http://localhost:5000/pendingdriverreq?Owner_ID=${userID}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                },
            });
    
            if (!response.ok) {
                throw new Error('Failed to fetch data');
            }
    
            const data = await response.json();
            console.log(data);
          //  console.log(data[0]['ambulance_id']); // Access first element of the array
            setResults(data); 
        } catch (error) {
            console.error('Error:', error);
        }
    };
    
    useEffect(() => {
        getData();
    }, [userID]);

    // useEffect(() => {
    //     console.log(results); // Log results after it's updated
    //     console.log(results.length > 0 ? results[0]['ambulance_id'] : undefined); // Log ambulance_id after it's updated
    // }, [results]); // Add results as a dependency for useEffect
  return (
   

    <div className='body_w'>
       
      <div className='pricing-box-container'>
        <div className='pricing-box text-center'>
          {/* <h5>Platinum</h5> */}
          {/* <p className='price'>
            <sup>$</su
            p>89<sub>/mo</sub>
          </p> */}
            {results.map((result, index) => (
              // <strong>Ambulace ID:</strong>
        <p className='features-list' key={index}><strong>Ambulace ID: </strong>{result['ambulance_id']}</p>
        
        
      ))}
         {results.map((result, index) => (
        <li className='features-list' key={index}>{result['dri_id']}</li>
        
        
      ))}
       {results.map((result, index) => (
        <li className='features-list' key={index}>{result['problem']}</li>
        
        
      ))}
       {results.map((result, index) => (
        <li className='features-list' key={index}>{result['amount']}</li>
        
        
      ))}
          <button className='btn-primary'>Grant</button>
        </div>
      </div>
    </div>
  );
};

export default PendingMoney;
