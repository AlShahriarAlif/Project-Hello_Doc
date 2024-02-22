import React, { useState } from 'react';
import { LoginContext } from './logincontext';

export const LoginProvider = ({ children }) => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [username, setUserName] = useState('');
  const [userID,setUserID] = useState('');
  return (
    <LoginContext.Provider value={{ isLoggedIn, setIsLoggedIn, username, setUserName,userID,setUserID }}>
      {children}
    </LoginContext.Provider>
  );
};