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
      
      // Normalize userDisease for comparison
      var normalizedUserDisease = userDisease.toLowerCase().replaceAll(' ', '').replaceAll("'", "");

      // Check if the normalized userDisease exists in diseaseData
      if (!diseaseData.containsKey(normalizedUserDisease)) {
        throw Exception("Data not available for $userDisease");
      }

      return diseaseData;
    } else {
      throw Exception("Document not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userDisease),
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

            if (!diseaseData.containsKey(userDisease)) {
              return Center(
                child: Text("Data not available for $userDisease"),
              );
            }

            var diseaseInfo = diseaseData[userDisease] as List<dynamic>;
            var formattedData = _formatData(diseaseInfo);
            return ListView.builder(
              itemCount: formattedData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        formattedData[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
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

  List<String> _formatData(List<dynamic> data) {
    List<String> foodRec = [];
    List<String> foodAvoid = [];
    int avoidIndex = 0;

    for (int i = 0; i < data.length; i++) {
      if (data[i] == ("Foods to Avoid:")) {
        avoidIndex = i;
      }
    }

    for (int i = 0; i < avoidIndex; i++) {
      foodRec.add(data[i].toString());
    }

    for (int i = avoidIndex; i < data.length; i++) {
      foodAvoid.add(data[i].toString());
    }

    foodRec.add("\n");
    List<String> formatList = foodRec + foodAvoid;
    return formatList;
  }
}

