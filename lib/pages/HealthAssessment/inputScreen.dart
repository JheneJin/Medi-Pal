import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../sharedPref.dart';

import 'diseaseInfo.dart';

class InputScreen extends StatefulWidget {
  final String? email;

  const InputScreen({Key? key, required this.email}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String _inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Assessment"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello New User! To use this app to the utmost effectiveness, completing the health assessment is highly recommended.",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _inputValue = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Enter any Diseases you may have:",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {//calls save disease function here and navigates to another screen
                  _saveDisease();
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //saves disease into firestore
  void _saveDisease() {
  if (_inputValue.isNotEmpty) {

    FirebaseFirestore.instance.collection("users").doc(widget.email).set(
      {
        "userDisease": _inputValue,
      },
      SetOptions(merge: true), 
    ).then((value) {
      //pushes into diseaseInfo Screen after and passes userDisease too
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiseaseInfoScreen(userDisease: _inputValue),
        ),
      );
    }).catchError((error) {
      print("Failed to save input: $error");
    });
  }
}
}
