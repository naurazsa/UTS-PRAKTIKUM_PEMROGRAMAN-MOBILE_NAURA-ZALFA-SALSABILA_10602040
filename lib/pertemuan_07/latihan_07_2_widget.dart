import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan 7.2',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyAppState(),
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  State<MyAppState> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {
  final List<String> toppings = [
    'Onions',
    'Mushrooms',
    'Black olives',
    'Green peppers',
    'Extra cheese',
  ];

  final List<String> selectedToppings = [];

  String selectedSize = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan 7.2')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Topping:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              ...toppings.map((topping) {
                return CheckboxListTile(
                  title: Text(topping),
                  value: selectedToppings.contains(topping),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedToppings.add(topping);
                      } else {
                        selectedToppings.remove(topping);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                );
              }),

              const Divider(),

              const Text(
                'Pilih Ukuran:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              ...['Small', 'Medium', 'Large'].map((size) {
                return RadioListTile<String>(
                  title: Text(size),
                  value: size,
                  groupValue: selectedSize,
                  onChanged: (String? value) {
                    setState(() {
                      selectedSize = value!;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                );
              }),

              const Divider(),

              const Text(
                'Pesanan Anda:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Text('Ukuran: $selectedSize'),
              Text(
                'Topping: ${selectedToppings.isEmpty ? "Belum dipilih" : selectedToppings.join(", ")}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
