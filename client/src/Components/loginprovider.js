import React, { useState } from 'react';
import { LoginContext } from './logincontext';

export const LoginProvider = ({ children }) => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [username, setUsername] = useState('');
  
return (
    <LoginContext.Provider value={{ isLoggedIn, setIsLoggedIn, username, setUsername }}>
      {children}
    </LoginContext.Provider>
  );
};
