import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.cyan[300],
          child: ListView(
            children: <Widget>[
              buildCard(Icons.airplanemode_active, "Airplane Mode"),
              buildCard(Icons.access_alarm, "Alarm"),
              buildCard(Icons.satellite, "Satellite"),
              buildCard(Icons.accessibility_new, "People"),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(IconData iconData, String text) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(iconData),
          ),
          Text(text)
        ],
      ),
    );
  }
}
