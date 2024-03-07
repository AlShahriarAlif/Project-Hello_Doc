import React, { useState } from 'react';
import { AmbulanceLogInContext } from './ambulancelogincotext';

export const AmbulaceIdProvider = ({ children }) => {
  const [AmbulanceID,setAmbulanceID] = useState('');
  return (
    <AmbulanceLogInContext.Provider value={{ AmbulanceID, setAmbulanceID }}>
      {children}
    </AmbulanceLogInContext.Provider>
  );
};