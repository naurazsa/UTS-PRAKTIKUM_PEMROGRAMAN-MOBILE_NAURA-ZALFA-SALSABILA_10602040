class HazardItem {
  final String id;
  final String kelas;
  final String judul;
  final String deskripsi;
  final String simbolIcon;
  final List<String> instruksiKhusus;
  bool isExpanded;

  HazardItem({
    required this.id,
    required this.kelas,
    required this.judul,
    required this.deskripsi,
    required this.simbolIcon,
    required this.instruksiKhusus,
    this.isExpanded = false,
  });

  static List<HazardItem> getSampleHazards() {
    return [
      HazardItem(
        id: 'HAZ-01',
        kelas: 'Kelas 2: Gas Bertekanan',
        judul: 'Tabung Gas Terkompresi & Cryogenic',
        deskripsi: 'Muatan tabung bertekanan tinggi memerlukan ventilasi stabil dan penguncian posisi vertikal agar tidak berbenturan.',
        simbolIcon: '🔥',
        instruksiKhusus: [
          'Gunakan rantai pengaman silinder ganda.',
          'Dilarang merokok atau menyalakan pemantik api di radius 15 meter.',
          'Pastikan katup utama memiliki penutup pelindung (valve cap).',
          'Sediakan APAR powder minimal 6 kg di kabin truk.',
        ],
      ),
      HazardItem(
        id: 'HAZ-02',
        kelas: 'Kelas 3: Cairan Mudah Terbakar',
        judul: 'Bahan Kimia Pelarut, Thinner & Alkohol Industri',
        deskripsi: 'Cairan dengan titik nyala rendah (< 60°C) yang mudah menguap dan berisiko memicu kebakaran saat gesekan berlebih.',
        simbolIcon: '⚠️',
        instruksiKhusus: [
          'Gunakan drum baja bersegel standar UN Approved.',
          'Pasang sistem grounding statis selama proses bongkar-muat.',
          'Suhu kompartemen muatan tidak boleh melampaui 38°C.',
          'Wajib membawa lembar keselamatan bahan (MSDS).',
        ],
      ),
      HazardItem(
        id: 'HAZ-03',
        kelas: 'Kelas 6: Zat Beracun & Infeksius',
        judul: 'Pestisida Konsentrat & Limbah Medis B3',
        deskripsi: 'Material berbahaya yang dapat menyebabkan keracunan akut atau pencemaran biologis apabila kemasan bocor.',
        simbolIcon: '☣️',
        instruksiKhusus: [
          'Kemasan wajib kedap udara dengan double liner plastik tebal.',
          'Dilarang keras dicampur dengan komoditas bahan pangan atau pakan.',
          'Pengemudi wajib mengenakan masker respirator dan sarung tangan nitril.',
          'Lapor segera ke posko darurat jika terjadi ceceran atau rembesan.',
        ],
      ),
      HazardItem(
        id: 'HAZ-04',
        kelas: 'Kelas 8: Bahan Korosif',
        judul: 'Asam Sulfat, Asam Klorida & Baterai Industri',
        deskripsi: 'Bahan kimia yang bersifat merusak jaringan hidup dan menimbulkan reaksi korosi hebat pada logam kendaraan.',
        simbolIcon: '🧪',
        instruksiKhusus: [
          'Alas bak kargo dilapisi terpal tahan asam atau rubber mat.',
          'Sediakan kotak penetralisir tumpahan (spill kit & soda ash).',
          'Pemeriksaan segel kontainer dilakukan tiap 3 jam perjalanan.',
          'Kecepatan armada dibatasi maksimal 60 km/jam di jalan tol.',
        ],
      ),
    ];
  }
}
