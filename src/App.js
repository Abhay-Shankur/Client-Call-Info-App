import './App.css';
import React, { useEffect, useState } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import WhyChooseUs from './components/WhyChooseUs';
import WeHelp from './components/WeHelp';
import Product from './components/Product';
import Testimonial from './components/Testimonial';
import ContactForm from './components/ContactForm';
import Footer from './components/Footer';

import { initializeApp } from "firebase/app";
import { getFirestore, doc, getDoc } from 'firebase/firestore';

function App(props) {
  const [businessInfo, setBusinessInfo] = useState(null);
  const [loading, setLoading] = useState(true);
  // const [firebaseApp, setFirebaseApp] = useState(null);

  useEffect(() =>  {
    // Inside useEffect to adhere to React hooks rules
    let app = props.firebaseApp;

    if(app == null) {
      const firebaseConfig = {
        apiKey: "Your API Key",
        authDomain: "Your Auth Domain",
        projectId: "Your Project ID",
        storageBucket: "Your Storage Bucket",
        messagingSenderId: "Your Messaging Sender ID",
        appId: "Your App ID",
        measurementId: "Your Measurement ID"
      };

      // Initialize Firebase
      const initializedApp = initializeApp(firebaseConfig);
      
      // Assign the initialized app to the app variable
      app = initializedApp;
      // setFirebaseApp(app);
    }

    // Fetch business information based on the URL path
    const fetchData = async () => {
      const path = window.location.pathname.substring(1); // Remove leading '/'
      console.log(path);
      const db = getFirestore(app);
      const docRef = doc(db, 'businesses', path);
      try {
        const docSnap = await getDoc(docRef);
        if (docSnap.exists) {
          setBusinessInfo(docSnap.data());
          console.log('Data Found');
        } else {
          console.error('No such document!');
        }
      } catch (error) {
        console.error('Error fetching document:', error);
      } finally {
        setLoading(false); // Set loading to false when data fetching is complete
      }
    };

    // Fetch data for the current business
    fetchData();
  }, [props.firebaseApp]);

  // Render loading indicator if data is being fetched
  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    
    <div className="App">    
      <Navbar businessName={businessInfo.businessName}/>

      <Hero 
        businessName={businessInfo.businessName} 
        businessDescription={businessInfo.businessDescription} 
        businessBanner={businessInfo.businessBanner}
      />
      
      <WhyChooseUs />
      <WeHelp />
      <Product />
      <Testimonial />
      <ContactForm />
      <Footer />    
      {console.log(businessInfo)}
    </div>
  );
}

export default App;
