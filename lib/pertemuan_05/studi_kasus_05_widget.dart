import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Konversi Suhu', home: const Screen1());
  }
}

// SCREEN 1
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController suhuController = TextEditingController();

  String satuan = 'Celsius';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Suhu - Input')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: suhuController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Suhu',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: satuan,
              decoration: const InputDecoration(
                labelText: 'Pilih Satuan Suhu',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Celsius', child: Text('Celsius')),
                DropdownMenuItem(value: 'Fahrenheit', child: Text('Fahrenheit')),
                DropdownMenuItem(value: 'Kelvin', child: Text('Kelvin')),
                DropdownMenuItem(value: 'Reamur', child: Text('Réaumur')),
              ],
              onChanged: (value) {
                setState(() {
                  satuan = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              child: const Text('Konversi'),
              onPressed: () {
                double? suhu = double.tryParse(suhuController.text);

                if (suhu == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Masukkan nilai suhu terlebih dahulu')),
                  );
                  return;
                }

                // Navigasi ke Screen 2 dan mengirim data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(suhu: suhu, satuan: satuan),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// SCREEN 2
class Screen2 extends StatelessWidget {
  final double suhu;
  final String satuan;

  const Screen2({super.key, required this.suhu, required this.satuan});

  // Mengubah suhu menjadi Celsius terlebih dahulu
  double keCelsius() {
    if (satuan == 'Celsius') {
      return suhu;
    } else if (satuan == 'Fahrenheit') {
      return (suhu - 32) * 5 / 9;
    } else if (satuan == 'Kelvin') {
      return suhu - 273.15;
    } else {
      return suhu * 5 / 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    double celsius = keCelsius();

    double fahrenheit = (celsius * 9 / 5) + 32;
    double kelvin = celsius + 273.15;
    double reamur = celsius * 4 / 5;

    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Suhu - Hasil')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Input: $suhu $satuan',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              Text(
                'Celsius: ${celsius.toStringAsFixed(2)} °C',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              Text(
                'Fahrenheit: ${fahrenheit.toStringAsFixed(2)} °F',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              Text('Kelvin: ${kelvin.toStringAsFixed(2)} K', style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 10),

              Text(
                'Réaumur: ${reamur.toStringAsFixed(2)} °R',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
