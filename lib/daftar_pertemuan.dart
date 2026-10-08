import 'package:flutter/material.dart';

import 'pertemuan_04/latihan_01_hello_widget.dart';
import 'pertemuan_08/screens/login_screen.dart';
import 'pertemuan_08/screens/main_navigation_screen.dart';

class Latihan {
  final String judul;
  final WidgetBuilder halaman;
  const Latihan(this.judul, this.halaman);
}

class Pertemuan {
  final int nomor;
  final String topik;
  final List<Latihan> latihan;
  const Pertemuan(this.nomor, this.topik, this.latihan);
}

final daftarPertemuan = <Pertemuan>[
  Pertemuan(4, 'Pengenalan Widget', [Latihan('Hello Widget', (_) => const HelloWidget())]),
  Pertemuan(8, 'UTS Praktikum - CargoFlow Logistics App', [
    Latihan('Login Staf Lapangan', (_) => const LoginScreen()),
    Latihan('Dasbor Logistik & Navigasi', (_) => const MainNavigationScreen()),
  ]),
];
