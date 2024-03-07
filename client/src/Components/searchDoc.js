import React, { useState, useEffect, useContext } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'; // Import Bootstrap CSS
import { LoginContext } from './logincontext';
import Modal from 'react-modal';

Modal.setAppElement('#root');

const SearchComponent = () => {
  const [doctorName, setDoctorName] = useState('');
  const [speciality, setSpeciality] = useState('');
  const [hospital, setHospital] = useState('');
  const [results, setResults] = useState([]);
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [selectedDoctor, setSelectedDoctor] = useState(null);
  const [appointmentDate, setAppointmentDate] = useState('');
  const [appointmentTime, setAppointmentTime] = useState('');
  const [problem, setProblem] = useState('');
  const { isLoggedIn, userID } = useContext(LoginContext); // Assuming you have a LoginContext

  useEffect(() => {
    fetchAllDoctors();
  }, []);

  useEffect(() => {
    handleSearch();
  }, [doctorName, speciality, hospital]);

  const fetchAllDoctors = async () => {
    try {
      const response = await fetch('http://localhost:5000/Hello_Doc/search/Alldoctor');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json();
      setResults(data);
    } catch (error) {
      console.error('Error during fetch:', error);
    }
  };

  const handleSearch = async () => {
    try {
      let response;

      if (doctorName !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/doctor/${doctorName}`);
      } else if (speciality !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/speciality/${speciality}`);
      } else if (hospital !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/hospital/${hospital}`);
      } else {
        fetchAllDoctors();
        return;
      }

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const data = await response.json();
      setResults(data);
    } catch (error) {
      console.error('Error during fetch:', error);
    }
  };

  const confirmAppointment = async () => {
    try {
      // Check if user is logged in
      if (!isLoggedIn) {
        alert('Please log in to confirm the appointment.');
        return;
      }

      // Check if appointmentDate and appointmentTime are selected
      if (!appointmentDate || !appointmentTime) {
        alert('Please select both date and time for the appointment.');
        return;
      }

      // Prepare data for the request
      const requestData = {
        user_id: userID,
        doctor_id: selectedDoctor.id, // Assuming selectedDoctor has an id property
        appointmentDate: appointmentDate,
        appointmentTime: appointmentTime,
        problem: problem // Include problem in the request data
      };

      // Send a POST request to confirm the appointment
      const response = await fetch('http://localhost:5000/bookappointment', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestData)
      });

      // Check if the request was successful
      if (response.ok) {
        const data = await response.json();
        console.log('Appointment confirmed:', data);
        // Optionally, you can display a success message or perform any other action
      } else {
        // Handle error
        console.error('Error confirming appointment:', response.statusText);
        // Optionally, you can display an error message to the user
      }
    } catch (error) {
      console.error('Error confirming appointment:', error);
      // Optionally, you can display an error message to the user
    } finally {
      // Close the modal regardless of the result
      setModalIsOpen(false);
    }
  };

  const handleAppointment = (result) => {
    setSelectedDoctor(result);
    setModalIsOpen(true);
  };

  return (
    <div style={{ backgroundColor: '#F5FFFA' }} className="text-gray-900">
      <div className="container mt-5">
        <h2 className="mb-4">Doctor Search</h2>
        <div className="row">
          <div className="col-md-4">
            <div className="mb-3">
              <label htmlFor="doctorName" className="form-label">Doctor Name:</label>
              <input type="text" className="form-control" id="doctorName" value={doctorName} onChange={(e) => setDoctorName(e.target.value)} />
            </div>
          </div>
          <div className="col-md-4">
            <div className="mb-3">
              <label htmlFor="speciality" className="form-label">Speciality:</label>
              <input type="text" className="form-control" id="speciality" value={speciality} onChange={(e) => setSpeciality(e.target.value)} />
            </div>
          </div>
          <div className="col-md-4">
            <div className="mb-3">
              <label htmlFor="hospital" className="form-label">Hospital:</label>
              <input type="text" className="form-control" id="hospital" value={hospital} onChange={(e) => setHospital(e.target.value)} />
            </div>
          </div>
        </div>
        <div className="mb-3">
          <button type="button" className="btn btn-primary" onClick={handleSearch}>Search</button>
        </div>
        <div>
          <table className="table table-dark">
            <thead>
              <tr>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Speciality</th>
                <th scope="col">Location</th>
                <th scope="col">Fix an Appointment</th>
              </tr>
            </thead>
            <tbody>
              {results.map((result, index) => (
                <tr key={index}>
                  <th scope="row">{result.doc_name}</th>
                  <td>{result.email}</td>
                  <td>{result.speciality}</td>
                  <td>{result.location}</td>
                  <td>
                    <button type="button" className="btn btn-success" onClick={() => handleAppointment(result)}>Appoint</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
      {/* Appointment Modal */}
      <Modal
        isOpen={modalIsOpen}
        onRequestClose={() => setModalIsOpen(false)}
        style={{
          overlay: {
            backgroundColor: 'rgba(0, 0, 0, 0.5)'
          },
          content: {
            height: '350px',
            width: '400px',
            margin: 'auto',
            borderRadius: '10px',
            boxShadow: '0px 0px 10px 2px rgba(0,0,0,0.1)',
            overflowY: 'auto',
            backgroundColor: '#87CEEB',
            padding: '20px'
          }
        }}
      >
        <div className="modal-header">
          <h5 className="modal-title col-12 text-center">Book Appointment</h5>
          <button type="button" className="btn-close" onClick={() => setModalIsOpen(false)}></button>
        </div>
        <div className="modal-body">
          <form onSubmit={confirmAppointment}>
            <div className="mb-3">
              <label htmlFor="appointmentDate" className="form-label">Date:</label>
              <input type="date" className="form-control" id="appointmentDate" value={appointmentDate} onChange={(e) => setAppointmentDate(e.target.value)} />
            </div>
            <div className="mb-3">
              <label htmlFor="appointmentTime" className="form-label">Time:</label>
              <input type="time" className="form-control" id="appointmentTime" value={appointmentTime} onChange={(e) => setAppointmentTime(e.target.value)} />
            </div>
            <div className="mb-3">
              <label htmlFor="problem" className="form-label">Problem:</label>
              <input type="text" className="form-control" id="problem" value={problem} onChange={(e) => setProblem(e.target.value)} />
            </div>
            <div className="text-end">
              <button type="submit" className="btn btn-primary">Confirm Appointment</button>
            </div>
          </form>
        </div>
      </Modal>
    </div>
  );
};

export default SearchComponent;
