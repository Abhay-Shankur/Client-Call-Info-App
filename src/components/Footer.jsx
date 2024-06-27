  import React from 'react';

  function Footer({data,links}) {
    // Static content
    // const data = {
    //   businessName: "Frostique Cakes",
    //   businessAddress: "123 Main Street, Suite 1000, City of Springfield, Metropolitan Area, State of Liberty, Country of Unity, Postal Code: 12345-6789",
    //   ownerContact: "+1234567890",
    //   businessMail: "info@example.com",
    //   businessDescription: "Indulge in the delightful world of sweetness at our charming cake shop and bakery. At Frostique Cakes, we craft each confection with love, creativity, and a touch of magic, bringing smiles to every bite. From decadent layered cakes to artisanal pastries, our tantalizing treats are baked fresh daily using only the finest ingredients. Whether you're celebrating a special occasion or simply satisfying your sweet tooth, our delectable delights promise to elevate every moment. Step into our cozy bakery and let the aroma of freshly baked goods transport you to a world of pure bliss. Welcome to a place where every bite is a celebration.",
    // };

    // Static tags
    const tags = {
      services: "#services-section",
      whatWeDo: "#wehelp-section",
      products: "#products-section",
      imageGallery: "#gallery-section",
      videoGallery: "#gallery-section",
      contactUs: "#contactus-section",
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
                      <li className="me-4"><a href={tags.services}>Services</a></li>
                      <li className="me-4"><a href={tags.whatWeDo}>What We Do</a></li>
                      <li className="me-4"><a href={tags.products}>Products</a></li>
                    </ul>
                    <ul className="list-unstyled d-flex justify-content-center">
                      <li className="me-4"><a href={tags.imageGallery}>Image Gallery</a></li>
                      <li className="me-4"><a href={tags.videoGallery}>Video Gallery</a></li>
                      <li><a href={tags.contactUs}>Contact Us</a></li>
                    </ul>
                    <ul className="list-unstyled custom-social d-flex justify-content-center">
                      {links.facebookLink && <li className="me-4"><a href={links.facebookLink} target='_blank' rel="noopener noreferrer"><span className="fa fa-brands fa-facebook-f"></span></a></li>}
                      {links.whatsappLink && <li className="me-4"><a href={links.whatsappLink} target='_blank' rel="noopener noreferrer"><span className="fa fa-brands fa-whatsapp"></span></a></li>}
                      {links.instagramLink && <li className="me-4"><a href={links.instagramLink} target='_blank' rel="noopener noreferrer"><span className="fa fa-brands fa-instagram"></span></a></li>}
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
