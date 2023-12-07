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
database = firebase.database();

// initialize medipal to corresponding database in firebase realtime db
var medipal = database.ref('MediPal');

// Always listening to get the data
// Retrieve Data in the Database
/* medipal.on('value', (users) => {
  console.log('1. Get data from MediPal database:')
  // Print all users in the database
  console.log(users.val());
  // Get each user in the database
  users.forEach((user) => {
    // Get a user object
    const user_ref = user.val();
    // Get user id, name, email, and message content
    console.log(`User_id: ${user.key}, 
                 Name: ${user_ref.name}, 
                 Email: ${user_ref.emailid}, 
                 Message: ${user_ref.msgContent}`);

  })
}, (errorObject) => {
  console.log('Cannot read the data: ' + errorObject.name);
});  */

// Always listening to get data
// Another way to get data
medipal.on('value', getData, errData);

/**
 * Print added data to the console
 * @param {data}: data to get
 */
function getData(data){
  console.log('2. Get data from MediPal database:')
  // Get all data objects
  var users = data.val();
  console.log('Object users in MediPal database: ', users);
  // User id array
  var users_id = Object.keys(users); 
  console.log('UserID: ', users_id);

  // Try to get user 1 id, we can retrieve each user by for loop
  console.log('User 1: ', users_id[0]);

  // Using for loop to get all users
  data.forEach((user) => {
    // Get a user object
    const user_ref = user.val();
    // Get user id, name, email, and message content
    console.log(`User_id: ${user.key}, 
                 Name: ${user_ref.name}, 
                 Email: ${user_ref.emailid}, 
                 Message: ${user_ref.msgContent}`);
  });
}

function errData(err){
  console.log('Cannot read the data: ' + errorObject.name);
}

// calls the sumitForm function when user clicks on the submit button
document.getElementById("MediPal").addEventListener("submit", submitForm);

// saves data to database
const saveMessages = (name, emailid, msgContent) => {
  // creates reference nod in database
  var newMediPal = medipal.push();
  // firebase.database().ref('MediPal/' + name).set()
  newMediPal.set({
    name: name,
    emailid: emailid,
    msgContent: msgContent,
  });
};

// gets element by id input
const getElementVal = (id) => {
  // extract values by id
  return document.getElementById(id).value;
};

function submitForm(e) {
  // prevents defaults to customize data handling
  e.preventDefault();

  // Set inputs for users
  var name = getElementVal("name");
  var emailid = getElementVal("emailid");
  var msgContent = getElementVal("msgContent");

  // saves the data from the input into one object
  saveMessages(name, emailid, msgContent);

  // enable alert to show that the msg is sent
  document.querySelector(".alert").style.display = "block";

  // removes alert and reloads page after 3 seconds
  setTimeout(() => {
    document.querySelector(".alert").style.display = "none";
  }, 3000);

  // resets the form
  document.getElementById("MediPal").reset();
}


