  import React from 'react';

  function Footer(props) {
    // Static content
    const data = {
      businessName: "Frostique Cakes",
      businessAddress: "123 Main Street, Suite 1000, City of Springfield, Metropolitan Area, State of Liberty, Country of Unity, Postal Code: 12345-6789",
      ownerContact: "+1234567890",
      businessMail: "info@example.com",
      businessDescription: "Indulge in the delightful world of sweetness at our charming cake shop and bakery. At Frostique Cakes, we craft each confection with love, creativity, and a touch of magic, bringing smiles to every bite. From decadent layered cakes to artisanal pastries, our tantalizing treats are baked fresh daily using only the finest ingredients. Whether you're celebrating a special occasion or simply satisfying your sweet tooth, our delectable delights promise to elevate every moment. Step into our cozy bakery and let the aroma of freshly baked goods transport you to a world of pure bliss. Welcome to a place where every bite is a celebration.",
    };

    // Static links
    const links = {
      services: "#services",
      whatWeDo: "#what-we-do",
      products: "#products",
      imageGallery: "#image-gallery",
      videoGallery: "#video-gallery",
      contactUs: "#contact-us",
    };

    return (
      <footer className="footer-section">
        {/* Footer content */}
        <div className="container relative">
          <div className="row lg-5 mb-9">
            <div className="col-mb-9">
              <div className="mb-4 footer-logo-wrap">
                <a href="/#" className="footer-logo">{data.businessName}<span>.</span></a>
              </div>
              <p className="text3 mb-3" >{data.businessDescription}</p>
            </div>

            <div className="col-lg-">
              <div className="border-top border-bottom py-2">
                <p className="text-center mb-6"><strong>Business Details</strong></p>
                <div className="row">
                  <div className="col-md-7">
                    <p className="mb-3"><strong className="text-left">Address:</strong><br /> {data.businessAddress}</p>
                    <p className="mb-3"><strong className="text-left">Contact:</strong><br /> {data.ownerContact}</p>
                    <p className="mb-3"><strong className="text-left">Email:</strong><br /> <a href={`mailto:${data.businessMail}`}>{data.businessMail}</a></p>
                  </div>
                  <div className="col-md-5">
                    <p className="text-center mb-4"><strong>Quick Links</strong></p>
                    <ul className="list-unstyled d-flex justify-content-center">
                      <li className="me-4"><a href={links.services}>Services</a></li>
                      <li className="me-4"><a href={links.whatWeDo}>What We Do</a></li>
                      <li className="me-4"><a href={links.products}>Products</a></li>
                    </ul>
                    <ul className="list-unstyled d-flex justify-content-center">
                      <li className="me-4"><a href={links.imageGallery}>Image Gallery</a></li>
                      <li className="me-4"><a href={links.videoGallery}>Video Gallery</a></li>
                      <li><a href={links.contactUs}>Contact Us</a></li>
                    </ul>
                    <ul className="list-unstyled custom-social d-flex justify-content-center">
                      <li className="me-4"><a href={links.facebookLink}><span className="fa fa-brands fa-facebook-f"></span></a></li>
                      <li className="me-4"><a href={links.whatsappLink}><span className="fa fa-brands fa-whatsapp"></span></a></li>
                      <li className="me-4"><a href={links.instagramLink}><span className="fa fa-brands fa-instagram"></span></a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </footer>
    );
  }

  export default Footer;
