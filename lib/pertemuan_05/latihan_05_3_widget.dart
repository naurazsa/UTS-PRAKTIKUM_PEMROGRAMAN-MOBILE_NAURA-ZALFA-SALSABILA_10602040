import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Contoh pushReplacement', home: HalamanLogin());
  }
}

class HalamanLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            // Navigasi dengan mengganti halaman login ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HalamanUtama()),
            );
          },
        ),
      ),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Utama')),
      body: Center(child: Text('Selamat datang di Halaman Utama!')),
    );
  }
}
