import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up, color: Colors.white),
          SizedBox(width: 10.0),
          Text('Hey, I am a SnackBar!', style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );

    // Menggunakan ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Snack Bar Widget')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Text(
            'Notification Message',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: _showSnackBar,
        ),
      ),
    );
  }
}
