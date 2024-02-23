import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext';
import { AmbulanceLogInContext } from './ambulancelogincotext';
let Order_Confirmed=false;
const Ambulance = () => {
    const { isLoggedIn, userID } = useContext(LoginContext);
    const { setAmbulanceID } = useContext(AmbulanceLogInContext);
    const [results, setResults] = useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [filterType, setFilterType] = useState('');
    const [minPrice, setMinPrice] = useState('');
    const [maxPrice, setMaxPrice] = useState('');
    const [modalIsOpen, setModalIsOpen] = useState(false);
    const [selectedUser, setSelectedUser] = useState(null);

    const getData = async () => {
        let ID = userID; // replace with your actual ID
        try {
            const res = await fetch(`http://localhost:5000/Pending_AmbOrder/${userID}`, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "request-type": "Pending_Order"
                },
            });
            console.log(userID);
            const data = await res.json();
            setResults(data);
            console.log(data);
        } catch (err) {
            console.error(err.message);
        }
    }
        useEffect(() => {
            getData();
        }, []);

    
        const filteredResults = results.filter(result =>
            (result.Name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                result.Contact.includes(searchQuery)) &&
            (filterType === '' || (filterType === 'AC' && result.AC) || (filterType === 'MICU' && result.Is_MICU)) &&
            (!minPrice || parseFloat(result.Price_per_hour.slice(1)) >= parseFloat(minPrice)) &&
            (!maxPrice || parseFloat(result.Price_per_hour.slice(1)) <= parseFloat(maxPrice))
        );

        const confirmOrder = async (result) => {
           if(Order_Confirmed)
           {
            alert('You Have Already Confirmed An Order.');
           }
           else
           {
            
            try{
                const res = await fetch(`http://localhost:5000/Confirm_Order`, {
                    method:'POST',
                    headers:
                    {
                        "Content-Type": "application/json",
                        
                    },
                    body: JSON.stringify({
                        amb_id:result["Ambulance id"],
                        user_id:result["Reg. Number"],
                    }),
                });
                const data =  await res.json();
                if(data.success===1)
                {
                    alert('Order Confirmed');
                    Order_Confirmed=true;
                }
                else
                {
                    alert('Probably Some error Occured we are trying to fix it');
                }
            }
            catch(err)
            {
                console.error(err.message);
            }
           }
        };
        

    
        return (
            <div className="text-gray-900 bg-gray-200">
              
                <div className="px-3 py-4 flex justify-center">
                    <h1 className="p-4 flex">Order Details:</h1>
                    <table className="w-full text-md bg-white shadow-md rounded mb-4">
                        <tbody><br/>
                            <tr className="border-b">
                                <th className="text-left p-3 px-5">Name</th>
                                <th className="text-left p-3 px-5">Contact</th>
                                <th className="text-left p-3 px-5">Location</th>
                                <th></th>
                            </tr>
                            {filteredResults.map((result, index) => (
                                <tr key={index} className="border-b hover:bg-orange-100">
                                    <td className="p-3 px-5">{result.Name}</td>
                                    <td className="p-3 px-5">{result.Email}</td>
                                    <td className="p-3 px-5">{result['Location']}</td>
                                      <td className="p-3 px-5">{result.License}</td>
                                    <td className="p-3 px-5">
                                        <button onClick={() => confirmOrder(result)}>Order Confirmation</button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
               
            </div>
        );
    }

    export default Ambulance;
