// Hero.jsx
import React from 'react';

function Hero(props) {
  return (
    <div className="hero">
      {/* Hero content */}
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-5">
            <div className="intro-excerpt">
              <h1><span clsas="d-block">{props.businessName}</span></h1>
              <p className="mb-4">{props.businessDescription}</p>
              <p><a href="/#" className="btn btn-secondary me-2">Explore Now</a></p>
            </div>
          </div>
          <div className="col-lg-7">
            <div className="hero-img-wrap">
              <img src={props.businessBanner} alt='Couch'className="img-fluid"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Hero;
