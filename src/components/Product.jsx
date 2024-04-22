// Product.jsx
import React from 'react';

function Product() {
  return (
    <div className="untree_co-section product-section before-footer-section">
      {/* Product content */}
      <div className="container">
        <div className="row">

          {/* <!-- Start Column 1 --> */}
          <div className="col-md-12 col-lg-3 mb-5 mb-lg-0">
            <h2 className="mb-4 section-title">(Max 10 words)One Line Descrition What makes you uniqe</h2>
            <p className="mb-4">Describe your specialization In 2-3 Lines onlu</p>
            <p><a href="shop.html" className="btn">Explore</a></p>
          </div>

          <div className="col-12 col-md-4 col-lg-3 mb-5">
            <a className="product-item" href="/#">
              <img src="images/product-3.png" alt='Product' className="img-fluid product-thumbnail"/>
              <h3 className="product-title">Nordic Chair</h3>
              <strong className="product-price">$50.00</strong>

              <span className="icon-cross">
                <img src="images/cross.svg" alt='Product' className="img-fluid"/>
              </span>
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Product;
