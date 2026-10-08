import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab View'),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.blue,
              indicatorColor: Colors.red,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
                fontSize: 20.0,
              ),
              tabs: [
                Tab(text: "Home"),
                Tab(text: "Orders"),
                Tab(text: "Login"),
              ],
            ),
          ),

          body: TabBarView(
            children: [
              Center(child: Text("Ini halaman Home")),
              Center(child: Text("Ini halaman Orders")),
              Center(child: Text("Ini halaman Login")),
            ],
          ),
        ),
      ),
    );
  }
}
