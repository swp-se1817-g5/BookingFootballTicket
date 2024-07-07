<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.3/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.12.3/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDO5dM9DEo4XTUrydXPtsc1YZkjEOdZ2O0",
    authDomain: "footballbookingticket-35e27.firebaseapp.com",
    projectId: "footballbookingticket-35e27",
    storageBucket: "footballbookingticket-35e27.appspot.com",
    messagingSenderId: "62896471958",
    appId: "1:62896471958:web:a96c82b4929ba59daa27b7",
    measurementId: "G-PF7BQCCDWC"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>