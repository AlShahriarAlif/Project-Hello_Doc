import React from 'react';
export const LoginContext = React.createContext({
    isLoggedIn:false,
    userID: null,
    userName: null,
    setIsLoggedIn: () =>{},
    setUserID:()=>{},
    setUserName:()=> {},
});
