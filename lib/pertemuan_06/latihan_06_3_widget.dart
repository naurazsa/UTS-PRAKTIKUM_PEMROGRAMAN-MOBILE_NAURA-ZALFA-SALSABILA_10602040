import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListTile Widget')),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Main Title'),
              subtitle: Text('This is my sub title'),
              trailing: Icon(Icons.shopping_cart),
              onTap: () => print('onTap Action'),
              onLongPress: () => print('On Long Press Action'),
              dense: false,
              selected: true,
              enabled: true,
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Main Title'),
              subtitle: Text('This is my sub title'),
              trailing: Icon(Icons.share),
              onTap: () => print('onTap Action'),
              onLongPress: () => print('On Long Press Action'),
              dense: false,
              selected: true,
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
