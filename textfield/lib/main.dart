import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "Nilai Awal");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Text Field")),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue[50],
                    filled: true,
                    icon: Icon(Icons.adb),
                    prefixIcon: Icon(Icons.list),
                    prefixText: "Nama: ",
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    suffix: Icon(Icons.shuffle),
                    labelText: "Nama Lengkap",
                    hintText: "Hint Text",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                maxLength: 10,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
              ),
              Text(controller.text)
            ],
          ),
        ),
      ),
    );
  }
}
