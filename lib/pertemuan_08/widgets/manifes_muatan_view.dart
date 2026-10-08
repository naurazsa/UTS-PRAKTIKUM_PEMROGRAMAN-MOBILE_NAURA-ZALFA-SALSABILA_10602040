import 'package:flutter/material.dart';

import '../models/armada.dart';
import '../models/hazard_item.dart';

class ManifesMuatanView extends StatefulWidget {
  final Function(Armada armada) onPilihArmada;

  const ManifesMuatanView({super.key, required this.onPilihArmada});

  @override
  State<ManifesMuatanView> createState() => _ManifesMuatanViewState();
}

class _ManifesMuatanViewState extends State<ManifesMuatanView> {
  final List<Armada> _daftarArmada = Armada.getSampleArmada();
  final List<HazardItem> _daftarHazard = HazardItem.getSampleHazards();

  @override
  Widget build(BuildContext context) {
    const primaryNavy = Color(0xFF1E3A8A);

    // Navigasi tab atas (DefaultTabController, TabBar, dan TabBarView)
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            color: Colors.white,
            child: const TabBar(
              labelColor: primaryNavy,
              unselectedLabelColor: Colors.grey,
              indicatorColor: primaryNavy,
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(Icons.local_shipping_outlined), text: 'Armada Tersedia'),
                Tab(icon: Icon(Icons.warning_amber_rounded), text: 'Syarat Muatan Berbahaya'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Armada Tersedia
            _buildTabArmadaTersedia(primaryNavy),

            // Tab 2: Syarat Muatan Berbahaya
            _buildTabMuatanBerbahaya(primaryNavy),
          ],
        ),
      ),
    );
  }

  // TAB 1: Armada Tersedia (ListView.builder, ListTile, Stack, Positioned)
  Widget _buildTabArmadaTersedia(Color primaryNavy) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      itemCount: _daftarArmada.length,
      itemBuilder: (context, index) {
        final armada = _daftarArmada[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 14),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto armada ditumpuk dengan lencana kapasitas (Stack dan Positioned)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        armada.imageUrl,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 90,
                          height: 90,
                          color: Colors.blueGrey.shade100,
                          child: const Icon(Icons.local_shipping, size: 40, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          armada.kapasitas,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 14),

                // Info Armada & Tombol Aksi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        armada.nama,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          armada.tipe,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        armada.deskripsi,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 10),

                      // Tombol Pilih Armada
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () => widget.onPilihArmada(armada),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryNavy,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          icon: const Icon(Icons.check_circle, size: 16),
                          label: const Text(
                            'Pilih Armada',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // TAB 2: Syarat Muatan Berbahaya (ExpansionPanelList)
  Widget _buildTabMuatanBerbahaya(Color primaryNavy) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.amber.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.amber, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Panduan Penanganan Material Berisiko (Hazardous Materials)\n'
                    'Ketuk baris untuk membuka instruksi keselamatan.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // ExpansionPanelList
          ExpansionPanelList(
            elevation: 2,
            expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 4),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _daftarHazard[index].isExpanded = isExpanded;
              });
            },
            children: _daftarHazard.map<ExpansionPanel>((HazardItem item) {
              return ExpansionPanel(
                isExpanded: item.isExpanded,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber.shade100,
                      child: Text(item.simbolIcon, style: const TextStyle(fontSize: 18)),
                    ),
                    title: Text(
                      item.kelas,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                    subtitle: Text(
                      item.judul,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(height: 1),
                      const SizedBox(height: 10),
                      Text(
                        item.deskripsi,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Instruksi Operasional Wajib:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ...item.instruksiKhusus.map((instruksi) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '• ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E3A8A),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  instruksi,
                                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
