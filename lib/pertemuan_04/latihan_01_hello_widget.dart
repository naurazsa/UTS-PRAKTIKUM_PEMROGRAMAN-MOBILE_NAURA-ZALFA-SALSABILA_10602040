import 'package:flutter/material.dart';

// Jalankan file ini saja:
// flutter run -d chrome -t lib/pertemuan_04/latihan_01_hello_widget.dart
void main() => runApp(const MaterialApp(home: HelloWidget()));

class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('P04 - Hello Widget')),
      body: const Center(child: Text('Halo dari Pertemuan 4!', style: TextStyle(fontSize: 24))),
    );
  }
}
