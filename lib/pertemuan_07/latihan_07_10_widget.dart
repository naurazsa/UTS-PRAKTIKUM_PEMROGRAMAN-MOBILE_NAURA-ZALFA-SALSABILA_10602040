import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyItem {
  bool isExpanded;
  final String header;
  final String body;

  MyItem({this.isExpanded = false, required this.header, required this.body});
}

class _MyAppState extends State<MyApp> {
  List<MyItem> _items = <MyItem>[
    MyItem(header: "Header 1", body: "Body 1"),
    MyItem(header: "Header 2", body: "Body 2"),
    MyItem(header: "Header 3", body: "Body 3"),
    MyItem(header: "Header 4", body: "Body 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expansion Panel")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _items[index].isExpanded = !_items[index].isExpanded;
                  });
                },
                children: _items.map((MyItem item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Text(item.header, style: TextStyle(fontSize: 30, color: Colors.blue));
                    },
                    body: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(item.body, style: TextStyle(fontSize: 20, color: Colors.blue)),
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
