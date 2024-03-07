import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext';
import { AmbulanceLogInContext } from './ambulancelogincotext';
import Modal from 'react-modal';
import "./Ambulance.css";
Modal.setAppElement('#root');

let ambulanceBooked = false;

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
    const [emergency, setEmergency] = useState('No'); // Added state for emergency option
    const [location, setLocation] = useState(null);

    useEffect(() => {
        getData();
    }, []);

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
    const handleEmergencyChange = (e) => {
        setEmergency(e.target.value);
    };
    const handleLocationChange = (e) => {
        setLocation(e.target.value);
    };

    const filteredResults = results.filter(result =>
        (result.Name.toLowerCase().includes(searchQuery.toLowerCase()) ||
            result.Contact.includes(searchQuery)) &&
        (filterType === '' || (filterType === 'AC' && result.AC) || (filterType === 'MICU' && result.Is_MICU)) &&
        (!minPrice || parseFloat(result.Price_per_hour.slice(1)) >= parseFloat(minPrice)) &&
        (!maxPrice || parseFloat(result.Price_per_hour.slice(1)) <= parseFloat(maxPrice))
    );

    const bookAmbulance = async (result) => {
        if (!isLoggedIn) {
            alert('You must log in first.');
            return;
        }
        if (ambulanceBooked) {
            alert('You can order at most one ambulance at a time.');
            return;
        }
        if (result.Availability) {

            try {
                const response = await fetch('http://localhost:5000/checkorder', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        user_id: userID,
                    }),
                });
                const data = await response.json();
                if (data.success === 1) {
                    alert('You have already booked an ambulance.');
                }
                else {
                    setModalIsOpen(true);
                    setSelectedUser(result);
                }
            }
            catch (err) {
                console.error(err);
                alert('Failed to book ambulance.');
            }
        }
        else {
            alert('Sorry, this ambulance is not available.');
        }
    };

    const confirmBooking = async () => {
        try {
            const response = await fetch('http://localhost:5000/bookambulance', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    user_id: userID,
                    ambulance_id: selectedUser.ID,
                    location: location, // Include the location field
                    emergency: emergency // Include the emergency field
                }),
            });
            const data = await response.json();
            if (data.success === 3) {
                alert('Ambulance request is pending. Please wait for the confirmation of the driver.');
                setModalIsOpen(false);
                ambulanceBooked = true;
                setAmbulanceID(selectedUser.ID);
            } else {
                alert('Maybe Some error occurred. Our team is working on it.');
            }
        } catch (err) {
            console.error(err);
            alert('Failed to book ambulance.');
        }
    };

    const closeModal = () => {
        setModalIsOpen(false);
    };

    return (
        
        <div class="gradient-bg" >
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
                    <tr className="border-b" style={{ backgroundColor: 'deepblue' }}>
                        <th className="text-left p-3 px-5">Name</th>
                        <th className="text-left p-3 px-5">Contact</th>
                        <th className="text-left p-3 px-5">Current Location</th>
                        <th className="text-left p-3 px-5">Price per hour</th>
                        <th className="text-left p-3 px-5">License</th>
                        <th></th>
                    </tr>
                    {filteredResults.map((result, index) => (
                        <tr key={index} className="border-b hover:bg-orange-100" style={{ backgroundColor: 'LavenderBlush' }}>
                            <td className="p-3 px-5">{result.Name}</td>
                            <td className="p-3 px-5">{result.Contact}</td>
                            <td className="p-3 px-5">{result['Current Location']}</td>
                            <td className="p-3 px-5">{result.Price_per_hour}</td>
                            <td className="p-3 px-5">{result.License}</td>
                            <td className="p-3 px-5"><button style={{ backgroundColor: 'green', width: '100px', borderRadius: '12px', color: 'white', fontWeight: 'bold', padding: '10px 20px' }} onClick={() => bookAmbulance(result)}>Book</button>

                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
        <Modal
            isOpen={modalIsOpen}
            onRequestClose={closeModal}
            contentLabel="Appointment Modal"
            style={{
                overlay: {
                    backgroundColor: 'rgba(0, 0, 0, 0.5)'
                },
                content: {
                    width: '500px',
                    height: '500px', /* Increased height to accommodate the additional field */
                    margin: 'auto',
                    padding: '20px',
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                    borderRadius: '10px',
                    boxShadow: '0px 0px 10px 2px rgba(0,0,0,0.1)',
                    overflowY: 'auto',
                    backgroundColor: '#8adbe2'
                }
                }}
            >
                <h2>Book Appointment</h2>
                <form
                    onSubmit={(e) => {
                        e.preventDefault();
                        confirmBooking();
                    }}
                    style={{ width: '100%', display: 'flex', flexDirection: 'column', alignItems: 'center' }}
                >
                    <label style={{ marginBottom: '10px', width: '100%' }}>
                        Price:
                        <input type="text" value={selectedUser?.Price_per_hour} readOnly style={{ width: '100%', marginTop: '5px' }} />
                    </label>
                    <label style={{ marginBottom: '10px', width: '100%' }}>
                        Order Purpose:
                        <select name="orderPurpose" style={{ width: '100%', marginTop: '5px' }}>
                            <option value="Meeting">Meeting</option>
                            <option value="Consultation">Consultation</option>
                            <option value="Service">Service</option>
                        </select>
                    </label>
                    <label style={{ marginBottom: '10px', width: '100%' }}>
                        Emergency:
                        <select name="emergency" value={emergency} onChange={handleEmergencyChange} style={{ width: '100%', marginTop: '5px' }}>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </label>
                    <label style={{ marginBottom: '10px', width: '100%' }}>
                        Location:
                        <input type="text" name="location" value={location} onChange={handleLocationChange} style={{ width: '100%', marginTop: '5px' }} />
                    </label>
                    <button type="submit" style={{ alignSelf: 'center', backgroundColor: '#3498db', color: 'white', padding: '10px 20px', borderRadius: '5px', border: 'none', cursor: 'pointer' }}>Submit</button>
                </form>
                <button onClick={closeModal} style={{ alignSelf: 'flex-end', backgroundColor: 'transparent', border: 'none', cursor: 'pointer', color: '#c0392b' }}>Close</button>
            </Modal>

        </div>
    );
}

export default Ambulance;
