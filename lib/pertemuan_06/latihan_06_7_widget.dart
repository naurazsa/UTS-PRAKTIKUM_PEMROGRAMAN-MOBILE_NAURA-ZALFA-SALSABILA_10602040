import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SelectableText Widget')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SelectableText(
            'These training courses have been developed and calibrated '
            'by a team of Android experts for some years. These courses empower '
            'application developers and IT-oriented employees with the skills to '
            'build advanced Android applications. After completing these courses, '
            'developers can sit for online exams which entitle them to become '
            'Certified Android Developers by Android ATC. Our exams are provided '
            'through Pearson VUE authorized testing centers worldwide.',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
