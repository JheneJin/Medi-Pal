import 'package:flutter/material.dart';

final TextEditingController _waterGoalController = TextEditingController();
final TextEditingController _reminderDurationController =
    TextEditingController();
/*
    General recommendations:
    The National Academy of Medicine suggests an adequate intake
    of daily fluids of about
    13 cups and 9 cups for healthy men and women, respectively,
    with 1 cup equaling 8 ounces (236.588 mL).
 */
void setWater(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Set Water Goal "),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _waterGoalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Water Goal',
                    helperText: 'mL',
                    hintText: 'Your daily water goal',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _reminderDurationController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Reminder Duration',
                    helperText: 'hours',
                    hintText: 'How often you drink.',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              child: Text('Set'),
              onPressed: () {
                // Handle the input data
                final waterGoal = int.tryParse(_waterGoalController.text);
                final reminderDuration =
                    int.tryParse(_reminderDurationController.text);

                if (waterGoal != null && reminderDuration != null) {
                  // Perform action with the water goal and reminder duration
                  print(
                      "Water Goal: $waterGoal mL, Reminder every $reminderDuration hours");
                  // Clear inputs after usage or handle errors as necessary
                  Navigator.of(context).pop();
                } else {
                  // Handle input validation or show an error message
                  print("Please enter valid numbers.");
                }
              },
            ),
          ],
        );
        ;
      });
