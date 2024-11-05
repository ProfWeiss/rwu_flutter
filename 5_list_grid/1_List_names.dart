import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameListScreen(),
    );
  }
}

class NameListScreen extends StatefulWidget {
  @override
  State<NameListScreen> createState() => _NameListScreenState();
}

class _NameListScreenState extends State<NameListScreen> {
  // Klasse zur Ansteuerung eines Textfeldes.
  // Info: Final muss bei der Definition initialisiert sein. Die Felder in
  // Objekten sind aber mutable (Bei const sind die Felder nicht mehr veränderbar)
  final TextEditingController _nameController = TextEditingController();
  final List<String> _names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    // Verbindung des Controller mit dem
                    // TextFeld https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a name',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _names.add(_nameController.text);
                      _nameController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
          // siehe https://api.flutter.dev/flutter/widgets/Expanded-class.html
          Expanded(
            // ListView muss die Funktion builder aufrufen, vgl. map in Web
            child: ListView.builder(
              itemCount: _names.length,
              itemBuilder: (BuildContext context, int index) {
                // Zeilen können nach links geschoben werden zum löschen
                return Dismissible(
                  key: Key(_names[index]),
                  direction: DismissDirection
                      .endToStart, //.startToEnd, nach links oder rechts ziehen zum löschen.
                  // https://api.flutter.dev/flutter/widgets/Dismissible-class.html
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      _names.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(_names[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
