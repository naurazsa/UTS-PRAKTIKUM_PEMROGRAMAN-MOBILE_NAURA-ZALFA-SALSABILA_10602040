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
            // Kiri atas
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('top: 0,\nleft: 0'),
              ),
            ),

            // Kanan atas
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('top: 0,\nright: 0'),
              ),
            ),

            // Tengah kanan
            Positioned(
              top: 150,
              right: 50,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('top: 150,\nright: 50'),
              ),
            ),

            // Kiri bawah-tengah
            Positioned(
              bottom: 200,
              left: 0,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('bottom: 200,\nleft: 0'),
              ),
            ),

            // Kanan bawah-tengah
            Positioned(
              bottom: 200,
              left: 200,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('bottom: 200,\nleft: 200'),
              ),
            ),

            // Kiri bawah
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('bottom: 0,\nleft: 0'),
              ),
            ),

            // Kanan bawah
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.teal,
                width: 60.0,
                height: 40.0,
                child: Text('bottom: 0,\nright: 0'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
