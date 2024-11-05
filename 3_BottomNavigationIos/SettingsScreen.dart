import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _option1Enabled = false;
  bool _option2Enabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Enable Option 1', style: TextStyle(fontSize: 18.0)),
              CupertinoSwitch(
                value: _option1Enabled,
                onChanged: (bool value) {
                  setState(() {
                    _option1Enabled = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enable Option 2', style: TextStyle(fontSize: 18.0)),
              CupertinoSwitch(
                value: _option2Enabled,
                onChanged: (bool value) {
                  setState(() {
                    _option2Enabled = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
