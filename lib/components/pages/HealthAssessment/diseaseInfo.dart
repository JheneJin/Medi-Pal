import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiseaseInfoScreen extends StatelessWidget {
  final String userDisease;
  final String userDiseaseID;
  
  DiseaseInfoScreen({this.userDiseaseID = "EO1oWhfvlkMICXgg0JqI", required this.userDisease});

  Future<Map<String, dynamic>> _getAllDiseaseInfo(String userDiseaseID) async {
    var collection = FirebaseFirestore.instance.collection("Disease Information");
    var document = await collection.doc(userDiseaseID).get();

    if (document.exists) {
      var diseaseData = document.data() as Map<String, dynamic>;

      // Normalize keys by removing spaces and apostrophes
      diseaseData = diseaseData.map((key, value) =>
          MapEntry(key.toLowerCase().replaceAll(' ', '').replaceAll("'", ""), value));
      return diseaseData;
    } else {
      throw Exception("Document not found for $userDisease");
    }
  }

  @override
  Widget build(BuildContext context) {
    String alphaDisease = userDisease[0].toUpperCase() + userDisease.substring(1);
    return Scaffold(
      appBar: AppBar(
        title: Text(alphaDisease),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getAllDiseaseInfo(userDiseaseID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            var diseaseData = snapshot.data!;
            String _disease = userDisease.toLowerCase().replaceAll(' ', '').replaceAll("'", "");
            if (!diseaseData.containsKey(_disease)) {
              return Center(
                child: Text("Data not available for $userDisease"),
              );
            }

            var formattedData = _formatData(diseaseData[_disease]);
            List<String> foodRec = formattedData[0];
            List<String> foodAvoid = formattedData[1];

            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Foods Recommended:",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildFoodList(foodRec),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Foods to Avoid:",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildFoodList(foodAvoid),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildFoodList(List<String> foods) {
    return foods.map((food) => Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(food),
    )).toList();
  }

List<List<String>> _formatData(List<dynamic> data) {
  List<String> foodRec = [];
  List<String> foodAvoid = [];
  int avoidIndex = 0;

  for (int i = 0; i < data.length; i++) {
    if (data[i] == "Foods to Avoid:") {
      avoidIndex = i;
      break;
    }

    if (data[i] != "Foods Recommended:") {
      String bp = (data[i]).toString();
      foodRec.add(bp);
    }
  }

  for (int i = avoidIndex; i < data.length; i++) {
    if (data[i] != "Foods to Avoid:") {
      String bp = (data[i]).toString();
      foodAvoid.add(bp);
    }
  }

  return [foodRec, foodAvoid];
}
}
