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
firebase.initializeApp(firebaseConfig);

var MediPalDB= firebase.database().ref("MediPal");

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
