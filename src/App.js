import './App.css';
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
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
  const { id } = useParams();
  
  // Set a default value for props.document if it's not provided
  const [WebsiteInfo, setWebsiteInfo] = useState(null);
  const [loading, setLoading] = useState(true);
  // const [firebaseApp, setFirebaseApp] = useState(null);

  useEffect( () =>  {
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
      let path = id;
      if(id === undefined) path = 'callinfos';
      // path = (path.length > 0) ? path : 'callinfos';
      // if(path.length === 0) path='callinfos';
      const docRef = doc(db, 'Website', path);
      try {
        const docSnap = await getDoc(docRef);
        if (docSnap.exists && docSnap._document != null) {
          setWebsiteInfo(docSnap.data());
          console.log('Data Found');
        } else if(id !== undefined) {
          window.location.assign('/');
        } else{
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

  
  // Render loading indicator while loading is true
  if (loading) {
    return <ReactLoading type={'spinningBubbles'} color={'#000'} />;
  }

  return (
    
    <div className="App" id='home'>    
      <Navbar businessName={WebsiteInfo?.MasterData?.businessName || 'Call Infos'}/>

      <Hero 
        businessName={WebsiteInfo?.MasterData?.businessName} 
        businessDescription={WebsiteInfo?.MasterData?.businessDescription} 
        imageBanner={WebsiteInfo?.MasterData?.imageBanner}
      />
       
      {WebsiteInfo?.Services && <Services data={WebsiteInfo.Services}/>}
           
      {WebsiteInfo?.WeHelp && <WeHelp data={WebsiteInfo.WeHelp}/>}
      
      {WebsiteInfo?.ProductsList && <Product data={WebsiteInfo.ProductsList}/>}
      
      {WebsiteInfo?.Reviews && <Testimonial data={WebsiteInfo.Reviews}/>}
      
      {WebsiteInfo?.MasterData && <ContactForm data={WebsiteInfo.MasterData}/>}
      
      {(WebsiteInfo?.MasterData && WebsiteInfo?.Links) && <Footer data={WebsiteInfo.MasterData} links={WebsiteInfo.Links}/>}   

      
    </div>
  );
}

export default App;
