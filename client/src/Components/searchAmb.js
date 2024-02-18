import React, { useState } from 'react';
import './styeleForAmb.css';

const Searchamb = () => {
  const [hospitalName, setHospitalName] = useState('');
  const [price, setPrice] = useState('');
  const [checked, setChecked] = useState([]);
  const [results, setResults] = useState([]);

  const isChecked = (item) => checked.includes(item);

  const checklist1 = ["AC", "MICU"];
  const checklist2 = ["Available Right Now"];

  const handleCheck = (item) => {
    if (isChecked(item)) {
      setChecked(checked.filter((i) => i !== item));
    } else {
      setChecked([...checked, item]);
    }
  };

  const handleHospital = async () => {
    if (hospitalName !== '') {
      const response = await fetch(`http://localhost:5000/Hello_Doc/search/hospital_for_ambulance/${hospitalName}`);
      const data = await response.json();
      setResults(data);
    }
  };

  const handlePrice = async () => {
    if (price !== '') {
      const response = await fetch(`http://localhost:5000/Hello_Doc/search/price/${price}`);
      const data = await response.json();
      setResults(data);
    }
  };

  const handleSearch = async () => {
    if (checked.length === 0 && hospitalName === '' && price === '') {
      alert('Please select at least one field');
      return;
    }

    let response;

    if (checked.length > 0) {
      const filteredResults = await Promise.all(
        checked.map(async (item) => {
          switch (item) {
            case 'AC':
              return await fetch(`http://localhost:5000/Hello_Doc/search/ac`);
            case 'MICU':
              return await fetch(`http://localhost:5000/Hello_Doc/search/micu`);
            case 'Available Right Now':
              return await fetch(`http://localhost:5000/Hello_Doc/search/avail`);
            default:
              return null;
          }
        })
      );

      let mergedData = [];
      for (let i = 0; i < filteredResults.length; i++) {
        const data = await filteredResults[i].json();
        mergedData = i === 0 ? data : mergedData.filter((item) => data.some((d) => d.Contact === item.Contact));
      }

      setResults(mergedData);
    } else {
      if (hospitalName !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/hospital_for_ambulance/${hospitalName}`);
      }
      if (price !== '') {
        response = await fetch(`http://localhost:5000/Hello_Doc/search/price/${price}`);
      }

      const data = await response.json();
      setResults(data);
    }
  };

  return (
    <div className="hospital">
      <label>
        Name the hospital:
        <input type="text" value={hospitalName} onChange={(e) => setHospitalName(e.target.value)} onBlur={handleHospital} />
      </label>
      <label>
        Price:
        <input type="text" value={price} onChange={(e) => setPrice(e.target.value)} onBlur={handlePrice} />
      </label>
      <div className="checklist1">
        <div className="title">Additional Features You want</div>
        <div className="list-container">
          {checklist1.map((item, index) => (
            <div key={index}>
              <input
                value={item}
                type="checkbox"
                onChange={() => handleCheck(item)}
                checked={isChecked(item)}
              />
              <span className={isChecked(item) ? "checked-item" : "not-checked-item"}>{item}</span>
            </div>
          ))}
        </div>
        <div className="checklist2">
          <div className="title">Availability</div>
          <div className="list-container">
            {checklist2.map((item, index) => (
              <div key={index}>
                <input
                  value={item}
                  type="checkbox"
                  onChange={() => handleCheck(item)}
                  checked={isChecked(item)}
                />
                <span className={isChecked(item) ? "checked-item" : "not-checked-item"}>{item}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
      <div>
        <button onClick={handleSearch}>
          Search
        </button>
      </div>
      <div>
        <table className="table table-dark">
          <thead>
            <tr>
              <th scope="col">Contact</th>
              <th scope="col">AC</th>
              <th scope="col">Is_MICU</th>
              <th scope="col">Price_per_hour</th>
              <th scope="col">Availability</th>
            </tr>
          </thead>
          <tbody>
            {results.map((result, index) => (
              <tr key={index}>
                <th scope="row">{result.Contact}</th>
                <td>{result.AC ? "Yes" : "No"}</td>
                <td>{result.Is_MICU ? "Yes" : "No"}</td>
                <td>{result.Price_per_hour.toLocaleString('en-US', { style: 'currency', currency: 'USD' })}</td>
                <td>{result.Availability ? "Yes" : "No"}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Searchamb;
