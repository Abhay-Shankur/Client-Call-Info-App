// Testimonial.jsx

import React from "react";
import {
  MDBCarousel,
  // MDBCarouselInner,
  MDBCarouselItem,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBIcon,
} from "mdb-react-ui-kit";

export default function Testimonial({data}) {
  const reviews = data.map((ele, i) => {
    // const active = (i===0) ? 'active' : '';
    return (
      <MDBCarouselItem className={`${i === 0 ? 'active' : ''} text-center`} key={i}>
        <img
          src="./images/rating.avif"
          alt="avatar"
          className="rounded-circle shadow-1-strong mb-4"
          style={{ width: "150px" }}
        />
        <MDBRow className="d-flex justify-content-center">
          <MDBCol>
            <h5 className="mb-3">{ele.name}</h5>
            {/* <p>Photographer</p> */}
            <p className="text-muted">
              <MDBIcon fas icon="quote-left" className="pe-2" />
              {ele.description}
            </p>
          </MDBCol>
        </MDBRow>
        <ul className="list-unstyled d-flex justify-content-center text-warning mb-0">
          <li>
            <MDBIcon fas icon="star" size="sm" />
          </li>
          <li>
            <MDBIcon fas icon="star" size="sm" />
          </li>
          <li>
            <MDBIcon fas icon="star" size="sm" />
          </li>
          <li>
            <MDBIcon fas icon="star" size="sm" />
          </li>
          <li>
            <MDBIcon far icon="star" size="sm" />
          </li>
        </ul>
      </MDBCarouselItem>
    );
  });

  return (
    <MDBContainer className="my-4">
      <MDBCarousel showControls dark>
        {reviews}
      </MDBCarousel>
    </MDBContainer>
  );
}