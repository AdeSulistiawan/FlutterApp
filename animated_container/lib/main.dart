import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Container"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              color: Color.fromARGB(255, random.nextInt(255),
                  random.nextInt(255), random.nextInt(255)),
              width: 50.0 + random.nextInt(151),
              height: 50.0 + random.nextInt(151),
            ),
          ),
        ),
      ),
    );
  }
}
