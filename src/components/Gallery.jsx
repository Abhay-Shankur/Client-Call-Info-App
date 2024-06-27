import React from 'react';
import Masonry, { ResponsiveMasonry } from "react-responsive-masonry"

const extractVideoId = (url) => {
  const urlObj = new URL(url);
  return urlObj.search.split('v=')[1];
};

const Gallery = ({ images, videos }) => {

  return (
    <div id="gallery-section">
      <div className="container">

        {/* Image Gallery */
          images &&
          <div className="image-gallery container p-2">
            <h2 className="section-title">Image Gallery</h2>
            <ResponsiveMasonry
              columnsCountBreakPoints={{ 350: 1, 750: 2, 900: 3 }}
            >
              <Masonry className="gallery-grid">
                {images.map((image, index) => (
                  <div className="image-wrapper" key={index}>
                    <img src={image} alt={`${index}`} className="fixed-image" />
                  </div>
                ))}
              </Masonry>
            </ResponsiveMasonry>
          </div>
        }

        {/* Video Gallery */
          videos &&
          <div className="video-gallery container p-2">
            <h2 className="section-title">Video Gallery</h2>
            <ResponsiveMasonry
              columnsCountBreakPoints={{ 350: 1, 750: 2, 900: 3 }}
            >
              <Masonry className="video-container">
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
              </Masonry>
            </ResponsiveMasonry>
          </div>
        }
      </div>
    </div >
  );
};



export default Gallery;
