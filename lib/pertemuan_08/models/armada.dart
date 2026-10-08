class Armada {
  final String id;
  final String nama;
  final String tipe;
  final String kapasitas;
  final double minTonase;
  final double maxTonase;
  final int tarifPerTon;
  final String imageUrl;
  final String deskripsi;

  const Armada({
    required this.id,
    required this.nama,
    required this.tipe,
    required this.kapasitas,
    required this.minTonase,
    required this.maxTonase,
    required this.tarifPerTon,
    required this.imageUrl,
    required this.deskripsi,
  });

  static List<Armada> getSampleArmada() {
    return const [
      Armada(
        id: 'ARM-01',
        nama: 'Colt Diesel Double (CDD)',
        tipe: 'Truk Ringan 6 Roda',
        kapasitas: 'Kapasitas 4.0 Ton',
        minTonase: 0.5,
        maxTonase: 4.0,
        tarifPerTon: 350000,
        imageUrl: 'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=500&auto=format&fit=crop&q=60',
        deskripsi: 'Armada lincah untuk pengiriman antar-kota jarak menengah dengan volume muatan hingga 12 CBM.',
      ),
      Armada(
        id: 'ARM-02',
        nama: 'Mitsubishi Fuso Fighter',
        tipe: 'Truk Medium Heavy',
        kapasitas: 'Kapasitas 10.0 Ton',
        minTonase: 1.0,
        maxTonase: 10.0,
        tarifPerTon: 280000,
        imageUrl: 'https://images.unsplash.com/photo-1519003722824-194d4455a60c?w=500&auto=format&fit=crop&q=60',
        deskripsi: 'Armada tangguh spesialis muatan industri pabrik dan logistik antar-provinsi hingga 30 CBM.',
      ),
      Armada(
        id: 'ARM-03',
        nama: 'Hino Tronton Wingbox',
        tipe: 'Truk Heavy Duty',
        kapasitas: 'Kapasitas 25.0 Ton',
        minTonase: 2.0,
        maxTonase: 25.0,
        tarifPerTon: 220000,
        imageUrl: 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500&auto=format&fit=crop&q=60',
        deskripsi: 'Armada kapasitas besar dengan pintu sayap otomatis, ideal untuk distribusi kargo rantai pasok masif.',
      ),
    ];
  }
}
