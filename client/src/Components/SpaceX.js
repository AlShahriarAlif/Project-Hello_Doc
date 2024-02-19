// App.js
import React from 'react';
import './SpaceX.css';

const  X= () => {
  return (
    <div className="container">
      <header className="header">
        <nav>
          <ul>
            {['DOCTOR', 'AMBULANCE', 'HEALTH-MARKET', 'SABAHAMBIC', 'FREEMI PILATER'].map(item => (
              <li key={item}>{item}</li>
            ))}
          </ul>
        </nav>
      </header>

      <main className="main-content">
        <section className="service-info">
          <h2>Helly mor moyerinng ambuannn service!</h2>
          <p>Lorem you mipa in boni hahola, freg coro ralitote or laniy hanapiel,</p>
          <button>CONTACT NOW</button>
        </section>

        {/* Add background image with the doctor and patient */}
      </main>
    </div>
  );
}

export default X;
