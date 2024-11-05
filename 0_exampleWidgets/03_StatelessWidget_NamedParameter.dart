import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Stateless Widget'),
            ),
            body: const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Mobile Anwendungen'),
                  Text('Cross Plattform mit Flutter'),
                  PersonAge(name: 'Fritz', age: 20, bold: true),
                  PersonAge(name: 'Pia', age: 28, bold: false),
                  PersonAge(name: 'Lea', age: 25)
                ]))));
  }
}

class PersonAge extends StatelessWidget {
  final String name;
  final int age;
  final bool bold;
  const PersonAge(
      {super.key, required this.name, required this.age, this.bold = false});
  @override
  Widget build(BuildContext context) {
    return Text('$name: $age',
        style: TextStyle(
            fontSize: 20,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal));
  }
}
