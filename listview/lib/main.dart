import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView(children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text("Tambah Data"),
              onPressed: () {
                setState(() {
                  widgets.add(Text(
                    "Data ke-" + counter.toString(),
                    style: TextStyle(fontSize: 30),
                  ));
                  counter++;
                });
              },
            ),
            RaisedButton(
              child: Text("Hapus Data"),
              onPressed: () {
                setState(() {
                  widgets.removeLast();
                });
              },
            )
          ],
        ),
        Column(
          children: widgets,
        )
      ]),
    ));
  }
}
