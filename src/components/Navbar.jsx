// Navbar.jsx
import React from 'react';

function Navbar() {
  return (
    <nav className="custom-navbar navbar navbar-expand-md navbar-dark bg-dark" aria-label="Furni navigation bar">
      {/* Navbar content */}
      <div class="container">
			<a class="navbar-brand" >Name<span>.</span></a>

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
				aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsFurni">
				<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
					<li class="nav-item active">
						<a class="nav-link" >Home</a>
					</li>
					<li><a class="nav-link">Shop</a></li>
					<li><a class="nav-link">About us</a></li>
					<li><a class="nav-link">Services</a></li>
					<li><a class="nav-link">Blog</a></li>
					<li><a class="nav-link">Contact us</a></li>
				</ul>


			</div>
		</div>
    </nav>
  );
}

export default Navbar;
