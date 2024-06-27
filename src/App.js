import './App.css';
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

import Navbar from './components/Navbar';
import Hero from './components/Hero';
import Services from './components/Services';
import WeHelp from './components/WeHelp';
import Product from './components/Product';
import Gallery from './components/Gallery'; 
import Testimonial from './components/Testimonial';
import Footer from './components/Footer';
// import SiteHistoryOverview from './components/SiteSummary';

import { initializeApp } from "firebase/app";
import { getFirestore, doc, getDoc } from 'firebase/firestore';

function App(props) {
  const { id } = useParams();

  // Set a default value for props.document if it's not provided
  const [WebsiteInfo, setWebsiteInfo] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const firebaseConfig = {
      apiKey: "AIzaSyC2NOiY3zn0Xh7RSG1RGkTx7Gl8XMFsTgE",
      authDomain: "call-infos.firebaseapp.com",
      projectId: "call-infos",
      storageBucket: "call-infos.appspot.com",
      messagingSenderId: "840804333118",
      appId: "1:840804333118:web:300562b67e266e6dd4c36f",
      measurementId: "G-T2Y4XMBT9Y"
    };


    // Initialize Firebase
    const initializedApp = initializeApp(firebaseConfig);

    // Fetch business information based on the URL path
    const fetchData = async () => {
      const db = getFirestore(initializedApp);
      // let path = id || 'callinfos';
      let path = id || 'default';
      const docRef = doc(db, 'Website', path);
      try {
        const docSnap = await getDoc(docRef);
        if (docSnap.exists && docSnap._document != null) {
          setWebsiteInfo(docSnap.data());
          console.log('Data Found');
        } else if (id !== undefined) {
          window.location.assign('/');
        } else {
          console.error('No such document!');
          window.location.assign('/pagenotfound');
        }
      } catch (error) {
        console.error('Error fetching document:', error);
      } finally {
        setLoading(false); // Set loading to false when data fetching is complete
      }
    };

    // Fetch data for the current business
    fetchData();

  }, [id]);

  // effect to update favicon
  // useEffect(() => {
  //   let link = document.querySelector("link[rel~='icon']");
  //   if (!link) {
  //     link = document.createElement('link');
  //     link.rel = 'icon';
  //     document.getElementsByTagName('head')[0].appendChild(link);
  //   }
  //   if(WebsiteInfo?.MasterData?.imageBanner != null)
  //     link.href = WebsiteInfo?.MasterData?.imageBanner;
  // }, [WebsiteInfo?.MasterData?.imageBanner]);

  // effect to update Document Title
  useEffect(() => {
    if (WebsiteInfo?.MasterData?.businessName != null)
      document.title = WebsiteInfo?.MasterData?.businessName;
  }, [WebsiteInfo?.MasterData?.businessName]);

  if (loading) {
    // return <ReactLoading type={'spinningBubbles'} color={'#000'} />;
    return (
      <div className="spinner-grow container" role="status">
        <center>
          <span className="visually-hidden">Loading...</span>
        </center>
      </div>
    );
  }

  return (
    <div className="App" id='home'>
      <Navbar businessName={WebsiteInfo?.MasterData?.businessName || 'Call Infos'} />
      <Hero
        businessName={WebsiteInfo?.MasterData?.businessName}
        businessDescription={WebsiteInfo?.MasterData?.businessDescription}
        imageBanner={WebsiteInfo?.MasterData?.imageBanner}
      />
      {WebsiteInfo?.Services && <Services data={WebsiteInfo.Services} />}
      {WebsiteInfo?.WeHelp && <WeHelp data={WebsiteInfo.WeHelp} />}
      {/* <Gallery images={imageUrls} videos={videoUrls} /> */}
      {WebsiteInfo?.Gallery && <Gallery images={WebsiteInfo.Gallery?.Photos} videos={WebsiteInfo.Gallery?.Videos} />}
      {WebsiteInfo?.ProductsList && <Product data={WebsiteInfo.ProductsList} />}
      {WebsiteInfo?.Reviews && <Testimonial data={WebsiteInfo.Reviews} />}
      {/* <SiteHistoryOverview /> */}
      {/* {WebsiteInfo?.MasterData && <ContactForm data={WebsiteInfo.MasterData}/>} */}
      {(WebsiteInfo?.MasterData && WebsiteInfo?.Links) && <Footer data={WebsiteInfo.MasterData} links={WebsiteInfo.Links} />}
      {/* Add Gallery component with imageUrls and videoUrls as props */}
    </div>
  );
}

export default App;
