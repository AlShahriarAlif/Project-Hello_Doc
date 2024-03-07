import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext';
import { AmbulanceLogInContext } from './ambulancelogincotext';

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

    const confirmOrder = async (result) => {
        try {
            const res = await fetch('http://localhost:5000/Confirm_Order', {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    amb_id: result["Ambulance id"],
                    user_id: result["Reg. Number"],
                }),
            });
            const data = await res.json();
            console.log(result);
            if (data.success === 1) {
                alert('Order Confirmed');
                setResults([]); // Remove confirmed order from results
            } else if (data.success === 0) {
                alert('You Have Already Confirmed An Order.');
            } else {
                alert('Probably Some error Occurred we are trying to fix it');
            }
        } catch (err) {
            console.error(err.message);
        }
    };

    const cancelOrder = async (result) => {
        try {
            const res = await fetch('http://localhost:5000/Cancel_Order', {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    amb_id: result["Ambulance id"],
                    user_id: result["Reg. Number"],
                }),
            });
            const data = await res.json();
            if (data.success === 1) {
                alert('Order Canceled');
                setResults(results.filter(item => item !== result)); // Remove canceled order from results
            } else {
                alert('Probably Some error Occurred we are trying to fix it');
            }
        } catch (err) {
            console.error(err.message);
        }
    };

    const filteredResults = results.filter(result =>
        (result.Name.toLowerCase().includes(searchQuery.toLowerCase()) ||
            result.Contact.includes(searchQuery)) &&
        (filterType === '' || (filterType === 'AC' && result.AC) || (filterType === 'MICU' && result.Is_MICU)) &&
        (!minPrice || parseFloat(result.Price_per_hour.slice(1)) >= parseFloat(minPrice)) &&
        (!maxPrice || parseFloat(result.Price_per_hour.slice(1)) <= parseFloat(maxPrice))
    );

    return (
        <div className="text-gray-900 bg-gray-200">
        <div className="px-3 py-4 flex justify-center">
            <h1 className="p-4 flex">Order Details:</h1>
        </div>
        <table className="w-full text-md bg-blue-100 shadow-md rounded mb-4">
            <thead>
                <tr className="border-b">
                    <th className="text-left p-3 px-5">Name</th>
                    <th className="text-left p-3 px-5">Contact</th>
                    <th className="text-left p-3 px-5">Location</th>
                    <th className="text-left p-3 px-5">Order Confirmation</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {filteredResults.map((result, index) => (
                    <tr key={index} className="border-b hover:bg-blue-200">
                        <td className="p-3 px-5">{result.Name}</td>
                        <td className="p-3 px-5">{result.Email}</td>
                        <td className="p-3 px-5">{result['Location']}</td>
                        <td className="p-3 px-5">
                            <button onClick={() => confirmOrder(result)} className="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded mr-2">
                                √
                            </button>
                            <button onClick={() => cancelOrder(result)} className="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                                X
                            </button>
                        </td>
                    </tr>
                ))}
            </tbody>
        </table>
    </div>
    );
}

export default Ambulance;
