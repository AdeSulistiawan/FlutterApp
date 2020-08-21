import 'package:clone_gojek/pages/account.dart';
import 'package:clone_gojek/pages/chat.dart';
import 'package:clone_gojek/pages/home.dart';
import 'package:clone_gojek/pages/inbox.dart';
import 'package:clone_gojek/pages/order.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojek',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _layoutPage = [
    Home(),
    Order(),
    Chat(),
    Inbox(),
    Account(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'images/home.png',
                  scale: 2.5,
                ),
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'images/orders.png',
                  scale: 2.5,
                ),
              ),
              title: Text('Order')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'images/chat.png',
                  scale: 2.5,
                ),
              ),
              title: Text('Chat')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'images/inbox.png',
                  scale: 2.5,
                ),
              ),
              title: Text('Inbox')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'images/account.png',
                  scale: 2.5,
                ),
              ),
              title: Text('Account')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
