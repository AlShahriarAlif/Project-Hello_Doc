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
        try {
            const res = await fetch(`http://localhost:5000/OrederedAmb/${userID}`, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "request-type": "Pending_Order"
                },
            });
            const data = await res.json();
            setResults(data);
        } catch (err) {
            console.error(err.message);
            // Handle error, maybe set an error state to display a message to the user
        }
    };

    useEffect(() => {
        getData();
    }, [userID]); // Fetch data whenever userID changes

    const handleFinishOrder = async (result) => {
        // Implement logic for finishing order
        try {
            const res = await fetch('http://localhost:5000/Serve_Order', {
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
                // Update the status of the finished order in the results state
                setResults(prevResults => prevResults.map(item => {
                    if (item === result) {
                        return { ...item, Status: 'Served' };
                    }
                    return item;
                }));
                alert('Serve_Order is being processed successfully');
            } else {
                alert('Failed to process Serve_Order');
            }
        } catch (err) {
            console.error(err.message);
            // Handle error
        }
    };
    

    const handleServed = (result) => {
        // Implement logic for marking order as served
    };

    const filteredResults = results.filter(result =>
        (result.Name.toLowerCase().includes(searchQuery.toLowerCase()) ||
            result.Contact.includes(searchQuery)) &&
        (filterType === '' || (filterType === 'AC' && result.AC) || (filterType === 'MICU' && result.Is_MICU)) &&
        (!minPrice || parseFloat(result.Price_per_hour.slice(1)) >= parseFloat(minPrice)) &&
        (!maxPrice || parseFloat(result.Price_per_hour.slice(1)) <= parseFloat(maxPrice))
    );
    
    // Sort filteredResults so that items with 'Confirmed' status appear first
    filteredResults.sort((a, b) => {
        if (a.Status === 'Confirmed' && b.Status !== 'Confirmed') {
            return -1; // a should come before b
        } else if (a.Status !== 'Confirmed' && b.Status === 'Confirmed') {
            return 1; // b should come before a
        } else {
            return 0; // the order remains unchanged
        }
    });
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
                                {result.Status === 'Confirmed' && (
                                    <button onClick={() => handleFinishOrder(result)} className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mr-2">
                                        Finish Order
                                    </button>
                                )}
                                {result.Status === 'Served' && (
                                    <button onClick={() => handleServed(result)} className="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">
                                        Served
                                    </button>
                                )}
                               
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default Ambulance;
