import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Second Screen',
          ),
        ),
      ),
    );
  }
}
