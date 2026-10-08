import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack Widget')),
        body: Stack(
          children: <Widget>[
            // Kotak teal
            Positioned(
              top: 150,
              right: 50,
              child: Container(color: Colors.teal, width: 100.0, height: 100.0),
            ),

            // Kotak kuning
            Positioned(
              top: 150,
              right: 100,
              child: Container(color: Colors.yellow, width: 100.0, height: 100.0),
            ),

            // Kotak abu-abu
            Positioned(
              top: 200,
              right: 150,
              child: Container(color: Colors.grey, width: 50.0, height: 50.0),
            ),
          ],
        ),
      ),
    );
  }
}
