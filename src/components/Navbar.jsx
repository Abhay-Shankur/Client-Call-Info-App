// Navbar.jsx
import React from 'react';

function Navbar() {
  return (
    <nav className="custom-navbar navbar navbar-expand-md navbar-dark bg-dark" aria-label="Furni navigation bar">
      {/* Navbar content */}
      <div className="container">
			<span className="navbar-brand" >Name<span>.</span></span>

			<button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
				aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
				<span className="navbar-toggler-icon"></span>
			</button>

			<div className="collapse navbar-collapse" id="navbarsFurni">
				<ul className="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
					<li className="nav-item active">
						<a href='/#'  className="nav-link" >Home</a>
					</li>
					<li><a href='/#'  className="nav-link">Shop</a></li>
					<li><a href='/#'  className="nav-link">About us</a></li>
					<li><a href='/#'  className="nav-link">Services</a></li>
					<li><a href='/#'  className="nav-link">Blog</a></li>
					<li><a href='/#' className="nav-link">Contact us</a></li>
				</ul>


			</div>
		</div>
    </nav>
  );
}

export default Navbar;
