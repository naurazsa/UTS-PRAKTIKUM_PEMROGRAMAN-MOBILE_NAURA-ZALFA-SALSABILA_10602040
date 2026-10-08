import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Screen0());
  }
}

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 0')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final hasil = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Screen1()),
            );

            if (hasil != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status: $hasil')));
            }
          },
          child: const Text('Buka Screen 1'),
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            String status = 'Data berhasil dikembalikan';

            Navigator.pop(context, status);
          },
          child: const Text('Kembalikan Data'),
        ),
      ),
    );
  }
}
