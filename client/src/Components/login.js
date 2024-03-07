import React, { useState, useContext ,useEffect} from "react";
import { Link, useNavigate } from "react-router-dom"; 
import { LoginContext } from './logincontext';
import {AmbulanceLogInContext} from './ambulancelogincotext';

const Login = () => {
    const { setIsLoggedIn, setUserName, setUserID, userID } = useContext(LoginContext);
    const {AmbulanceID,setAmbulanceID} = useContext(AmbulanceLogInContext);
    const [inputs, setInputs] = useState({
        firstName: "",
        password: "",
        userType: "Normal User", // Default to Normal User
    });
    const { firstName, password, userType } = inputs;
    const onChange = (e) => {
        setInputs({ ...inputs, [e.target.name]: e.target.value });
    };
    useEffect(() => {
        console.log('userID set:', userID);
    }, [userID]);

    const onSubmitForm = async (e) => {
        e.preventDefault();
        const formData = { firstName, password }; // Remove userType from formData
        let loginUrl = "";
        switch(userType) {
            case "Driver":
                loginUrl = "http://localhost:5000/login/Driver";
                break;
            case "Hospital Owner":
                loginUrl = "http://localhost:5000/login/Hospital";
                break;
            case "Admin":
                loginUrl = "http://localhost:5000/login/Admin";
                break;
            default:
                loginUrl = "http://localhost:5000/login"; // Default to Normal User
        }
        const res = await fetch(loginUrl, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(formData),
        });
        if (!res.ok) {
            window.alert("YOU MUST HAVE DONE SOMETHING WRONG.");
        } else {
            const data = await res.json();
            console.log('Login response data:', data); // Add this line
            setIsLoggedIn(true);
            setUserName(firstName);
             
            switch(userType) {
                case "Driver":
                    setUserID(data['driver_id']);
                    setAmbulanceID(data['ambulance_id']);
                    console.log('userID set:', userID);
                    console.log("Amb ID: ",AmbulanceID);
                   navigate("/Driver");
                    break;
                case "Hospital Owner":
                    if (data.length > 0) {
                        setUserID(data[0]['ID']);
                        console.log('userID set:', userID);
                    }
                    navigate("/OwnerLogin");
                    break;
                case "Admin":
                    navigate("/");
                    break;
                default:
                    setUserID(data[0]['Reg. Number']);
                    console.log('userID set:', userID);
                    
                    navigate("/"); // Default to Normal User
            }
            //console.log(setID);
        }
    };

    const navigate = useNavigate();
    return (
        <div>
            <body className="antialiased bg-gradient-to-br from-green-100 to-white">
                <div className="container px-6 mx-auto">
                    <div className="flex flex-col text-center md:text-left md:flex-row h-screen justify-evenly md:items-center">
                        <div className="flex flex-col w-full">
                            <div>
                                <svg
                                    className="w-20 h-20 mx-auto md:float-left fill-stroke text-gray-800"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        strokeLinecap="round"
                                        strokeLinejoin="round"
                                        strokeWidth="2"
                                        d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"
                                    ></path>
                                </svg>
                            </div>
                            <h1 className="text-5xl text-gray-800 font-bold">Hello DOC</h1>
                        </div>
                        <div className="w-full md:w-full lg:w-9/12 mx-auto md:mx-0">
                            <div className="bg-white p-10 flex flex-col w-full shadow-xl rounded-xl">
                                <h2 className="text-2xl font-bold text-gray-800 text-left mb-5 mt-10 ">Sign In</h2>
                                <form onSubmit={onSubmitForm} className="w-full">
                                    <div className="flex flex-col w-full my-5 text-align-center">
                                        <label htmlFor="firstname" className="text-gray-500 mb-2">First Name</label>
                                        <input
                                            type="text"
                                            name="firstName"
                                            placeholder="First Name"
                                            className="appearance-none border-2 border-gray-100 rounded-lg px-4 py-3 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-600 focus:shadow-lg"
                                            value={firstName}
                                            onChange={(e) => onChange(e)}
                                        />
                                    </div>
                                    <div className="flex flex-col w-full my-5">
                                        <label htmlFor="password" className="text-gray-500 mb-2">Password</label>
                                        <input
                                            type="password"
                                            name="password"
                                            placeholder="Please insert your password"
                                            className="appearance-none border-2 border-gray-100 rounded-lg px-4 py-3 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-600 focus:shadow-lg"
                                            value={password}
                                            onChange={(e) => onChange(e)}
                                        />
                                    </div>
                                    <div className="flex flex-col w-full my-5">
                                        <label htmlFor="userType" className="text-gray-500 mb-2">User Type</label>
                                        <select
                                            name="userType"
                                            value={userType}
                                            onChange={(e) => onChange(e)}
                                            className="appearance-none border-2 border-gray-100 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-green-600 focus:shadow-lg"
                                        >
                                            <option key="normal" value="Normal User">Normal User</option>
                                            <option key="driver" value="Driver">Driver</option>
                                            <option key="hospital_owner" value="Hospital Owner">Hospital Owner</option>
                                            <option key="admin" value="Admin">Admin</option>
                                        </select>
                                    </div>
                                    <div className="flex flex-col w-full my-5">
                                        <button
                                            type="submit"
                                            className="w-full py-4 bg-green-600 rounded-lg text-green-100"
                                        >
                                            <div className="flex flex-row items-center justify-center">
                                                <div className="mr-2">
                                                    <svg
                                                        className="w-6 h-6"
                                                        fill="none"
                                                        stroke="currentColor"
                                                        viewBox="0 0 24 24"
                                                        xmlns="http://www.w3.org/2000/svg"
                                                    >
                                                        <path
                                                            strokeLinecap="round"
                                                            strokeLinejoin="round"
                                                            strokeWidth="2"
                                                            d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"
                                                        ></path>
                                                    </svg>
                                                </div>
                                                <div className="font-bold">Sign IN</div>
                                            </div>
                                        </button>
                                        <div className="flex justify-evenly mt-5">
                                            <p>Don't have an account?</p>
                                            <li>
                                            <a className="w-full text-center font-medium text-gray-500" onClick={() => navigate("/Registration")}>Create an account</a>
                                            </li>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </div>
    );
};

export default Login;