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
        title: Text("Stack & Align"),
      ),
      body: Stack(
        children: <Widget>[
          //Background
          Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      color: Colors.white,
                    )),
                    Flexible(
                        child: Container(
                      color: Colors.black12,
                    )),
                  ],
                ),
                flex: 1,
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      color: Colors.black12,
                    )),
                    Flexible(
                        child: Container(
                      color: Colors.white,
                    )),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
          ListView(
            children: <Widget>[
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Ini text dilapisan kedua",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Align(
            alignment: Alignment(0, 0.75),
            child: RaisedButton(
              color: Colors.blueAccent[700],
              onPressed: () {},
              child: Text(
                "Raise Button on Stack",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
          //ListView
          //Button
        ],
      ),
    ));
  }
}
