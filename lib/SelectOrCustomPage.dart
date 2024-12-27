import 'package:flutter/material.dart';
import 'homePage.dart'; // Ensure this is correctly imported if HomePage is in a different file


class SelectOrCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select or Input Mantra'),
        //backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //foregroundColor: Colors.white, //backgroundColor: Colors.deepPurple, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding inside button
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Select God',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 21),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding inside button
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomMantraPage(),
                    ),
                  );
                },
                child: Text(
                  'Custom Mantra',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomMantraPage extends StatefulWidget {
  @override
  _CustomMantraPageState createState() => _CustomMantraPageState();
}

class _CustomMantraPageState extends State<CustomMantraPage> {
  final TextEditingController customMantraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Mantra'),
        //backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextFormField(
                controller: customMantraController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Input your custom mantra',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding inside button
              ),
              onPressed: () {
                if (customMantraController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter a custom mantra'),
                  ));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChantDisplayPage(
                        godName: 'Custom',
                        godImage: '', // Placeholder image if needed
                        mantra: customMantraController.text,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Start Chanting',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
