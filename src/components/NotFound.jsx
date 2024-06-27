// NotFound.js

import React from 'react';
import NotFoundImage from '../assests/404-image.jpg'; // Import the 404 image

function NotFound() {
  return (
    <div className="not-found container">
      <center>
        <h1>404 - Page Not Found</h1>
        <img src={NotFoundImage} alt="Page Not Found" />
      </center>
    </div>
  );
}

export default NotFound;
