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
          title: const Text('Stateful Widget Example'),
        ),
        body: const Center(
          child: ToggleTextWidget(),
        ),
      ),
    );
  }
}

class ToggleTextWidget extends StatefulWidget {
  const ToggleTextWidget({super.key});

  @override
  _ToggleTextWidgetState createState() => _ToggleTextWidgetState();
}

class _ToggleTextWidgetState extends State<ToggleTextWidget> {
  String _displayText = 'Mobile';

  void _toggleText() {
    setState(() =>
        _displayText = _displayText == 'Mobile' ? 'Anwendungen' : 'Mobile');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _displayText,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: _toggleText,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            textStyle: const TextStyle(fontSize: 30),
          ),
          child: const Text('Toggle Text'),
        ),
      ],
    );
  }
}
