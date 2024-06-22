// Product.jsx
import React from 'react';

function Product(props) {
  let products = props.data;
  products = products.map((e, i) => {
    return (
      <div className="col-12 col-md-4 col-lg-3 mb-5" key={i}>
        <a className="product-item" href="/#">
          <div className="product-image-wrapper">
            <img src={e.imagePath} alt='Product' className="img-fluid product-thumbnail"/>
          </div>
          <h3 className="product-title">{e.productName}</h3>
          <strong className="product-price">₹{e.productPrice}</strong>
          {/* <span className="icon-cross">
            <img src="images/cross.svg" alt='Cross' className="img-fluid"/>
          </span> */}
        </a>
      </div>
    );
  });
  
  return (
    <div className="product-section before-footer-section" id='products-section'>
      {/* Product content */}
      <div className="container">
        <div className="row">

          {/* <!-- Start Column 1 --> */}
          <div className="col-md-12 col-lg-3 mb-5 mb-lg-0">
            <h2 className="mb-4 section-title">Our Unique Products.</h2>
            <p className="mb-4">Describe your specialization In 2-3 Lines only</p>
            {/* <p><a href="/#" className="btn">Explore</a></p> */}
          </div>

          {products}

          {/* <div className="col-12 col-md-4 col-lg-3 mb-5">
            <a className="product-item" href="/#">
              <img src="images/product-3.png" alt='Product' className="img-fluid product-thumbnail"/>
              <h3 className="product-title">Nordic Chair</h3>
              <strong className="product-price">$50.00</strong>

              <span className="icon-cross">
                <img src="images/cross.svg" alt='Product' className="img-fluid"/>
              </span>
            </a>
          </div> */}
        </div>
      </div>
    </div>
  );
}

export default Product;
