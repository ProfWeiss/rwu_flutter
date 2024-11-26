import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User Table',
      home: RandomUserTable(),
    );
  }
}

class RandomUserTable extends StatefulWidget {
  @override
  _RandomUserTableState createState() => _RandomUserTableState();
}

class _RandomUserTableState extends State<RandomUserTable> {
  List<User> _users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _isLoading = true;
    });
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> users = data['results'];
      setState(() {
        _users = users.map((user) => User.fromJson(user['name'])).toList();
        _isLoading = false;
      });
    } else {
      // Handle the error; for simplicity, we're just setting _users to empty
      setState(() {
        _users = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User List'),
        actions: [
          if (_isLoading)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CircularProgressIndicator(color: Colors.white),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Last Name')),
          ],
          rows: _users
              .map((user) => DataRow(cells: [
                    DataCell(Text(user.firstName)),
                    DataCell(Text(user.lastName)),
                  ]))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadUsers,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class User {
  final String firstName;
  final String lastName;

  User({required this.firstName, required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first'],
      lastName: json['last'],
    );
  }
}
