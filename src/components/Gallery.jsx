import React from 'react';

const extractVideoId = (url) => {
  const urlObj = new URL(url);
  return urlObj.pathname.split('/')[1];
};

const Gallery = ({ images, videos }) => {
  return (
    <div className="gallery-section">
      <div className="container">
        
        {/* Image Gallery */}
        <div className="image-gallery">
        <h2 className="section-title">Image Gallery</h2>
        <div className="gallery-grid">
          {images.map((image, index) => (
            <div className="image-wrapper" key={index}>
              <img src={image} alt={`${index}`} className="fixed-image" />
            </div>
          ))}
        </div>
      </div>
      


        {/* Video Gallery */}
        <div className="video-gallery">
          <h2 className="section-title">Video Gallery</h2>
          <div className="video-container">
            {videos.map((videoUrl, index) => {
              const videoId = extractVideoId(videoUrl);
              return (
                <div className="video-wrapper" key={index}>
                  <iframe
                    src={`https://www.youtube.com/embed/${videoId}`}
                    title={`Video ${index}`}
                    className="fixed-video"
                    frameBorder="0"
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  ></iframe>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Gallery;
