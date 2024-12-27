import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void feedbackFunction(BuildContext context) async {
  final TextEditingController feedbackController = TextEditingController();

  // Show a dialog to collect feedback
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Feedback'),
        content: TextField(
          controller: feedbackController,
          decoration: InputDecoration(hintText: 'Enter your feedback here'),
          maxLines: 5,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Submit'),
            onPressed: () async {
              if (feedbackController.text.isNotEmpty) {
                // Add feedback to Firestore
                try {
                  await FirebaseFirestore.instance.collection('feedback').add({
                    'feedback': feedbackController.text,
                    'timestamp': Timestamp.now(),
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Feedback submitted successfully!'),
                  ));

                  Navigator.of(context).pop(); // Close the dialog
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error submitting feedback: $e'),
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Please enter some feedback'),
                ));
              }
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
