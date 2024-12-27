import 'package:chantingview/SelectOrCustomPage.dart';
import 'package:chantingview/feedbackFuntion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';



class HomePage extends StatelessWidget {
  final List<Map<String, String>> gods = [
    {'name': 'Krishna', 'image': 'assets/kri.png'},
    {'name': 'Shiva', 'image': 'assets/shiva.png'},
    {'name': 'Ganesha', 'image': 'assets/ganesha.png'},
    {'name': 'Vishnu', 'image': 'assets/vishnu.png'},
    {'name': 'Lakshmi', 'image': 'assets/lakshmi.png'},
    {'name': 'Hanuman', 'image': 'assets/hanuman.png'},
    {'name': 'Saraswati', 'image': 'assets/saraswati.png'},
    {'name': 'Durga', 'image': 'assets/durga.png'},
    {'name': 'Kali', 'image': 'assets/kali.png'},
    {'name': 'Rama', 'image': 'assets/rama.png'},
    {'name': 'Sita', 'image': 'assets/sita.png'},
    {'name': 'Radha', 'image': 'assets/radha.png'},
    {'name': 'Parvati', 'image': 'assets/parvati.png'},
    {'name': 'Brahma', 'image': 'assets/brahma.png'},
    {'name': 'Agni', 'image': 'assets/agni.png'},
    {'name': 'Indra', 'image': 'assets/indra.png'},
    {'name': 'Surya', 'image': 'assets/surya.png'},
    {'name': 'Chandra', 'image': 'assets/chandra.png'},
    {'name': 'Yama', 'image': 'assets/yama.png'},
    {'name': 'Kubera', 'image': 'assets/kubera.png'},
    {'name': 'Varuna', 'image': 'assets/varuna.png'},
    {'name': 'Vayu', 'image': 'assets/vayu.png'},
    {'name': 'Shani', 'image': 'assets/shani.png'},
    {'name': 'Narada', 'image': 'assets/narada.png'},
    {'name': 'Dattatreya', 'image': 'assets/dattatreya.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a God'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16,),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 22.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31), // Rounded corners
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
              ),
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            flex: 10,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemCount: gods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChantingPage(
                          godName: gods[index]['name']!,
                          godImage: gods[index]['image']!,
                        ),
                      ),
                    );
                  },
                  child: GridTile(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Image.asset(gods[index]['image']!),
                        ),
                        SizedBox(height: 10),
                        Text(gods[index]['name']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChantingPage extends StatefulWidget {
  final String godName;
  final String godImage;

  ChantingPage({required this.godName, required this.godImage});

  @override
  _ChantingPageState createState() => _ChantingPageState();
}

class _ChantingPageState extends State<ChantingPage> {
  String selectedMantra = '';
  final TextEditingController customMantraController = TextEditingController();

  final Map<String, List<String>> godMantras = {
    'Krishna': ['Hare Krishna Hare Krishna', 'Krishna Mantra 2'],
    'Shiva': ['Shiva Mantra 1', 'Shiva Mantra 2'],
    'Ganesha': ['Ganesha Mantra 1', 'Ganesha Mantra 2'],
    'Vishnu': ['Vishnu Mantra 1', 'Vishnu Mantra 2'],
    'Lakshmi': ['Lakshmi Mantra 1', 'Lakshmi Mantra 2'],
    'Hanuman': ['Hanuman Mantra 1', 'Hanuman Mantra 2'],
    'Saraswati': ['Saraswati Mantra 1', 'Saraswati Mantra 2'],
    'Durga': ['Durga Mantra 1', 'Durga Mantra 2'],
    'Kali': ['Kali Mantra 1', 'Kali Mantra 2'],
    'Rama': ['Rama Mantra 1', 'Rama Mantra 2'],
    'Sita': ['Sita Mantra 1', 'Sita Mantra 2'],
    'Radha': ['Radha Mantra 1', 'Radha Mantra 2'],
    'Parvati': ['Parvati Mantra 1', 'Parvati Mantra 2'],
    'Brahma': ['Brahma Mantra 1', 'Brahma Mantra 2'],
    'Agni': ['Agni Mantra 1', 'Agni Mantra 2'],
    'Indra': ['Indra Mantra 1', 'Indra Mantra 2'],
    'Surya': ['Surya Mantra 1', 'Surya Mantra 2'],
    'Chandra': ['Chandra Mantra 1', 'Chandra Mantra 2'],
    'Yama': ['Yama Mantra 1', 'Yama Mantra 2'],
    'Kubera': ['Kubera Mantra 1', 'Kubera Mantra 2'],
    'Varuna': ['Varuna Mantra 1', 'Varuna Mantra 2'],
    'Vayu': ['Vayu Mantra 1', 'Vayu Mantra 2'],
    'Shani': ['Shani Mantra 1', 'Shani Mantra 2'],
    'Narada': ['Narada Mantra 1', 'Narada Mantra 2'],
    'Dattatreya': ['Dattatreya Mantra 1', 'Dattatreya Mantra 2'],
  };

  @override
  Widget build(BuildContext context) {
    List<String> mantras = godMantras[widget.godName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.godName} Chanting"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: Image.asset(widget.godImage),
            ),
            SizedBox(height: 20),
            Text(
              "Select a Mantra",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            for (var mantra in mantras)
              Card(
                child: ListTile(
                  title: Text(mantra),
                  onTap: () {
                    setState(() {
                      selectedMantra = mantra;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChantDisplayPage(
                          godName: widget.godName,
                          godImage: widget.godImage,
                          mantra: selectedMantra,
                        ),
                      ),
                    );
                  },
                ),
              ),
            Card(
              child: ListTile(
                title: Text("Custom Mantra"),
                onTap: () {
                  setState(() {
                    selectedMantra = "Custom";
                  });
                },
              ),
            ),
            if (selectedMantra == "Custom")
              TextFormField(
                controller: customMantraController,
                maxLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input your custom mantra",
                ),
              ),
            SizedBox(height: 20),
            if (selectedMantra == "Custom")
              ElevatedButton(
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
                          godName: widget.godName,
                          godImage: widget.godImage,
                          mantra: customMantraController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Start Chanting"),
              ),
          ],
        ),
      ),
    );
  }
}

class ChantDisplayPage extends StatefulWidget {
  final String godName;
  final String godImage;
  final String mantra;

  ChantDisplayPage({required this.godName, required this.godImage, required this.mantra});

  @override
  _ChantDisplayPageState createState() => _ChantDisplayPageState();
}

class _ChantDisplayPageState extends State<ChantDisplayPage> {
  int x = 0;
  int y = 0;
  bool isButtonDisabled = false; // To disable the button temporarily

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.godName} Chanting"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: Image.asset(widget.godImage),
            ),
            SizedBox(height: 20),
            Text(
              widget.mantra,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Current Count",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              x.toString(),
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total - 108",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 20),
                Text(
                  "Rounds - $y",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: xreset,
              child: Text(
                "Reset Count",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(40), // Adjust the padding to make it larger
                //primary: Colors.blue, // Background color
              ),
              onPressed: isButtonDisabled
                  ? null
                  : () {
                incrementCounter();
                ylogic();
                xlogic();
                disableButtonTemporarily();
              },
              child: Text(
                "Round",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    tooltip: "Tool",
                    child: Icon(Icons.feedback_outlined),
                    onPressed: () {
                      feedbackFunction(context);
                    },
                  ),
                   // Space between the button and the text

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  void incrementCounter() {
    setState(() {
      x++;
      print(x);
    });
  }

  void ylogic() {
    if (x == 108) {
      setState(() {
        y++;
        print(y);
      });
    }
  }

  void xlogic() {
    if (x == 108) {
      setState(() {
        x = 0;
        print(x);
      });
    }
  }

  void xreset() {
    setState(() {
      x = 0;
    });
  }

  void disableButtonTemporarily() {
    setState(() {
      isButtonDisabled = true;
    });
    Timer(Duration(seconds: 1), () {
      setState(() {
        isButtonDisabled = false;
      });
    });
  }
}
