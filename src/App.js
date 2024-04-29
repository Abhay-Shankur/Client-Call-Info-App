import './App.css';
import React, { useEffect, useState } from 'react';
import ReactLoading from 'react-loading';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import Services from './components/Services';
import WeHelp from './components/WeHelp';
import Product from './components/Product';
import Testimonial from './components/Testimonial';
import ContactForm from './components/ContactForm';
import Footer from './components/Footer';

import { initializeApp } from "firebase/app";
import { getFirestore, doc, getDoc } from 'firebase/firestore';

function App(props) {
  
  // Set a default value for props.document if it's not provided

  const [WebsiteInfo, setWebsiteInfo] = useState(null);
  const [loading, setLoading] = useState(true);
  // const [firebaseApp, setFirebaseApp] = useState(null);

  useEffect( () =>  {
    // Inside useEffect to adhere to React hooks rules
    let app = props.firebaseApp;

    if(app == null) {
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
      
      // Assign the initialized app to the app variable
      app = initializedApp;
      // setFirebaseApp(app);
    }

    // Fetch business information based on the URL path
    const fetchData = async () => {
      let path = window.location.pathname.substring(1); // Remove leading '/'
      const db = getFirestore(app);
      path = (path.length > 0) ? path : props.document;
      console.log(path);
      const docRef = doc(db, 'Website', path);
      try {
        const docSnap = await getDoc(docRef);
        if (docSnap.exists && docSnap._document != null) {
          setWebsiteInfo(docSnap.data());
          console.log('Data Found');
        } else {
          console.error('No such document!');
          window.location.assign('/');
        }
      } catch (error) {
        console.error('Error fetching document:', error);
      } finally {
        setLoading(false); // Set loading to false when data fetching is complete
      }
    };

    // Fetch data for the current business
    fetchData();
  }, [props.document, props.firebaseApp]);

  // Render loading indicator if data is being fetched
  if (loading) {
    return <ReactLoading type={'spinningBubbles'} delay={3}/>;
  }

  return (
    
    <div className="App" id='home'>    
      <Navbar businessName={WebsiteInfo.MasterData.businessName}/>

      <Hero 
        businessName={WebsiteInfo.MasterData.businessName} 
        businessDescription={WebsiteInfo.MasterData.businessDescription} 
        businessBanner={WebsiteInfo.MasterData.businessBanner}
      />
      
      <Services data={WebsiteInfo.Services}/>
      <WeHelp data={WebsiteInfo.WeHelp}/>
      <Product data={WebsiteInfo.ProductsList}/>
      <Testimonial data={WebsiteInfo.Reviews}/>
      <ContactForm data={WebsiteInfo.MasterData}/>
      <Footer data={WebsiteInfo.MasterData} links={WebsiteInfo.Links}/>   
    </div>
  );
}

export default App;
