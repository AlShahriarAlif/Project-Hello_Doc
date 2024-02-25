import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext';

let ambulanceBooked = false;

const Hospital = () => {
    const { isLoggedIn } = useContext(LoginContext);
    const [ambulanceResults, setAmbulanceResults] = useState([]);
    const [doctorResults, setDoctorResults] = useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [filterType, setFilterType] = useState('');
    const [minPrice, setMinPrice] = useState('');
    const [maxPrice, setMaxPrice] = useState('');

    const getAmbulanceData = async () => {
        try {
            const res = await fetch("http://localhost:5000/Hospital_Home", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "request-type": "all_ambulance"
                },
            });
            const data = await res.json();
            setAmbulanceResults(data);
        } catch (err) {
            console.error(err.message);
        }
    }

    const getDoctorData = async () => {
        try {
            const res = await fetch("http://localhost:5000/Hospital_Doctors", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer YOUR_ACCESS_TOKEN"
                },
            });
            const data = await res.json();
            setDoctorResults(data);
        } catch (err) {
            console.error(err.message);
        }
    }

    useEffect(() => {
        getAmbulanceData();
        getDoctorData();
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

    const filteredAmbulanceResults = ambulanceResults.filter(result =>
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

    // Render Doctor table
    const renderDoctorTable = () => {
        return (
            <table className="w-full text-md bg-white shadow-md rounded mb-4">
                <tbody>
                    <tr className="border-b">
                        <th className="text-left p-3 px-5">Doctor Name</th>
                        <th className="text-left p-3 px-5">Specialization</th>
                    </tr>
                    {doctorResults.map((doctor, index) => (
                        <tr key={index} className="border-b hover:bg-orange-100">
                            <td className="p-3 px-5">{doctor.name}</td>
                            <td className="p-3 px-5">{doctor.specialization}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        );
    }

    return (
        <div className="text-gray-900 bg-gray-200">
            {/* Ambulance Section */}
            <div className="p-4 flex">
                <input
                    type="text"
                    placeholder="Search by name or contact"
                    value={searchQuery}
                    onChange={handleSearch}
                    className="mr-4 px-3 py-1 border rounded"
                />
                <button className="mr-4 p-2 bg-blue-500 text-white rounded">Add Ambulance</button>
                <h1 className="text-3xl">Ambulance</h1>
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
                        {filteredAmbulanceResults.map((result, index) => (
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
            {/* Doctor Section */}
            <div className="p-4 flex">
                <input
                    type="text"
                    placeholder="Search by name or contact"
                    value={searchQuery}
                    onChange={handleSearch}
                    className="mr-4 px-3 py-1 border rounded"
                />
                <button className="mr-4 p-2 bg-blue-500 text-white rounded">Add Doctor</button>
                <h1 className="text-3xl">Doctors</h1>
            </div>
            <div className="px-3 py-4 flex justify-center">
                {/* Render doctor table */}
                {renderDoctorTable()}
            </div>
        </div>
    );
    
                        }    
export default Hospital;
