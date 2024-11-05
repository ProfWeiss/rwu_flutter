import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter UI Elemente'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool checkBoxValue = false;
  int radioValue = 0;
  bool switchValue = false;
  double sliderValue = 0.0;

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void initState() {
    super.initState();
    // Option 1 beim Start aktivieren
    radioValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Hier einschalten'),
                Checkbox(
                  value: checkBoxValue,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = value!;
                      showSnackbar(value ? 'Option an' : 'Option aus');
                    });
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Optionen:'),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value as int;
                          showSnackbar('Option an');
                        });
                      },
                    ),
                    const Text('Option 1'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value as int;
                          showSnackbar('Option aus');
                        });
                      },
                    ),
                    const Text('Option 2'),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                showSnackbar('Icon angeklickt');
              },
              child: const Icon(Icons.warning),
            ),
            const Divider(),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Text('A Switch:'),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                      showSnackbar(value ? 'an' : 'aus');
                    });
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  min: 0.0,
                  max: 100.0,
                ),
                Text(sliderValue.toStringAsFixed(2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
