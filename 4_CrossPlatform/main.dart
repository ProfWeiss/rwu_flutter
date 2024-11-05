import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ios.dart';
import 'android.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAndroid = true; // By default, the system is set to Android

  @override
  Widget build(BuildContext context) {
    // if (Theme.of(context).platform == TargetPlatform.android) {
    // Android-specific UI elements
    if (isAndroid) {
      return MaterialApp(home: AndroidHome());
      // if (Theme.of(context).platform == TargetPlatform.iOS) {
    } else {
      return CupertinoApp(debugShowCheckedModeBanner: false, home: IosHome());
    }
  }
}
