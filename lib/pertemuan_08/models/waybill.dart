class Waybill {
  final String noResi;
  final String tanggal;
  final String armada;
  final String kategori;
  final double tonase;
  final String tujuan;
  final int totalBiaya;
  final String status;

  const Waybill({
    required this.noResi,
    required this.tanggal,
    required this.armada,
    required this.kategori,
    required this.tonase,
    required this.tujuan,
    required this.totalBiaya,
    required this.status,
  });

  static List<Waybill> getInitialWaybills() {
    return const [
      Waybill(
        noResi: 'CF-882101',
        tanggal: '2026-10-06',
        armada: 'Colt Diesel Double',
        kategori: 'General Cargo',
        tonase: 3.2,
        tujuan: 'Bandung Depo Barat',
        totalBiaya: 1450000,
        status: 'Selesai Bongkar',
      ),
      Waybill(
        noResi: 'CF-882102',
        tanggal: '2026-10-07',
        armada: 'Fuso Heavy Duty',
        kategori: 'Makanan Beku',
        tonase: 8.5,
        tujuan: 'Semarang Cold Storage',
        totalBiaya: 3100000,
        status: 'Dalam Perjalanan',
      ),
      Waybill(
        noResi: 'CF-882103',
        tanggal: '2026-10-08',
        armada: 'Tronton Wingbox',
        kategori: 'Alat Berat',
        tonase: 22.0,
        tujuan: 'Surabaya Tanjung Perak',
        totalBiaya: 6200000,
        status: 'Menunggu Muat',
      ),
      Waybill(
        noResi: 'CF-882104',
        tanggal: '2026-10-08',
        armada: 'Colt Diesel Double',
        kategori: 'General Cargo',
        tonase: 3.8,
        tujuan: 'Cirebon Hub Logistik',
        totalBiaya: 1680000,
        status: 'Tervalidasi',
      ),
    ];
  }
}
