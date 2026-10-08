import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DepoInfoView extends StatelessWidget {
  const DepoInfoView({super.key});

  void _salinTeks(BuildContext context, String teks, String label) {
    Clipboard.setData(ClipboardData(text: teks));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label berhasil disalin ke clipboard!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
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
            // Info Box SelectableText
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.touch_app, color: primaryNavy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Teks informasi di bawah menggunakan widget SelectableText. '
                      'Tekan lama atau sorot teks untuk menyalin langsung ke clipboard.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 1: Identitas Gudang Utama
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.warehouse, color: primaryNavy, size: 24),
                        SizedBox(width: 8),
                        Text(
                          'Identitas Gudang Utama Depo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryNavy,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20),

                    _buildSelectableField(
                      context: context,
                      label: 'Nama Depo Logistik',
                      value: 'Depo Sentral Cakung Hub & Logistics Yard (PT CargoFlow Indonesia)',
                    ),
                    _buildSelectableField(
                      context: context,
                      label: 'Kode Identitas Depo',
                      value: 'DEPO-JKT-CENTRAL-01',
                    ),
                    _buildSelectableField(
                      context: context,
                      label: 'Alamat Fasilitas Pergudangan',
                      value: 'Jl. Cakung Cilincing Raya No. 88, Kawasan Berikat Marunda, Jakarta Utara, DKI Jakarta 14120',
                    ),
                    _buildSelectableField(
                      context: context,
                      label: 'Kapasitas & Luas Area',
                      value: 'Kapasitas Parkir: 200 Truk / Hari (Luas 45.000 m² dengan Cold Storage 8.000 m³)',
                    ),
                    _buildSelectableField(
                      context: context,
                      label: 'Jam Operasional & Shift',
                      value: '24 Jam Non-Stop (3 Shift Bergantian Petugas Lapangan)',
                    ),
                    _buildSelectableField(
                      context: context,
                      label: 'Kepala Operasional / Supervisor',
                      value: 'Bambang Sujatmiko, S.T. (Kontak: +62 812-9876-5432)',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: Kode Tracking API Pusat
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.api_outlined, color: primaryNavy, size: 24),
                        SizedBox(width: 8),
                        Text(
                          'Kode Tracking API Pusat (SelectableText)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryNavy,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kredensial dan endpoint server integrasi manifes pusat.',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    const Divider(height: 20),

                    _buildCodeField(
                      context: context,
                      label: 'Base URL Tracking Endpoint',
                      value: 'https://api.cargoflow.co.id/v2/manifest/tracking/live',
                    ),
                    _buildCodeField(
                      context: context,
                      label: 'Secret Access Token (Bearer)',
                      value: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.c2VydmljZV9zdGFmZl8wODEyNA.cfg_9921_x8a_live_token',
                    ),
                    _buildCodeField(
                      context: context,
                      label: 'Private Tracking Key ID',
                      value: 'CF-PROD-SEC-99214-X8A-CENTRAL',
                    ),
                    _buildCodeField(
                      context: context,
                      label: 'Webhook Dispatch URL',
                      value: 'https://webhook.cargoflow.co.id/dispatch/events/v2',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableField({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 3),
          SelectableText(
            value,
            style: const TextStyle(fontSize: 13, color: Color(0xFF1F2937), height: 1.35),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeField({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              InkWell(
                onTap: () => _salinTeks(context, value, label),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    children: [
                      Icon(Icons.copy, size: 14, color: Color(0xFF1E3A8A)),
                      SizedBox(width: 4),
                      Text(
                        'Salin',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SelectableText(
              value,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Color(0xFF6EE7B7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
