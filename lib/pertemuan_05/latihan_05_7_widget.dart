import 'package:flutter/material.dart';

void main() {
  runApp(const KitchenApp());
}

class KitchenApp extends StatelessWidget {
  const KitchenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen Stories',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
        '/shopping': (context) => const ShoppingPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Kitchen Stories'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('5 must-have tarts and pies', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/detail'),
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    'https://www.justataste.com/wp-content/uploads/2020/06/buttermilk-pancakes.jpg',
                  ),
                  const ListTile(
                    title: Text('Fluffy buttermilk pancakes'),
                    subtitle: Text('Under 400 KCAL'),
                    trailing: Icon(Icons.play_circle_fill),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Fluffy buttermilk pancakes'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                'https://www.justataste.com/wp-content/uploads/2020/06/buttermilk-pancakes.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This ingredient lineup for these classic pancakes is very similar to my top-rated sheet pan pancakes recipe, which is a great option if you’re trying to feed a hungry crew or hordes of brunch guests at once.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/shopping'),
                child: const Text('Go to Shopping List'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Fluffy buttermilk pancakes', style: TextStyle(fontSize: 20)),
          SizedBox(height: 12),
          CheckboxListTile(title: Text('1 egg'), value: false, onChanged: null),
          CheckboxListTile(title: Text('vegetable oil'), value: false, onChanged: null),
          CheckboxListTile(title: Text('maple syrup'), value: false, onChanged: null),
          CheckboxListTile(title: Text('butter milk'), value: false, onChanged: null),
        ],
      ),
    );
  }
}
