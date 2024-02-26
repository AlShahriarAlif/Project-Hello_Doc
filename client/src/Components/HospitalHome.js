import React, { useState, useEffect, useContext } from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate
import { LoginContext } from './logincontext';
import { AmbulanceLogInContext } from './ambulancelogincotext';
import Modal from 'react-modal';

Modal.setAppElement('#root');

const HospitalHome = () => {
    const { isLoggedIn, userID } = useContext(LoginContext);
    const { setAmbulanceID } = useContext(AmbulanceLogInContext);
    const [results, setResults] = useState([]);
    const [locationSearchQuery, setLocationSearchQuery] = useState('');
    const [nameSearchQuery, setNameSearchQuery] = useState('');
    const [modalIsOpen, setModalIsOpen] = useState(false);
    const [selectedUser, setSelectedUser] = useState(null);
    const navigate = useNavigate(); // Initialize useNavigate

    const getData = async () => {
        try {
            const res = await fetch("http://localhost:5000/AllHospital", {
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

    const handleLocationSearch = (e) => {
        setLocationSearchQuery(e.target.value);
    }

    const handleNameSearch = (e) => {
        setNameSearchQuery(e.target.value);
    }

    const filteredResults = results.filter(result =>
        result.Location.toLowerCase().includes(locationSearchQuery.toLowerCase()) &&
        result.hos_name.toLowerCase().includes(nameSearchQuery.toLowerCase())
    );

    const handleViewDetails = (result) => {
        // Implement your logic to view details
        console.log("in handle");
        console.log(result);
        // Navigate to a new page using navigate function
        navigate(`/hospital/details/${result.hos_id}`); // Assuming 'hos_id' is the correct property
    };

    return (
        <div className="text-gray-900 bg-blue-200">
            <div className="p-4 flex">
                <h1 className="text-3xl">Hospitals</h1>
                <input
                    type="text"
                    placeholder="Search by Location"
                    value={locationSearchQuery}
                    onChange={handleLocationSearch}
                    className="ml-4 px-3 py-1 border rounded"
                />
                <input
                    type="text"
                    placeholder="Search by Name"
                    value={nameSearchQuery}
                    onChange={handleNameSearch}
                    className="ml-4 px-3 py-1 border rounded"
                />
            </div>
            <div className="px-3 py-4 flex justify-center">
                <table className="w-full text-md bg-gray-100 shadow-md rounded mb-4">
                    <tbody>
                        <tr className="border-b">
                            <th className="text-left p-3 px-5">Hospital Name</th>
                            <th className="text-left p-3 px-5">Email</th>
                            <th className="text-left p-3 px-5">Location</th>
                            <th className="text-left p-3 px-5">Rating</th>
                            <th></th>
                        </tr>
                        {filteredResults.map((result, index) => (
                            <tr key={index} className="border-b hover:bg-orange-100">
                                <td className="p-3 px-5">{result.hos_name}</td>
                                <td className="p-3 px-5">{result.email}</td>
                                <td className="p-3 px-5">{result.Location}</td>
                                <td className="p-3 px-5">{result.Rating}</td> {/* Assuming 'rating' is a property in 'result' */}
                                <td className="p-3 px-5">
                                    <button
                                        onClick={() => handleViewDetails(result)}
                                        style={{
                                            backgroundColor: "#FFA500",
                                            borderRadius: "8px",
                                            padding: "8px 16px",
                                            color: "white",
                                            border: "none",
                                            cursor: "pointer",
                                        }}
                                    >
                                        View Details
                                    </button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default HospitalHome;
