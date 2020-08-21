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
          title: Text("Image Widget"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: 200,
                  height: 200,
                  color: Colors.black,
                  child: Image(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQeg8pKMf3Y0KdihOf651KTN44fNdXMwTIr3Q&usqp=CAU"),
                    fit: BoxFit.contain,
                  )),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Image.asset(
                  "images/tires.JPG",
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
