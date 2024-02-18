import React, { useState } from 'react';

const SearchComponent = () => {
  const [doctorName, setDoctorName] = useState('');
  const [speciality, setSpeciality] = useState('');
  const [hospital, setHospital] = useState('');

  const handleSearch = async (type) => {
    let results;
    if (type === 'doctorName' && doctorName !== '') {
      results = await fetch(`http://localhost:5000/Hello_Doc/search/doctor/${doctorName}`);
    } else if (type === 'speciality' && speciality !== '') {
      results = await fetch(`http://localhost:5000/Hello_Doc/search/speciality/${speciality}`);
    } else if (type === 'hospital' && hospital !== '') {
      results = await fetch(`http://localhost:5000/Hello_Doc/search/hospital/${hospital}`);
    } else {
      alert('Please enter some data before searching');
    }
    const data = await results.json();
    console.log(data);
  };
  

  return (
    <div>
      <label>
        Search Doctor By Name:
        <input type="text" value={doctorName} onChange={(e) => setDoctorName(e.target.value)} />
        <button onClick={() => handleSearch('doctorName')}>Search</button>
      </label>
      <label>
        Search Doctor By Speciality:
        <input type="text" value={speciality} onChange={(e) => setSpeciality(e.target.value)} />
        <button onClick={() => handleSearch('speciality')}>Search</button>
      </label>
      <label>
        Search Hospital:
        <input type="text" value={hospital} onChange={(e) => setHospital(e.target.value)} />
        <button onClick={() => handleSearch('hospital')}>Search</button>
      </label>
    </div>
  );
};

export default SearchComponent;
