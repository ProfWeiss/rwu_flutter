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
          title: const Text('Edit Field Example'),
        ),
        body: Center(
          child: TextWidget(),
        ),
      ),
    );
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    Color textColor = _displayText.toLowerCase().contains('hallo')
        ? Colors.green
        : Colors.red;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(50),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _displayText = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Text eingeben',
              ),
            )),
        const SizedBox(height: 50),
        Text(
          _displayText,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ],
    );
  }
}
