import React, { Fragment, useState ,useContext } from 'react';
import { Link, useNavigate } from "react-router-dom"; 
import { LoginContext } from './logincontext';
const Registration = () => {
    const { setIsLoggedIn, setUsername } = useContext(LoginContext);
    const [inputs, setInputs] = useState({
        firstName: "",
        email: "",
        password: "",
        location:"",

    });
    const { firstName, email, password ,location} = inputs;
    const onChange = (e) => {
        setInputs({ ...inputs, [e.target.name]: e.target.value });
    };

    const onSubmitForm = async (e) => {
        e.preventDefault();
        const hello = { firstName, email, password,location };
        console.log(hello);
        const res = await fetch("http://localhost:5000/Registration", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "type": "Normal User"
            },
            body: JSON.stringify(hello),
        });
        if (!res.ok) {
            throw new Error(res.status);
        } else {
            setIsLoggedIn(true);
            setUsername(firstName);
            navigate("/ambulance");
        }
    };

    const navigate = useNavigate();

    return (
        <Fragment>
            <div className="w-full h-auto overflow-scroll block h-screen bg-gradient-to-r from-blue-100 via-purple-100 to-pink-100 p-4 flex items-center justify-center" >
                <div className="bg-white py-6 px-10 sm:max-w-md w-full ">
                    <div className="sm:text-3xl text-2xl font-semibold text-center text-sky-600  mb-12">
                        Sign Up Form
                    </div>
                    <form onSubmit={onSubmitForm} className="">
                        <div>
                            <input type="text" className="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500" onChange={(e) => onChange(e)} placeholder="Name " name="firstName" />
                        </div>
                        <div>
                            <input type="email" className="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500 my-8" onChange={(e) => onChange(e)} placeholder="Email Address " name="email" />
                        </div>
                        <div className="">
                            <input type="password" className="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500 mb-8" onChange={(e) => onChange(e)} placeholder="Password " name="password" />
                        </div>
                        <div>
                            <input type="text" className="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500" onChange={(e) => onChange(e)} placeholder="Location " name="location" />
                        </div>
                        <div className="flex justify-center my-6">
                            <button type="submit" className="rounded-full  p-3 w-full sm:w-56   bg-gradient-to-r from-sky-600  to-teal-300 text-white text-lg font-semibold" >
                                Create Account
                            </button>
                        </div>
                        <div className="flex justify-center ">
                            <p className="text-gray-500">Already have an account? </p>
                            <li>
                                <a className="text-sky-600 pl-2" onClick={() => navigate("/login")}> Sign In</a>
                            </li>
                        </div>
                    </form>
                </div>
            </div>
        </Fragment>
    );
}

export default Registration;
