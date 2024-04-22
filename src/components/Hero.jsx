// Hero.jsx
import React from 'react';

function Hero() {
  return (
    <div className="hero">
      {/* Hero content */}
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-lg-5">
            <div class="intro-excerpt">
              <h1><span clsas="d-block">Your Business Name</span></h1>
              <p class="mb-4">Your Business description here in 1-2 Lines only</p>
              <p><a href="" class="btn btn-secondary me-2">Explore Now</a></p>
            </div>
          </div>
          <div class="col-lg-7">
            <div class="hero-img-wrap">
              <img src="images/couch.png" class="img-fluid"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Hero;
