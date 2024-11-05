import 'package:flutter/material.dart';

class MyFabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('It is so FABuleos'),
      ),
      body: Center(
        child: const Text('Press the FAB to see a SnackBar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show SnackBar when FAB is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("It's great, it's a FAB!"),
            ),
          );
        },
        tooltip: 'Show SnackBar',
        child: const Icon(Icons.info), // Info icon
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyFabWidget(),
  ));
}
