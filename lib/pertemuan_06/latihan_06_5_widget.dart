import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Drawer Widget')),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.mail, color: Colors.blue),
                title: Text('Inbox', style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                subtitle: Text('This is my sub title'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => print('1'),
              ),
              ListTile(
                leading: Icon(Icons.send, color: Colors.blue),
                title: Text('Sent Items', style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                subtitle: Text('This is my sub title'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => print('2'),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Profile', style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                subtitle: Text('This is my sub title'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => print('3'),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text('Settings', style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                subtitle: Text('This is my sub title'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => print('4'),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.blue),
                title: Text('Calendar', style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                subtitle: Text('This is my sub title'),
                trailing: Icon(Icons.arrow_right, color: Colors.blue),
                onTap: () => print('5'),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(child: Text('Welcome', style: TextStyle(fontSize: 20.0))),
        ),
      ),
    );
  }
}
