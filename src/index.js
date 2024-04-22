import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

import firebase from 'firebase/app'; // Import Firebase core module
import 'firebase/analytics'; // Import Firebase Analytics module

// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
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
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
// reportWebVitals();
