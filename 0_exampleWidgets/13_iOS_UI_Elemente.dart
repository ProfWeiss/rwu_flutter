import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoUIExample extends StatefulWidget {
  @override
  _CupertinoUIExampleState createState() => _CupertinoUIExampleState();
}

class _CupertinoUIExampleState extends State<CupertinoUIExample> {
  bool _switchValue = false;
  String _selectedOption = 'Option 1';
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mobile Anwendungen'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top-left aligned text
            const Text(
              'Cupertino UI Elemente',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            // iOS-like switch with label
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Hier einschalten',
                    style: TextStyle(fontSize: 16.0)),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                    String message = value ? 'ein' : 'aus';
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        content: Text(message),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),

            // Radio options
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoRadioOption(
                  label: 'Option 1',
                  value: 'Option 1',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        content: Text(value),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                CupertinoRadioOption(
                  label: 'Option 2',
                  value: 'Option 2',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        content: Text(value),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),

            // Danger icon
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Icon(
                CupertinoIcons.exclamationmark_circle_fill,
                color: CupertinoColors.systemRed,
                size: 24.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),

            // Slider with value display
            Row(
              children: [
                Expanded(
                  child: CupertinoSlider(
                    value: _sliderValue,
                    min: 0,
                    max: 1,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Text(
                  _sliderValue.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// bessere Lösung https://api.flutter.dev/flutter/cupertino/CupertinoRadio-class.html
class CupertinoRadioOption extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const CupertinoRadioOption({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoRadioButton(
            selected: value == groupValue,
          ),
          const SizedBox(width: 8.0),
          Text(label, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}

class CupertinoRadioButton extends StatelessWidget {
  final bool selected;

  const CupertinoRadioButton({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: CupertinoColors.systemGrey,
          width: 2.0,
        ),
        color: selected ? CupertinoColors.activeBlue : CupertinoColors.white,
      ),
      child: selected
          ? Center(
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.activeBlue,
                ),
              ),
            )
          : null,
    );
  }
}

void main() {
  runApp(CupertinoApp(
    home: CupertinoUIExample(),
  ));
}
