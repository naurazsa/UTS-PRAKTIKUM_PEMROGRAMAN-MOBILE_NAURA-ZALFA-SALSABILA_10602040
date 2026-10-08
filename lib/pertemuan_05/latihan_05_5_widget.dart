import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const HalamanUtama());
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scale Transition')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const HalamanBaru(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(
                    scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                    child: child,
                  );
                },
              ),
            );
          },
          child: const Text('Buka Halaman'),
        ),
      ),
    );
  }
}

class HalamanBaru extends StatelessWidget {
  const HalamanBaru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Baru')),
      body: const Center(
        child: Text('Berhasil menggunakan Scale Transition!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
