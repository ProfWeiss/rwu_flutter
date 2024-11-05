import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stateless Widget'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Info button pressed')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                // Action for message button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message button pressed')),
                );
              },
            ),
          ],
        ),
        body: const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('Mobile Anwendungen'),
              Text('Cross Plattform mit Flutter')
            ])));
  }
}

void main() {
  runApp(MaterialApp(
    home: MyStatelessWidget(),
  ));
}
