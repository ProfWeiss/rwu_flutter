import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Two Column Widget'),
        ),
        body: TwoColumnWidget(),
      ),
    );
  }
}

class TwoColumnWidget extends StatelessWidget {
  const TwoColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add onPressed action for the button here
                  },
                  child: const Text('Click Me'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add onPressed action for the button here
                  },
                  child: const Text('Or Click Me'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
