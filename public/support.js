// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional

const firebaseConfig = {
    apiKey: "AIzaSyB5R59W44CUBTFNNhzE_afYxVUBmJrwhek",
    authDomain: "medipal-9cc60.firebaseapp.com",
    databaseURL: "https://medipal-9cc60-default-rtdb.firebaseio.com",
    projectId: "medipal-9cc60",
    storageBucket: "medipal-9cc60.appspot.com",
    messagingSenderId: "675867067235",
    appId: "1:675867067235:web:0de1e1aab96862a8f84956",
    measurementId: "G-M0KN12CVFQ"
  };

// Initialize Firebase
app = firebase.initializeApp(firebaseConfig);
//const auth = getAuth(app)
var MediPalDB= firebase.database().ref("MediPal");

// Detect auth state


document.getElementById("MediPal").addEventListener("submit", submitForm);

function submitForm(e) {
  e.preventDefault();

  var name = getElementVal("name");
  var emailid = getElementVal("emailid");
  var msgContent = getElementVal("msgContent");

  saveMessages(name, emailid, msgContent);

  //   enable alert
  document.querySelector(".alert").style.display = "block";

  //   remove the alert
  setTimeout(() => {
    document.querySelector(".alert").style.display = "none";
  }, 3000);

  //   reset the form
  document.getElementById("MediPal").reset();
}

const saveMessages = (name, emailid, msgContent) => {
  var newMediPal = MediPalDB.push();

  newMediPal.set({
    name: name,
    emailid: emailid,
    msgContent: msgContent,
  });
};

const getElementVal = (id) => {
  return document.getElementById(id).value;
};

function retrieveData() {
  // Reference the 'MediPal' node in your Firebase Realtime Database
  console.log("This is data retrieve");

  // Use the `once()` method to retrieve the data once
  MediPalDB.once('value', function(snapshot) {
      // Define a variable to store the HTML content
      let userData = ''; // Initialize an empty string

      // Iterate over each child of the 'MediPal' node
      snapshot.forEach((childSnapshot) => {
          const data = childSnapshot.val(); // Get the data for the current child

          // Append data to the userData string
          userData += `<p>Name: ${data.name}, Email: ${data.emailid}, Message: ${data.msgContent}</p>`;
      });

      // Select the userData element in the HTML and set its innerHTML to the generated HTML content
      document.getElementById('userData').innerHTML = userData;
  });
}

retrieveData(); // Call the function to retrieve the data