import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const TodoScreen());
  }
}

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  final List<Todo> todos = const [
    Todo('Belajar Flutter', 'Mempelajari Navigation dan Routing'),
    Todo('Mengerjakan Tugas', 'Mengerjakan tugas Pemrograman Mobile'),
    Todo('Persiapan Ujian', 'Mempelajari materi untuk ujian'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailScreen(),
                  settings: RouteSettings(arguments: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Todo')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(todo.description, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
