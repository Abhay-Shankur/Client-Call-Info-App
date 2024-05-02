// NotFound.js

import React from 'react';
import NotFoundImage from '../assests/404-image.jpg'; // Import the 404 image

function NotFound() {
  return (
    <center>
        <div className="not-found">
        <h1>404 - Page Not Found</h1>
        <img src={NotFoundImage} alt="Page Not Found" />
        </div>
    </center>
  );
}

export default NotFound;
