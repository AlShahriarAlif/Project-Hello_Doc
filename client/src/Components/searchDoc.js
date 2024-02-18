import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'; // Import Bootstrap CSS

const SearchComponent = () => {
  const [doctorName, setDoctorName] = useState('');
  const [speciality, setSpeciality] = useState('');
  const [hospital, setHospital] = useState('');
  const [results, setResults] = useState([]);

  const handleSearch = async () => {
    try {
      let response;

      // Perform OR operation to show results even when only one field is filled
      if (doctorName !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/doctor/${doctorName}`);
      } else if (speciality !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/speciality/${speciality}`);
      } else if (hospital !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/hospital/${hospital}`);
      } else {
        alert('Please enter values for at least one field before searching');
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

  return (
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
            </tr>
          </thead>
          <tbody>
            {results.map((result, index) => (
              <tr key={index}>
                <th scope="row">{result.doc_name}</th>
                <td>{result.email}</td>
                <td>{result.speciality}</td>
                <td>{result.location}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default SearchComponent;
