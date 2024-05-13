import 'package:flutter/material.dart';
import '../../pages/HealthAssessment/inputScreen.dart';
import '../../pages/medicineDisplay/medicineInfo.dart';
import '../../sharedPref.dart';
import '../../pages/dietScreen.dart'; // Import DietScreen
import '../../pages/Calorie Calculator/tracking.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<String?> email;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    // Initialize email in initState
    email = getEmail();
    // Set the userEmail when email is resolved
    email.then((value) {
      setState(() {
        userEmail = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Button to navigate to Health Assessment screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputScreen(email: userEmail),
                  ),
                );
              },
              child: Text(
                "Health Assessment",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to Medicine screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineInfoScreen(),
                  ),
                );
              },
              child: Text(
                "Medicine",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to Calorie Calculator screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalorieCalculatorScreen(),
                  ),
                );
              },
              child: Text(
                "Calorie Calculator", 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to Diet Screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietScreen(),
                  ),
                );
              },
              child: Text(
                "Diet Screen", 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
