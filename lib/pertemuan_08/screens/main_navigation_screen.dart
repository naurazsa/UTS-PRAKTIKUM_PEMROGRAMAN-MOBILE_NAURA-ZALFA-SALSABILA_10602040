import 'package:flutter/material.dart';

import '../models/armada.dart';
import '../models/waybill.dart';
import '../widgets/depo_info_view.dart';
import '../widgets/manifes_muatan_view.dart';
import '../widgets/rekap_resi_view.dart';
import 'cargo_booking_screen.dart';
import 'login_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final List<Waybill> _waybillList = Waybill.getInitialWaybills();

  // Handler saat tombol 'Pilih Armada' ditekan pada tab Armada Tersedia
  Future<void> _handlePilihArmada(Armada armada) async {
    // Navigasi ke CargoBookingScreen sambil membawa data tipe armada yang dipilih (passing data)
    final waybillBaru = await Navigator.push<Waybill>(
      context,
      MaterialPageRoute(builder: (context) => CargoBookingScreen(armada: armada)),
    );

    // Layar utama menerima respon balikan (returning data) dan menampilkan SnackBar
    if (waybillBaru != null && mounted) {
      setState(() {
        _waybillList.insert(0, waybillBaru);
        _currentIndex = 1; // Otomatis arahkan ke tab Rekap Resi
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Surat Jalan ${waybillBaru.noResi} berhasil diterbitkan '
                  'untuk ${waybillBaru.armada} (${waybillBaru.tonase.toStringAsFixed(1)} Ton)!',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF15803D), // Hijau sukses
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryNavy = Color(0xFF1E3A8A);

    final List<Widget> pages = [
      ManifesMuatanView(onPilihArmada: _handlePilihArmada),
      RekapResiView(waybills: _waybillList),
      const DepoInfoView(),
    ];

    final List<String> titles = [
      'Manifes Muatan',
      'Rekapitulasi Resi Surat Jalan',
      'Informasi Depo & API Pusat',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        backgroundColor: primaryNavy,
        foregroundColor: Colors.white,
        elevation: 2,
      ),

      // Menu Samping Drawer menampilkan identitas armada & navigasi cepat
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader menampilkan identitas armada
            DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryNavy,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500&auto=format&fit=crop&q=60',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.local_shipping, color: primaryNavy, size: 28),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'CargoFlow Logistics',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'ID Staf: petugas (Depo Sentral Cakung)',
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 12),
                  ),
                ],
              ),
            ),

            // Navigasi cepat menggunakan ListTile
            ListTile(
              leading: const Icon(Icons.local_shipping, color: primaryNavy),
              title: const Text('Manifes Muatan'),
              subtitle: const Text('Armada & Syarat Muatan'),
              selected: _currentIndex == 0,
              onTap: () {
                setState(() => _currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: primaryNavy),
              title: const Text('Rekap Resi'),
              subtitle: const Text('Tabel Matriks Surat Jalan'),
              selected: _currentIndex == 1,
              onTap: () {
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.warehouse, color: primaryNavy),
              title: const Text('Informasi Depo'),
              subtitle: const Text('Data Gudang & API Tracking'),
              selected: _currentIndex == 2,
              onTap: () {
                setState(() => _currentIndex = 2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar Akun', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),

      // Konten Layar Aktif
      body: IndexedStack(index: _currentIndex, children: pages),

      // Navigasi Bawah BottomNavigationBar dengan 3 Menu Utama
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: primaryNavy,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Manifes Muatan'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Rekap Resi'),
          BottomNavigationBarItem(icon: Icon(Icons.warehouse), label: 'Informasi Depo'),
        ],
      ),
    );
  }
}
