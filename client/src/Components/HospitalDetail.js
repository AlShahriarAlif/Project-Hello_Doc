import React, { useState, useEffect, useContext } from 'react';
import { useParams } from 'react-router-dom';
import { LoginContext } from './logincontext';
import { AmbulanceLogInContext } from './ambulancelogincotext';
import Modal from 'react-modal';

Modal.setAppElement('#root');

const HospitalDetail = () => {
    const url = window.location.href; // Get the current URL
    const hosId = url.split('/').pop(); // Extract the last segment (hos_id)

    const { isLoggedIn, userID } = useContext(LoginContext);
    const { setAmbulanceID } = useContext(AmbulanceLogInContext);
    const [hospitalName, setHospitalName] = useState('');
    const [ambulances, setAmbulances] = useState([]);
    const [doctors, setDoctors] = useState([]);
    const [activeMenu, setActiveMenu] = useState('Home'); // Initialize active menu as Home

    const fetchHospitalName = async (hospitalID) => {
        try {
            const response = await fetch(`http://localhost:5000/HosName/${hospitalID}`);
            const data = await response.json();
            if (data.length > 0) {
                setHospitalName(data[0].hos_name);
            }
        } catch (error) {
            console.error(error.message);
        }
    };

    useEffect(() => {
        fetchHospitalName(hosId);
    }, [hosId]);

    const getAmbulances = async () => {
        try {
            const res = await fetch(`http://localhost:5000/AmbulanceUnderHos/${hosId}`);
            const data = await res.json();
            setAmbulances(data);
        } catch (err) {
            console.error(err.message);
        }
    };

    const getDoctors = async () => {
        try {
            const res = await fetch(`http://localhost:5000/DoctorUnderHos/${hosId}`);
            const data = await res.json();
            setDoctors(data);
        } catch (err) {
            console.error(err.message);
        }
    };

    const handleMenuClick = (menu) => {
        setActiveMenu(menu);
        if (menu === 'Doctors') {
            getDoctors();
        } else if (menu === 'Ambulance') {
            getAmbulances();
        }
    };

    const bookAmbulance = async (ambulanceID) => {
        // Placeholder for booking ambulance logic
        console.log(`Booking ambulance ${ambulanceID}`);
    };

    return (
        <div className="text-gray-900 bg-white">
            <h1 className="hospital-name text-4xl font-bold mt-8 text-center">{hospitalName}</h1>

            <div className="menu-bar flex justify-center mt-4">
                <button className={activeMenu === 'Doctors' ? 'active mr-4' : 'mr-4'} onClick={() => handleMenuClick('Doctors')}>Doctors</button>
                <button className={activeMenu === 'Ambulance' ? 'active mr-4' : 'mr-4'} onClick={() => handleMenuClick('Ambulance')}>Ambulance</button>
                <button className={activeMenu === 'Home' ? 'active' : ''} onClick={() => handleMenuClick('Home')}>Home</button>
            </div>

            {activeMenu === 'Doctors' && (
                <div className="doctor-table-container flex justify-center mt-8"> {/* Adjusted margin top */}
                    <table className="doctor-table w-3/4">
                        <thead>
                            <tr>
                                <th className="w-1/4">Name</th>
                                <th className="w-1/4">Speciality</th>
                                <th className="w-1/4">Email</th>
                                <th className="w-1/4">Location</th>
                            </tr>
                        </thead>
                        <tbody>
                            {doctors.map((doctor) => (
                                <tr key={doctor.id}>
                                    <td className="w-1/4">{doctor.doc_name}</td>
                                    <td className="w-1/4">{doctor.speciality}</td>
                                    <td className="w-1/4">{doctor.email}</td>
                                    <td className="w-1/4">{doctor.location}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}

            {activeMenu === 'Ambulance' && (
                <div className="ambulance-table-container flex justify-center mt-8"> {/* Adjusted margin top */}
                    <table className="ambulance-table w-3/4">
                        <thead>
                            <tr>
                                <th className="w-1/4">Name</th>
                                <th className="w-1/4">Contact Number</th>
                                <th className="w-1/4">License</th>
                                <th className="w-1/4">Order?</th>
                            </tr>
                        </thead>
                        <tbody>
                            {ambulances.map((ambulance) => (
                                <tr key={ambulance.Id}>
                                    <td className="w-1/4">{ambulance.Name}</td>
                                    <td className="w-1/4">{ambulance.Contact}</td>
                                    <td className="w-1/4">{ambulance.License}</td>
                                    <td className="w-1/4">
                                        <button onClick={() => bookAmbulance(ambulance.Id)}>Book</button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}

            {activeMenu === 'Home' && (
                <div className="home-content text-center mt-8"> {/* Adjusted margin top */}
                    <h2>Welcome to {hospitalName}</h2>
                    <p>This is some dummy content for the Home page.</p>
                </div>
            )}

        </div>
    );
};

export default HospitalDetail;
