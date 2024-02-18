import React from 'react';
import { useLocation } from 'react-router-dom';

const ResultsPage = () => {
  const location = useLocation();
  const results = location.state.results; // This is your search results

  return (
    <div>
      {/* Render the search results */}
      {results.map((result, index) => (
        <div key={index}>
          {/* Replace 'name', 'speciality', and 'hospital' with the actual property names of your results */}
          <p>Name: {result.name}</p>
          <p>Speciality: {result.speciality}</p>
          <p>Hospital: {result.hospital}</p>
        </div>
      ))}
    </div>
  );
};

export default ResultsPage;
