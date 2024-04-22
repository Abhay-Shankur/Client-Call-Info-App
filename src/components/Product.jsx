// Product.jsx
import React from 'react';

function Product() {
  return (
    <div className="untree_co-section product-section before-footer-section">
      {/* Product content */}
      <div class="container">
        <div class="row">

          {/* <!-- Start Column 1 --> */}
          <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
            <h2 class="mb-4 section-title">(Max 10 words)One Line Descrition What makes you uniqe</h2>
            <p class="mb-4">Describe your specialization In 2-3 Lines onlu</p>
            <p><a href="shop.html" class="btn">Explore</a></p>
          </div>

          <div class="col-12 col-md-4 col-lg-3 mb-5">
            <a class="product-item" href="#">
              <img src="images/product-3.png" class="img-fluid product-thumbnail"/>
              <h3 class="product-title">Nordic Chair</h3>
              <strong class="product-price">$50.00</strong>

              <span class="icon-cross">
                <img src="images/cross.svg" class="img-fluid"/>
              </span>
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Product;
