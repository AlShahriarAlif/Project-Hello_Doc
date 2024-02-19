import React, { Fragment, useEffect, useState } from 'react';
import { Link, useNavigate } from "react-router-dom"; 


const Resigtration = () => {
    // const [inputs, setInputs] = useState({
    //     firstName:"",
    //     contact:"",
    //     password:"",
    // });
    // const {firstName,contact, password} = inputs;
    // const onChange = (e) => {
    //     setInputs({...inputs, [e.target.name]:e.target.value});
    // };

    // const onSubmitForm = async(e) =>{
    //     e.preventDefault();
    //     const hello = {firstName, contact, password} ;
    //     console.log(hello);
    //     const res = await fetch("http://localhost:5000/Registration",{
    //         method : "POST",
    //         headers:{"Content-Type" : "application/json",
    //         "type" : ("Normal User")
    //     },
    //         body:JSON.stringify(hello),
            
    //     })
    //     if(res.status == 200)
    //         console.log("OK")
    //     else console.log("Not OK")
    // }
    const navigate = useNavigate();
    return (
        <Fragment>
            <div class="w-full h-auto overflow-scroll block h-screen bg-gradient-to-r from-blue-100 via-purple-100 to-pink-100 p-4 flex items-center justify-center" >
    <div class="bg-white py-6 px-10 sm:max-w-md w-full ">
        <div class="sm:text-3xl text-2xl font-semibold text-center text-sky-600  mb-12">
            Registration Form 
        </div>
        <div class="">
            <div>
                 <input type="text" class="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500"  placeholder="Name "/>
            </div>
             <div>
                 <input type="email" class="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500 my-8"  placeholder="Eamil Adress "/>
            </div>
             <div>
            {/* <input type="text" class="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500 mb-8"  placeholder="Country "/> */}
            </div>
             <div>
            <input type="phone" class="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500 mb-8"  placeholder="Phone "/>
            </div>
            <div class="">
                <input type="password" class="focus:outline-none border-b w-full pb-2 border-sky-400 placeholder-gray-500 mb-8"  placeholder="Password " />
            </div>
            <div class="flex">
                <input type="checkbox" class="border-sky-400 " value="" />
                <div class="px-3 text-gray-500">
                    I accept terms & conditions 
                </div>
            </div>
            <div class="flex justify-center my-6">
                <button class=" rounded-full  p-3 w-full sm:w-56   bg-gradient-to-r from-sky-600  to-teal-300 text-white text-lg font-semibold " >
                    Create Account
                </button>
            </div>
            <div class="flex justify-center ">
                <p class="text-gray-500">Already have an acount? </p>
               <li>
                <a  class="text-sky-600 pl-2" onClick={() => navigate("/login")}> Sign In</a>
                </li>
            </div>
        </div>
    </div>
</div>
        </Fragment>
    );
}

export default Resigtration;