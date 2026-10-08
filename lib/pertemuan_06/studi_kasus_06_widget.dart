import 'package:flutter/material.dart';

void main() {
  runApp(const KampusKuApp());
}

// =====================================================
// DATA MAHASISWA
// =====================================================

const String usernameMahasiswa = 'Naurazsa';
const String passwordMahasiswa = '1234';
const String namaMahasiswa = 'Naura Zalfa Salsabila';
const String nimMahasiswa = '10602040';
const String prodiMahasiswa = 'Teknologi Rekayasa Perangkat Lunak';
const String semesterMahasiswa = '5';

// =====================================================
// DATA ARTIKEL
// =====================================================

final List<Map<String, String>> articles = [
  {
    'title': 'Kegiatan Akademik Kampus',
    'summary': 'Informasi kegiatan akademik mahasiswa KampusKu.',
    'image': 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=800',
    'content': 'KampusKu terus mengembangkan berbagai kegiatan akademik untuk mendukung proses pembelajaran mahasiswa.',
  },
  {
    'title': 'Seminar Teknologi',
    'summary': 'Seminar teknologi untuk meningkatkan wawasan mahasiswa.',
    'image': 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
    'content': 'Seminar teknologi menghadirkan berbagai topik mengenai perkembangan teknologi dan dunia industri.',
  },
  {
    'title': 'Prestasi Mahasiswa',
    'summary': 'Mahasiswa KampusKu kembali meraih prestasi.',
    'image': 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800',
    'content': 'Mahasiswa KampusKu berhasil meraih berbagai prestasi melalui kegiatan akademik maupun nonakademik.',
  },
];

// =====================================================
// DATA BERITA
// =====================================================

final List<Map<String, String>> news = [
  {
    'title': 'Penerimaan Mahasiswa Baru',
    'content': 'Informasi mengenai penerimaan mahasiswa baru KampusKu dapat dilihat melalui informasi resmi kampus.',
    'image': 'https://images.unsplash.com/photo-1562774053-701939374585?w=800',
    'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  },
  {
    'title': 'Kegiatan Dies Natalis',
    'content': 'KampusKu menyelenggarakan kegiatan Dies Natalis dengan berbagai rangkaian acara.',
    'image': 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800',
    'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  },
  {
    'title': 'Workshop Mahasiswa',
    'content':
        'Workshop mahasiswa dilaksanakan untuk meningkatkan kemampuan dan pengalaman mahasiswa.',
    'image': 'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=800',
    'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  },
];

// =====================================================
// DATA DOSEN
// =====================================================

final List<Map<String, String>> lecturers = [
  {'name': 'Bapak Ahmad', 'phone': '081234567890'},
  {'name': 'Ibu Siti', 'phone': '082345678901'},
  {'name': 'Bapak Dedi', 'phone': '083456789012'},
];

// =====================================================
// APP
// =====================================================

class KampusKuApp extends StatelessWidget {
  const KampusKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KampusKu',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const LoginPage(),
    );
  }
}

// =====================================================
// LOGIN
// =====================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == usernameMahasiswa && password == passwordMahasiswa) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Username atau password yang Anda masukkan salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KampusKu'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              children: [
                const Icon(Icons.school, size: 90, color: Colors.blue),

                const SizedBox(height: 20),

                const Text(
                  'Login KampusKu',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text('LOGIN', style: TextStyle(fontSize: 16)),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text('Belum punya akun? Register'),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Dummy Login:\n'
                  'Username: Naurazsa\n'
                  'Password: 1234',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// REGISTER
// =====================================================

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void register() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Register Berhasil'),
          content: const Text('Data registrasi berhasil dibuat.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: register, child: const Text('REGISTER')),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// MAIN PAGE
// =====================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [HomePage(), BeritaPage(), KontakPage(), ProfilPage()];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KampusKu')),

      // =================================================
      // DRAWER
      // =================================================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.school, color: Colors.white, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'KampusKu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Naura', style: TextStyle(color: Colors.white70, fontSize: 15)),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                changePage(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Berita'),
              onTap: () {
                changePage(1);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Kontak'),
              onTap: () {
                changePage(2);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                changePage(3);
                Navigator.pop(context);
              },
            ),

            const Divider(),

            ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: logout),
          ],
        ),
      ),

      body: pages[selectedIndex],

      // =================================================
      // BOTTOM NAVIGATION BAR
      // =================================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changePage,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// =====================================================
// HOME + TABBAR
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            color: Colors.blue,
            child: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Beranda'),
                Tab(icon: Icon(Icons.article), text: 'Artikel'),
                Tab(icon: Icon(Icons.account_circle), text: 'Akun'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(children: [const WelcomeTab(), ArticleTab(), const AccountTab()]),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// TAB BERANDA
// =====================================================

class WelcomeTab extends StatelessWidget {
  const WelcomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(Icons.school, size: 100, color: Colors.blue),

          const SizedBox(height: 20),

          const Text(
            'Selamat Datang di KampusKu',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          SelectableText(
            'Halo, $namaMahasiswa! '
            'Selamat datang di aplikasi KampusKu. '
            'Aplikasi ini menyediakan informasi akademik, '
            'berita kampus, kontak dosen, dan profil mahasiswa.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, height: 1.5),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// TAB ARTIKEL
// =====================================================

class ArticleTab extends StatelessWidget {
  ArticleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 15),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),

            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article['image']!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image),
                  );
                },
              ),
            ),

            title: Text(article['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(article['summary']!),
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArticleDetailPage(article: article)),
              );
            },
          ),
        );
      },
    );
  }
}

// =====================================================
// DETAIL ARTIKEL
// =====================================================

class ArticleDetailPage extends StatelessWidget {
  final Map<String, String> article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Artikel')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article['image']!,
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 230,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.image, size: 70)),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title']!,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  Text(article['content']!, style: const TextStyle(fontSize: 17, height: 1.6)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// TAB AKUN - DATATABLE
// =====================================================

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(color: Colors.grey),
        columns: const [
          DataColumn(
            label: Text('Data', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text('Keterangan', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
        rows: [
          const DataRow(cells: [DataCell(Text('Nama')), DataCell(Text(namaMahasiswa))]),
          const DataRow(cells: [DataCell(Text('NIM')), DataCell(Text(nimMahasiswa))]),
          const DataRow(cells: [DataCell(Text('Username')), DataCell(Text(usernameMahasiswa))]),
          const DataRow(cells: [DataCell(Text('Program Studi')), DataCell(Text(prodiMahasiswa))]),
          const DataRow(cells: [DataCell(Text('Semester')), DataCell(Text(semesterMahasiswa))]),
        ],
      ),
    );
  }
}

// =====================================================
// BERITA
// =====================================================

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: news.length,
      itemBuilder: (context, index) {
        final item = news[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.article)),

            title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),

            subtitle: const Text('Klik untuk melihat detail berita'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsDetailPage(newsItem: item)),
              );
            },
          ),
        );
      },
    );
  }
}

// =====================================================
// DETAIL BERITA
// =====================================================

class NewsDetailPage extends StatelessWidget {
  final Map<String, String> newsItem;

  const NewsDetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Berita')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              newsItem['image']!,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 220,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.image, size: 70)),
                );
              },
            ),

            const SizedBox(height: 20),

            Text(
              newsItem['title']!,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Text(newsItem['content']!, style: const TextStyle(fontSize: 17, height: 1.6)),

            const SizedBox(height: 25),

            const Text(
              'Video YouTube',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 220,
              color: Colors.black,
              child: const Center(
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 70),
              ),
            ),

            const SizedBox(height: 15),

            const Text('Link Video:', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 5),

            SelectableText(newsItem['video']!, style: const TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// KONTAK
// =====================================================

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: lecturers.length,
      itemBuilder: (context, index) {
        final lecturer = lecturers[index];

        return Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),

            title: Text(lecturer['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),

            subtitle: Text(lecturer['phone']!),

            trailing: const Icon(Icons.phone),
          ),
        );
      },
    );
  }
}

// =====================================================
// PROFIL - STACK
// =====================================================

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 350,
                        color: Colors.grey.shade300,
                        child: const Center(child: Icon(Icons.person, size: 100)),
                      );
                    },
                  ),
                ),

                // TEXT OVERLAY
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.65),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaMahasiswa,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'NIM: $nimMahasiswa',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Mahasiswa',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 15),

                    Text('Nama: $namaMahasiswa'),

                    const SizedBox(height: 8),

                    Text('Username: $usernameMahasiswa'),

                    const SizedBox(height: 8),

                    Text('NIM: $nimMahasiswa'),

                    const SizedBox(height: 8),

                    Text('Program Studi: $prodiMahasiswa'),

                    const SizedBox(height: 8),

                    Text('Semester: $semesterMahasiswa'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
