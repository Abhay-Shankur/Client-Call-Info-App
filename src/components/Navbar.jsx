// Navbar.jsx
import React from 'react';

function Navbar({ businessName }) {

	return (
		<nav className="custom-navbar navbar navbar-expand-sm navbar-dark bg-dark px-4" aria-label="Furni navigation bar">
			{/* Navbar content */}
			<span className="navbar-brand" >{businessName}.</span>

			{/* <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
<span className="navbar-toggler-icon"></span>
</button> */}
			<button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span className="navbar-toggler-icon"></span>
			</button>

			<div className="collapse navbar-collapse" id="navbarNav">
				<ul className="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
					<li className="nav-item active"><a href='#home' className="nav-link" >Home</a></li>
					<li><a href='#services-section' className="nav-link">Services</a></li>
					<li><a href='#wehelp-section' className="nav-link">We Help To</a></li>
					<li><a href='#products-section' className="nav-link">Products</a></li>
					<li><a href='#contactus-section' className="nav-link">Contact us</a></li>
				</ul>
			</div>
		</nav>
	);
}

export default Navbar;
