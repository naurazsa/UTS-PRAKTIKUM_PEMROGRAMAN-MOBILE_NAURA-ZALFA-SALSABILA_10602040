import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PersistentBottomSheetController? _controller;

  void _showBottomSheet(BuildContext context) {
    if (_controller == null) {
      _controller = Scaffold.of(context).showBottomSheet(
        (context) => Container(
          height: 200,
          color: Colors.grey[200],
          alignment: Alignment.center,
          child: Text(
            "This is a Persistent Bottom Sheet",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      );

      _controller!.closed.then((value) {
        _controller = null;
      });
    } else {
      Navigator.pop(context);
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Persistent Bottom Sheet")),
      body: Builder(
        builder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      "Bottom Sheet",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                  ),
                ),

                SizedBox(height: 20.0),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      "Test Button",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Test Button Pressed!")));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
