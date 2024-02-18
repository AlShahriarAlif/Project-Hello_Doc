// Create a new file, e.g., RegistrationForm.js
import React, { useState } from 'react';

const RegistrationForm = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [repeatPassword, setRepeatPassword] = useState('');
  const [agreeTerms, setAgreeTerms] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();

    // Add your form submission logic here
    // You can access email, password, repeatPassword, and agreeTerms state values
    // Validate password and repeatPassword here

    if (password !== repeatPassword) {
      alert('Password and Repeat Password must be the same!');
      return;
    }

    // Continue with form submission logic
    console.log('Form submitted:', { email, password, repeatPassword, agreeTerms });
  };

  return (
    <div className="form-container">
      <form onSubmit={handleSubmit}>
        {/* Your form fields and labels go here */}
        <label htmlFor="email">Your email</label>
        <input type="email" id="email" value={email} onChange={(e) => setEmail(e.target.value)} required />

        <label htmlFor="password">Your password</label>
        <input type="password" id="password" value={password} onChange={(e) => setPassword(e.target.value)} required />

        <label htmlFor="repeat-password">Repeat password</label>
        <input
          type="password"
          id="repeat-password"
          value={repeatPassword}
          onChange={(e) => setRepeatPassword(e.target.value)}
          required
        />

        <div className="flex items-start mb-5">
          <input
            id="terms"
            type="checkbox"
            checked={agreeTerms}
            onChange={(e) => setAgreeTerms(e.target.checked)}
            required
          />
          <label htmlFor="terms" className="ms-2 text-sm font-medium">
            I agree with the <a href="#" className="text-blue-600 hover:underline">terms and conditions</a>
          </label>
        </div>

        <button type="submit">Register new account</button>
      </form>
    </div>
  );
};

export default RegistrationForm;
