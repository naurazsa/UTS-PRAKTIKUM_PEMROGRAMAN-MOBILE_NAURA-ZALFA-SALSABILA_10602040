import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Widget')),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Main Title'),
              subtitle: Text('This is my sub title'),
              trailing: Icon(Icons.shopping_cart),
              onTap: () => print('onTap Action'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Main Title'),
              subtitle: Text('This is my sub title'),
              trailing: Icon(Icons.shopping_cart),
              onTap: () => print('onTap Action'),
              selected: true,
            ),

            // Gambar sofa dari URL
            Image.network(
              'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800',
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
