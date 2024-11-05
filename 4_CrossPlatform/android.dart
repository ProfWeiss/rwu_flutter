import 'package:flutter/material.dart';

class AndroidHome extends StatelessWidget {
  const AndroidHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android App'),
      ),
      body: Center(
        child: Text('Welcome to the Android app!'),
      ),
    );
  }
}
