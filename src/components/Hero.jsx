// Hero.jsx
import React from 'react';

function Hero() {
  return (
    <div className="hero">
      {/* Hero content */}
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-5">
            <div className="intro-excerpt">
              <h1><span clsas="d-block">Your Business Name</span></h1>
              <p className="mb-4">Your Business description here in 1-2 Lines only</p>
              <p><a href="/#" className="btn btn-secondary me-2">Explore Now</a></p>
            </div>
          </div>
          <div className="col-lg-7">
            <div className="hero-img-wrap">
              <img src="images/couch.png" alt='Couch'className="img-fluid"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Hero;
