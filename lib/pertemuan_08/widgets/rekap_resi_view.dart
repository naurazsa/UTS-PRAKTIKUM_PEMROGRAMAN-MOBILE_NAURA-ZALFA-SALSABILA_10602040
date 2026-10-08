import 'package:flutter/material.dart';

import '../models/waybill.dart';

class RekapResiView extends StatelessWidget {
  final List<Waybill> waybills;

  const RekapResiView({super.key, required this.waybills});

  String _formatRupiah(int nominal) {
    final str = nominal.toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }
    return 'Rp ${buffer.toString().split('').reversed.join('')}';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Tervalidasi':
        return Colors.green.shade700;
      case 'Dalam Perjalanan':
        return Colors.blue.shade700;
      case 'Menunggu Muat':
        return Colors.orange.shade800;
      case 'Selesai Bongkar':
        return Colors.teal.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryNavy = Color(0xFF1E3A8A);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Statistik Ringkas
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    title: 'Total Resi',
                    value: '${waybills.length}',
                    color: primaryNavy,
                    icon: Icons.assignment_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    title: 'Tervalidasi',
                    value: '${waybills.where((w) => w.status == 'Tervalidasi').length}',
                    color: Colors.green.shade700,
                    icon: Icons.check_circle_outline,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    title: 'On-Route',
                    value: '${waybills.where((w) => w.status == 'Dalam Perjalanan').length}',
                    color: Colors.blue.shade700,
                    icon: Icons.directions_boat_filled_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Header Tabel
            Row(
              children: [
                const Icon(Icons.table_chart, color: primaryNavy, size: 22),
                const SizedBox(width: 8),
                const Text(
                  'Matriks Rekapitulasi Surat Jalan (DataTable)',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Geser secara horizontal jika tampilan kolom terpotong pada layar.',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 12),

            // DataTable dalam Card Scrollable
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(Colors.blue.shade50),
                    horizontalMargin: 14,
                    columnSpacing: 18,
                    headingTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryNavy,
                      fontSize: 13,
                    ),
                    columns: const <DataColumn>[
                      DataColumn(label: Text('No. Resi')),
                      DataColumn(label: Text('Tanggal')),
                      DataColumn(label: Text('Armada')),
                      DataColumn(label: Text('Kategori')),
                      DataColumn(label: Text('Tonase')),
                      DataColumn(label: Text('Tujuan')),
                      DataColumn(label: Text('Biaya')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: waybills.map<DataRow>((w) {
                      final statusColor = _getStatusColor(w.status);

                      return DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              w.noResi,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryNavy,
                              ),
                            ),
                          ),
                          DataCell(Text(w.tanggal)),
                          DataCell(Text(w.armada)),
                          DataCell(Text(w.kategori)),
                          DataCell(Text('${w.tonase.toStringAsFixed(1)} T')),
                          DataCell(Text(w.tujuan)),
                          DataCell(Text(_formatRupiah(w.totalBiaya))),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: statusColor.withValues(alpha: 0.5)),
                              ),
                              child: Text(
                                w.status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
