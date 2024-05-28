import React from 'react';


function WeHelp(props) {
  const data = props.data;
  return (
    <div className="we-help-section" id='wehelp-section'>
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-7 mb-5 mb-lg-0">
            {/* <div className="imgs-grid">
              <div className="grid grid-1"><img src={data.image1} alt="Untree.co"/></div>
              <div className="grid grid-2"><img src={data.image2} alt="Untree.co"/></div>
              <div className="grid grid-3"><img src={data.image3} alt="Untree.co"/></div>
            </div> */}
          </div>

            <h2 className="section-title mb-4">We Help You {data.heading}</h2>
            <p>{data.description}</p>
            {/* Corrected href attribute */}
            <p><a href="/#" className="btn">Explore</a></p>
        
        </div>
      </div>
    </div>
  );
}

export default WeHelp;
