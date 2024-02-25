import React, { useState, useEffect, useContext } from 'react';
import { LoginContext } from './logincontext';
import { AmbulanceLogInContext } from './ambulancelogincotext';
import Modal from 'react-modal';

// Make sure to bind modal to your appElement
//Modal.setAppElement('#yourAppElement')
// Make sure to bind modal to your appElement
Modal.setAppElement('#root')

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
            ambulanceBooked = true; // Set ambulanceBooked to true after booking
            setAmbulanceID(result.ID);
            setSelectedUser(result);
            setModalIsOpen(true);
            try {
                const response = await fetch('http://localhost:5000/bookambulance', {


                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        user_id: userID,
                        ambulance_id: result.ID,

                    }),
                });
                const data = await response.json();
                if (data.success === 3) {
                    alert('Ambulance request is pending.Please wait for the confirmation of driver.');

                }
                // else if(data.success===1)
                // {
                //     alert('Ambulance is not present available');
                // }
                else if (data.success === 1) {
                    alert('You have already booked an ambulance . ');
                }
                else {
                    alert('Maybe Some error occured our team is working on it');
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

    const closeModal = () => {
        setModalIsOpen(false);
        ambulanceBooked = false; // Reset ambulanceBooked to false when modal is closed
    };

    return (
        <div className="text-gray-900 bg-gray-200">
            {/* ...rest of your code... */}
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
            <Modal
    isOpen={modalIsOpen}
    onRequestClose={closeModal}
    contentLabel="Appointment Modal"
    style={{
        content: {
            width: '300px',
            height: '200px',
            margin: 'auto',
            padding: '20px',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'space-between',
            alignItems: 'center',
            borderRadius: '10px',
            boxShadow: '0px 0px 10px 2px rgba(0,0,0,0.1)',
            overflowY: 'auto' // Added to make all content scrollable
        }
    }}
>
    <h2>Book Appointment</h2>
    <form style={{ width: '100%', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <label style={{ marginBottom: '10px', width: '100%' }}> {/* Added width to align the label */}
            Date:
            <input type="date" name="appointmentDate" style={{ width: '100%', marginTop: '5px' }} />
        </label>
        <label style={{ marginBottom: '10px', width: '100%' }}> {/* Added width to align the label */}
            Price:
            <input type="text" value={selectedUser?.Price_per_hour} readOnly style={{ width: '100%', marginTop: '5px' }} />
        </label>
        <button type="submit" style={{ alignSelf: 'center', backgroundColor: '#3498db', color: 'white', padding: '10px 20px', borderRadius: '5px', border: 'none', cursor: 'pointer' }}>Submit</button> {/* Blue submit button */}
    </form>
    <button onClick={closeModal} style={{ alignSelf: 'flex-end', backgroundColor: 'transparent', border: 'none', cursor: 'pointer', color: '#c0392b' }}>Close</button> {/* Red close button */}
</Modal>


        </div>
    );
}

export default Ambulance;
