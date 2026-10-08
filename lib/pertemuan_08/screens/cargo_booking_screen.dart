import 'package:flutter/material.dart';

import '../models/armada.dart';
import '../models/waybill.dart';

class CargoBookingScreen extends StatefulWidget {
  final Armada armada;

  const CargoBookingScreen({super.key, required this.armada});

  @override
  State<CargoBookingScreen> createState() => _CargoBookingScreenState();
}

class _CargoBookingScreenState extends State<CargoBookingScreen> {
  // 1. Kategori Muatan (Radio Group)
  String _kategoriMuatan = 'General Cargo';
  final List<String> _daftarKategori = ['General Cargo', 'Makanan Beku/Perishable', 'Alat Berat'];

  // 2. Proteksi Pengiriman (Checkbox Group)
  bool _asuransiBarangRusak = false;
  bool _jasaForklift = false;
  bool _pengawalanPrioritas = false;

  // 3. Jadwal Pengambilan (Date & Time Picker)
  DateTime? _tanggalJemput;
  TimeOfDay? _jamBerangkat;

  // 4. Pengaturan Muatan (Slider & Switch)
  late double _tonase;
  bool _reeferActive = false;

  @override
  void initState() {
    super.initState();
    _tonase = widget.armada.minTonase;
  }

  // Helper formatting rupiah
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

  int _hitungTotalBiaya() {
    final int tarifArmada = (_tonase * widget.armada.tarifPerTon).round();
    final int tarifAsuransi = _asuransiBarangRusak ? 250000 : 0;
    final int tarifForklift = _jasaForklift ? 350000 : 0;
    final int tarifPengawalan = _pengawalanPrioritas ? 500000 : 0;
    final int tarifReefer = _reeferActive ? 400000 : 0;

    return tarifArmada + tarifAsuransi + tarifForklift + tarifPengawalan + tarifReefer;
  }

  Future<void> _pilihTanggal() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _tanggalJemput ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 60)),
      helpText: 'PILIH TANGGAL PENJEMPUTAN BARANG',
      confirmText: 'PILIH',
      cancelText: 'BATAL',
    );

    if (pickedDate != null) {
      setState(() {
        _tanggalJemput = pickedDate;
      });
    }
  }

  Future<void> _pilihJam() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _jamBerangkat ?? const TimeOfDay(hour: 8, minute: 30),
      helpText: 'ESTIMASI JAM KEBERANGKATAN TRUK',
      confirmText: 'PILIH',
      cancelText: 'BATAL',
    );

    if (pickedTime != null) {
      setState(() {
        _jamBerangkat = pickedTime;
      });
    }
  }

  void _tampilkanModalBiaya() {
    // Validasi pemilihan jadwal
    if (_tanggalJemput == null || _jamBerangkat == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap lengkapi tanggal penjemputan dan jam keberangkatan!'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final totalBiaya = _hitungTotalBiaya();
    final String tanggalFormatted =
        '${_tanggalJemput!.year}-${_tanggalJemput!.month.toString().padLeft(2, '0')}-${_tanggalJemput!.day.toString().padLeft(2, '0')}';
    final String jamFormatted =
        '${_jamBerangkat!.hour.toString().padLeft(2, '0')}:${_jamBerangkat!.minute.toString().padLeft(2, '0')} WIB';

    // Munculkan rincian biaya surat jalan menggunakan showModalBottomSheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.receipt_long, color: Color(0xFF1E3A8A), size: 26),
                  SizedBox(width: 8),
                  Text(
                    'Rincian Biaya Surat Jalan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),

              // Rincian Item
              _buildRincianRow('Tipe Armada', widget.armada.nama),
              _buildRincianRow('Kategori Muatan', _kategoriMuatan),
              _buildRincianRow('Estimasi Tonase', '${_tonase.toStringAsFixed(1)} Ton'),
              _buildRincianRow('Jadwal Jemput', tanggalFormatted),
              _buildRincianRow('Jam Keberangkatan', jamFormatted),
              _buildRincianRow('Mesin Reefer', _reeferActive ? 'Aktif (+Rp 400.000)' : 'Nonaktif'),
              _buildRincianRow(
                'Proteksi Tambahan',
                [
                  if (_asuransiBarangRusak) 'Asuransi',
                  if (_jasaForklift) 'Forklift',
                  if (_pengawalanPrioritas) 'Pengawalan',
                  if (!_asuransiBarangRusak && !_jasaForklift && !_pengawalanPrioritas)
                    'Tanpa Proteksi Tambahan',
                ].join(', '),
              ),

              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Estimasi Biaya:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _formatRupiah(totalBiaya),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Tombol Konfirmasi Akhir (Memicu AlertDialog)
              ElevatedButton.icon(
                onPressed: () {
                  _tampilkanDialogKonfirmasi(bottomSheetContext, tanggalFormatted, totalBiaya);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.check_circle_outline),
                label: const Text(
                  'Konfirmasi & Terbitkan Surat Jalan',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRincianRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void _tampilkanDialogKonfirmasi(
    BuildContext bottomSheetContext,
    String tanggalFormatted,
    int totalBiaya,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(Icons.verified_outlined, color: Color(0xFF1E3A8A), size: 46),
          title: const Text(
            'Terbitkan Surat Jalan?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Apakah seluruh manifes kargo ${widget.armada.nama} sebesar '
            '${_tonase.toStringAsFixed(1)} Ton sudah diverifikasi?\n\n'
            'Surat Jalan dan Nomor Resi Resmi akan segera diproses masuk sistem logistik.',
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Batal')),
            ElevatedButton(
              onPressed: () {
                // Generate nomor resi
                final String resiNumber =
                    'CF-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

                final waybillBaru = Waybill(
                  noResi: resiNumber,
                  tanggal: tanggalFormatted,
                  armada: widget.armada.nama,
                  kategori: _kategoriMuatan,
                  tonase: _tonase,
                  tujuan: 'Depo Distribusi Utama',
                  totalBiaya: totalBiaya,
                  status: 'Tervalidasi',
                );

                // Tutup Dialog
                Navigator.pop(dialogContext);
                // Tutup BottomSheet
                Navigator.pop(bottomSheetContext);
                // Tutup CargoBookingScreen dan kirim data status resi sukses (returning data)
                Navigator.pop(context, waybillBaru);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                foregroundColor: Colors.white,
              ),
              child: const Text('Setujui & Terbitkan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryNavy = Color(0xFF1E3A8A);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Formulir Booking Kargo'),
        backgroundColor: primaryNavy,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Info Armada Terpilih (Passing Data)
            Card(
              elevation: 2,
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.blue.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    const Icon(Icons.local_shipping, size: 40, color: primaryNavy),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.armada.nama,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryNavy,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${widget.armada.tipe} • ${widget.armada.kapasitas}',
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
                          ),
                          Text(
                            'Tarif Dasar: ${_formatRupiah(widget.armada.tarifPerTon)} / Ton',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 1. Kategori Muatan (RadioButtonGroup / RadioGroup)
            _buildSectionCard(
              title: '1. Kategori Muatan (Single Choice)',
              subtitle: 'Pilih salah satu klasifikasi barang yang akan dikirim',
              icon: Icons.category,
              child: RadioGroup<String>(
                groupValue: _kategoriMuatan,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _kategoriMuatan = value;
                      if (value == 'Makanan Beku/Perishable') {
                        _reeferActive = true;
                      }
                    });
                  }
                },
                child: Column(
                  children: _daftarKategori.map((kategori) {
                    return RadioListTile<String>(
                      title: Text(kategori, style: const TextStyle(fontSize: 14)),
                      value: kategori,
                      contentPadding: EdgeInsets.zero,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Proteksi Pengiriman (CheckboxGroup)
            _buildSectionCard(
              title: '2. Proteksi Pengiriman (Checkbox)',
              subtitle: 'Pilih opsi layanan proteksi tambahan untuk kargo',
              icon: Icons.shield_outlined,
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Asuransi Barang Rusak (+Rp 250.000)'),
                    subtitle: const Text('Kompensasi penuh kerusakan di jalan'),
                    value: _asuransiBarangRusak,
                    activeColor: primaryNavy,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() {
                        _asuransiBarangRusak = val ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Jasa Forklift Muat (+Rp 350.000)'),
                    subtitle: const Text('Alat bantu loading pallet berat'),
                    value: _jasaForklift,
                    activeColor: primaryNavy,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() {
                        _jasaForklift = val ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Pengawalan Prioritas (+Rp 500.000)'),
                    subtitle: const Text('Pengawalan khusus jalur express'),
                    value: _pengawalanPrioritas,
                    activeColor: primaryNavy,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() {
                        _pengawalanPrioritas = val ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 3. Jadwal Pengambilan (DatePicker & TimePicker)
            _buildSectionCard(
              title: '3. Jadwal Pengambilan',
              subtitle: 'Tentukan tanggal penjemputan dan estimasi jam keberangkatan',
              icon: Icons.calendar_month,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.date_range, color: primaryNavy),
                    title: Text(
                      _tanggalJemput == null
                          ? 'Belum memilih tanggal penjemputan'
                          : 'Tanggal: ${_tanggalJemput!.year}-${_tanggalJemput!.month.toString().padLeft(2, '0')}-${_tanggalJemput!.day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontWeight: _tanggalJemput != null ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    trailing: OutlinedButton(
                      onPressed: _pilihTanggal,
                      child: const Text('Pilih Tanggal'),
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.access_time, color: primaryNavy),
                    title: Text(
                      _jamBerangkat == null
                          ? 'Belum memilih jam keberangkatan'
                          : 'Jam: ${_jamBerangkat!.hour.toString().padLeft(2, '0')}:${_jamBerangkat!.minute.toString().padLeft(2, '0')} WIB',
                      style: TextStyle(
                        fontWeight: _jamBerangkat != null ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    trailing: OutlinedButton(onPressed: _pilihJam, child: const Text('Pilih Jam')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 4. Pengaturan Muatan (Slider & Switch)
            _buildSectionCard(
              title: '4. Pengaturan Muatan',
              subtitle: 'Penentuan tonase estimasi dan mesin pendingin reefer',
              icon: Icons.tune,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Estimasi Tonase Muatan:',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: primaryNavy,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${_tonase.toStringAsFixed(1)} Ton',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _tonase,
                    min: widget.armada.minTonase,
                    max: widget.armada.maxTonase,
                    divisions: ((widget.armada.maxTonase - widget.armada.minTonase) * 2)
                        .round()
                        .clamp(1, 100),
                    label: '${_tonase.toStringAsFixed(1)} Ton',
                    activeColor: primaryNavy,
                    onChanged: (val) {
                      setState(() {
                        _tonase = val;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Min: ${widget.armada.minTonase} Ton',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                      Text(
                        'Maks: ${widget.armada.maxTonase} Ton',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const Divider(height: 24),

                  // Switch Reefer Container
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Mesin Pendingin (Reefer Container)'),
                    subtitle: const Text(
                      'Kontrol pendingin kompartemen untuk muatan beku (+Rp 400.000)',
                    ),
                    value: _reeferActive,
                    activeTrackColor: primaryNavy,
                    onChanged: (val) {
                      setState(() {
                        _reeferActive = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Hitung Biaya Logistik (showModalBottomSheet)
            ElevatedButton.icon(
              onPressed: _tampilkanModalBiaya,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryNavy,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
              ),
              icon: const Icon(Icons.calculate_outlined),
              label: const Text(
                'Hitung Biaya Logistik',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF1E3A8A), size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            const Divider(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}
