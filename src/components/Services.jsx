// WhyChooseUs.jsx
import React from 'react';
import staticIcon from '../icons8-service-64.png';

function Services(props) {
  let services = props.data;
  services =  services.map((e, i)=>{
    return (
      <div className="col-sm col-md-6" key={i}>
        <div className="feature">
          <div className="icon">
            <img src={staticIcon} alt="Service " className="img-fluid" height='80px' width='80px' />
          </div>
          <h3>{e.heading}</h3>
          <p>{e.description}</p>
        </div>
      </div>
    );
  });
  return (
    <div className="why-choose-section" id='services-section'>
      {/* Why Choose Us content */}
      <div className="container">
        <div className="row justify-content-between">
          <h2 className="section-title">Services We Provide</h2>
          {/* <p>Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit
            imperdiet dolor tempor tristique.</p> */}
          <div className="row my-5">
            {services}
          </div>
        </div>
      </div>
    </div>
  );
}

export default Services;
