import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext'; 
let ambulanceBooked = false;
const Ambulance = () => {
    const { isLoggedIn } = useContext(LoginContext); 
    const [results, setResults] = useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [filterType, setFilterType] = useState('');
    const [minPrice, setMinPrice] = useState('');
    const [maxPrice, setMaxPrice] = useState('');

    const getData = async () => {
        try {
            const res = await fetch("http://localhost:5000/Ambulance_Home", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "request-type": "all_ambulance"
                },
            });
            const data = await res.json();
            setResults(data);
        } catch (err) {
            console.error(err.message);
        }
    }

    useEffect(() => {
        getData();
    }, []);

    const handleSearch = (e) => {
        setSearchQuery(e.target.value);
    }

    const handleFilterTypeChange = (e) => {
        setFilterType(e.target.value);
    }

    const handleMinPriceChange = (e) => {
        setMinPrice(e.target.value);
    }

    const handleMaxPriceChange = (e) => {
        setMaxPrice(e.target.value);
    }

    const filteredResults = results.filter(result =>
        (result.Name.toLowerCase().includes(searchQuery.toLowerCase()) ||
            result.Contact.includes(searchQuery)) &&
        (filterType === '' || (filterType === 'AC' && result.AC) || (filterType === 'MICU' && result.Is_MICU)) &&
        (!minPrice || parseFloat(result.Price_per_hour.slice(1)) >= parseFloat(minPrice)) &&
        (!maxPrice || parseFloat(result.Price_per_hour.slice(1)) <= parseFloat(maxPrice))
    );

    const bookAmbulance = (result) => {
        if (!isLoggedIn) {
            alert('You must log in first.');
            return;
        }
        if (ambulanceBooked) {
            alert('You can order at most one ambulance at a time.');
            return;
        }
        if (result.Availability) {
            ambulanceBooked = true; // Set ambulanceBooked to true after booking
            alert('Ambulance booked successfully!');
        } else {
            alert('Sorry, this ambulance is not available.');
        }
    }
    

    return (
        <div className="text-gray-900 bg-gray-200">
            <div className="p-4 flex">
                <h1 className="text-3xl">Users</h1>
                <input
                    type="text"
                    placeholder="Search by name or contact"
                    value={searchQuery}
                    onChange={handleSearch}
                    className="ml-4 px-3 py-1 border rounded"
                />
                <select
                    value={filterType}
                    onChange={handleFilterTypeChange}
                    className="ml-4 px-3 py-1 border rounded"
                >
                    <option value="">All</option>
                    <option value="AC">AC</option>
                    <option value="MICU">MICU</option>
                </select>
                <input
                    type="number"
                    placeholder="Min Price"
                    value={minPrice}
                    onChange={handleMinPriceChange}
                    className="ml-4 px-3 py-1 border rounded"
                />
                <input
                    type="number"
                    placeholder="Max Price"
                    value={maxPrice}
                    onChange={handleMaxPriceChange}
                    className="ml-4 px-3 py-1 border rounded"
                />
            </div>
            <div className="px-3 py-4 flex justify-center">
                <table className="w-full text-md bg-white shadow-md rounded mb-4">
                    <tbody>
                        <tr className="border-b">
                            
                            <th className="text-left p-3 px-5">Name</th>
                            <th className="text-left p-3 px-5">Contact</th>
                            
                            <th className="text-left p-3 px-5">Current Location</th>
                            <th className="text-left p-3 px-5">Price per hour</th>
                            <th className="text-left p-3 px-5">License</th>
                            <th></th>
                        </tr>
                        {filteredResults.map((result, index) => (
                            <tr key={index} className="border-b hover:bg-orange-100">

                                <td className="p-3 px-5">{result.Name}</td>
                                <td className="p-3 px-5">{result.Contact}</td>

                                <td className="p-3 px-5">{result['Current Location']}</td>
                                <td className="p-3 px-5">{result.Price_per_hour}</td>
                                <td className="p-3 px-5">{result.License}</td>
                                <td className="p-3 px-5">
                                    <button onClick={() => bookAmbulance(result)}>Book</button>
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
