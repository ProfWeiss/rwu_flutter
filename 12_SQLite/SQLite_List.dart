import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter and SQLite',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  late Database _database;
  List<Map<String, dynamic>> _names = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'names_database.db');
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS Person(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, createdAt TEXT, updatedAt TEXT)',
      );
    });
    _loadNames();
  }

  Future<void> _loadNames() async {
    final List<Map<String, dynamic>> names = await _database.query('Person');
    setState(() {
      _names = names;
    });
  }

  Future<void> _addName(String name) async {
    final String now = DateTime.now().toIso8601String();
    await _database.insert(
      'Person',
      {'name': name, 'createdAt': now, 'updatedAt': now},
    );
    _loadNames();
    _nameController.clear();
  }

  Future<void> _deleteName(int id) async {
    await _database.delete(
      'Person',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a name',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addName(_nameController.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _names.length,
              itemBuilder: (context, index) {
                final item = _names[index];
                return Dismissible(
                  key: Key(item['id'].toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteName(item['id']);
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item['name']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
