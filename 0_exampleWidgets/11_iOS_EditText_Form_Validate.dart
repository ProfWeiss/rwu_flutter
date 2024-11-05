import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoFormWidget extends StatefulWidget {
  @override
  _CupertinoFormWidgetState createState() => _CupertinoFormWidgetState();
}

class _CupertinoFormWidgetState extends State<CupertinoFormWidget> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        middle: Text('Mobile Applikationen iOS'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name field, siehe https://api.flutter.dev/flutter/cupertino/CupertinoTextFormFieldRow-class.html1
              CupertinoTextFormFieldRow(
                controller: _nameController,
                placeholder: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Age field
              CupertinoTextFormFieldRow(
                controller: _ageController,
                placeholder: 'Age',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Email field
              CupertinoTextFormFieldRow(
                controller: _emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Basic email validation
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Password field
              CupertinoTextFormFieldRow(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8 || !RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must be at least 8 characters and contain a number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Submit button, https://api.flutter.dev/flutter/cupertino/CupertinoButton-class.html
              CupertinoButton.filled(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Values valid'),
                          content: Text(
                            'Name: ${_nameController.text}\nEmail: ${_emailController.text}',
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Check it'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(CupertinoApp(
    title: 'Mobile Anwendungen',
    theme: const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: CupertinoColors.systemBlue,
    ),
    home: CupertinoFormWidget(),
  ));
}
