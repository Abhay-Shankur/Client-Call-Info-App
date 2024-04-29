// Footer.jsx
import React from 'react';

function Footer(props) {
  const data = props.data;
  const links = props.links;
  return (
    <footer className="footer-section">
      {/* Footer content */}
      <div className="container relative">

        <div className="sofa-img">
          <img src="images/sofa.png" alt="Sofa" className="img-fluid"/>
        </div>



        <div className="row g-5 mb-5">
          <div className="col-lg-4">
            <div className="mb-4 footer-logo-wrap"><a href="/#" className="footer-logo">{data.businessName}<span>.</span></a></div>
            <p className="mb-4">{data.business}</p>

            <ul className="list-unstyled custom-social">
              <li><a href={links.facebookLink}><span className="fa fa-brands fa-facebook-f"></span></a></li>
              <li><a href={links.whatsappLink}><span className="fa fa-brands fa-whatsapp"></span></a></li>
              <li><a href={links.instagramLink}><span className="fa fa-brands fa-instagram"></span></a></li>
              {/* <li><a href="/#"><span className="fa fa-brands fa-linkedin"></span></a></li> */}
            </ul>
          </div>


          <div className="border-top copyright">
            <div className="row pt-4">
              <div className="col-lg-6">
                <p className="mb-2 text-center text-lg-start">Copyright &copy;
                  <script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash;
                  Designed with love by <a href="https://untree.com">OptiSync-Enablers</a> Distributed
                  By <a href="https://themewagon.com">Call-infos</a>
                </p>
              </div>

              <div className="col-lg-6 text-center text-lg-end">
                <ul className="list-unstyled d-inline-flex ms-auto">
                  <li className="me-4"><a href="/#">Terms &amp; Conditions</a></li>
                  <li><a href="/#">Privacy Policy</a></li>
                </ul>
              </div>

            </div>
          </div>
        </div>
		  </div>
    </footer>
  );
}

export default Footer;
