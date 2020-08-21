import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container"),
          leading: Icon(Icons.check_box_outline_blank),
          backgroundColor: Colors.black,
          actions: <Widget>[Icon(Icons.access_alarm)],
        ),
        body: Center(
          child: Container(
            color: Colors.black,
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.yellow,
                Colors.red,
                Colors.indigo,
                Colors.teal
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
          ),
        ),
      ),
    );
  }
}
