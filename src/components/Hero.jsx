// Hero.jsx
import React from 'react';

function Hero({ businessName, businessDescription, imageBanner }) {
  // Set default values if props are not provided
  const defaultBusinessName = businessName || 'CALL INFOS';
  const defaultBusinessDescription = businessDescription || 'Callinfos is Android Mobile App is a popular and Low Cost marketing tool that helps Business to sends Atomatic text messages And whatsup messages with catalog to their intended audience group. When you get a call or Miss Call from any number or You Call Anyone automatically text message And whatsup msg will send to that number with your business information or Offers or Message with one page website';
  const defaultImageBanner = imageBanner || './images/CallInfosBanner.jpg';

  return (
    <div className="hero">
      {/* Hero content */}
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-5">
            <div className="intro-excerpt">
              <h1><span clsas="d-block">{defaultBusinessName}</span></h1>
              <p className="mb-4">{defaultBusinessDescription}</p>
              <p><a href="#home" className="btn btn-secondary me-2">Explore Now</a></p>
            </div>
          </div>
          <div className="col-lg-7">
            <img src={defaultImageBanner} alt='CoverImage' className="img-fluid" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Hero;
