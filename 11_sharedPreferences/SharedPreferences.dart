import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form with SharedPreferences',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // Notwendig, siehe
    // https://stackoverflow.com/questions/50687801/flutter-unhandled-exception-missingpluginexceptionno-implementation-found-for
    SharedPreferences.setMockInitialValues({});
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _zipController.text = prefs.getString('zip') ?? '';
    });
  }

  bool get isSaveButtonEnabled {
    return _usernameController.text.length >= 2 &&
        _passwordController.text.length >= 2 &&
        _zipController.text.length >= 2;
  }

  Future<void> savePreferences() async {
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('zip', _zipController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistent Form'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (text) => setState(() {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (text) => setState(() {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _zipController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Zip Code'),
              onChanged: (text) => setState(() {}),
            ),
          ),
          ElevatedButton(
            onPressed: isSaveButtonEnabled ? savePreferences : null,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
