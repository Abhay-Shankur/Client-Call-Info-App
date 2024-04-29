// Testimonial.jsx

import React from "react";
import {
  MDBCarousel,
  // MDBCarouselInner,
  MDBCarouselItem,
  MDBCol,
  MDBRow,
} from "mdb-react-ui-kit";


function Testimonial(props) {
  let testimonials = props.data;
  testimonials = testimonials.map((e, i) => {
    return(
      <MDBCarouselItem key={i} className={i===0?"active":""}>
        <p className="lead font-italic mx-4 mx-md-5">
          "{e.description}"
        </p>
        <div className="mt-5 mb-4">
          <img
            src="images/default-profile.jpg"
            className="rounded-circle img-fluid shadow-1-strong"
            alt="sample "
            width="100"
            height="100"
          />
        </div>
        <p className="text-muted mb-0">- {e.name}</p>
      </MDBCarouselItem>
    );
  });

  return (
    <MDBRow className="py-5 text-center">
      <MDBCol md="12">
        <h3 className="mb-4">Testimonials</h3>
        <MDBCarousel showControls dark>
          {testimonials}

          {/* <MDBCarouselInner> */}
            {/* <MDBCarouselItem className="active">
              <p className="lead font-italic mx-4 mx-md-5">
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Fugit, error amet numquam iure provident voluptate esse quasi,
                voluptas nostrum quisquam!"
              </p>
              <div className="mt-5 mb-4">
                <img
                  src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(2).webp"
                  className="rounded-circle img-fluid shadow-1-strong"
                  alt="smaple "
                  width="100"
                  height="100"
                />
              </div>
              <p className="text-muted mb-0">- Anna Morian</p>
            </MDBCarouselItem>
            <MDBCarouselItem>
              <p className="lead font-italic mx-4 mx-md-5">
                "Neque cupiditate assumenda in maiores repudiandae mollitia
                adipisci maiores repudiandae mollitia consectetur adipisicing
                architecto elit sed adipiscing elit."
              </p>
              <div className="mt-5 mb-4">
                <img
                  src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(31).webp"
                  className="rounded-circle img-fluid shadow-1-strong"
                  alt="smaple"
                  width="100"
                  height="100"
                />
              </div>
              <p className="text-muted mb-0">- Teresa May</p>
            </MDBCarouselItem>
            <MDBCarouselItem>
              <p className="lead font-italic mx-4 mx-md-5">
                "Duis aute irure dolor in reprehenderit in voluptate velit esse
                cillum dolore eu fugiat nulla pariatur est laborum neque
                cupiditate assumenda in maiores."
              </p>
              <div className="mt-5 mb-4">
                <img
                  src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(10).webp"
                  className="rounded-circle img-fluid shadow-1-strong"
                  alt="smaple "
                  width="100"
                  height="100"
                />
              </div>
              <p className="text-muted mb-0">- Kate Allise</p>
            </MDBCarouselItem> */}
          {/* </MDBCarouselInner> */}
        </MDBCarousel>
      </MDBCol>
    </MDBRow>
  );
}

export default Testimonial;
