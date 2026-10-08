import 'package:flutter/material.dart';

import 'daftar_pertemuan.dart';

void main() => runApp(const MenuApp());

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemrograman Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pertemuan')),
      body: ListView(
        children: [
          for (final p in daftarPertemuan)
            ExpansionTile(
              title: Text('Pertemuan ${p.nomor.toString().padLeft(2, '0')}'),
              subtitle: Text(p.topik),
              children: [
                for (final l in p.latihan)
                  ListTile(
                    title: Text(l.judul),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: l.halaman)),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
