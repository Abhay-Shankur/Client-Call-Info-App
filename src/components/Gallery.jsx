import React from 'react';
// Import the CSS file for gallery styles

const Gallery = ({ images, videos }) => {
  return (
    <div className="gallery-section">
      <div className="container">
        {/* Image Gallery */}
        <div className="image-gallery">
          <h2 className="section-title">Image Gallery</h2>
          <div className="row">
            {/* Map through image URLs and display images */}
            {images.map((image, index) => (
              <div className="col-md-4 mb-4" key={index}>
                {/* Apply fixed width and height to the image */}
                <img src={image} alt={`Image ${index}`} className="fixed-image" />
              </div>
            ))}
          </div>
        </div>

        {/* Video Gallery */}
        <div className="video-gallery">
          <h2 className="section-title">Video Gallery</h2>
          <div className="row">
            {/* Map through video URLs and display videos */}
            {videos.map((video, index) => (
              <div className="col-md-6 mb-4" key={index}>
                {/* Apply fixed width and height to the video iframe */}
                <iframe
                  src={video}
                  title={`Video ${index}`}
                  className="fixed-video"
                ></iframe>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Gallery;
