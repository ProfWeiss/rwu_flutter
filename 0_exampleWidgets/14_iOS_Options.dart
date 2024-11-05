import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoOptionsExample extends StatefulWidget {
  @override
  _CupertinoOptionsExampleState createState() =>
      _CupertinoOptionsExampleState();
}

class _CupertinoOptionsExampleState extends State<CupertinoOptionsExample> {
  String _selectedSegment = 'Option 1';
  String _selectedPickerValue = 'Option 1';
  String _selectedActionSheet = '';

  final List<String> _pickerOptions = ['Option 1', 'Option 2', 'Option 3'];

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Choose an Option'),
          message: Text('Please select one of the following options.'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: Text('Option 1'),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _selectedActionSheet = 'Option 1 selected';
                });
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Option 2'),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _selectedActionSheet = 'Option 2 selected';
                });
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Option 3'),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _selectedActionSheet = 'Option 3 selected';
                });
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _showPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: CupertinoPicker(
            backgroundColor: CupertinoColors.systemBackground,
            itemExtent: 32.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedPickerValue = _pickerOptions[index];
              });
            },
            children: _pickerOptions.map((String option) {
              return Center(
                child: Text(option),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('iOS Options Example'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            // Button for Action Sheet
            CupertinoButton(
              child: const Text('Action Sheet (einige Optionen)'),
              onPressed: () => _showActionSheet(context),
            ),
            if (_selectedActionSheet.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _selectedActionSheet,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            const SizedBox(height: 16.0),

            // Button for Picker
            CupertinoButton(
              child: const Text('Show Picker (viele Optionen)'),
              onPressed: () => _showPicker(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Selected from Picker: $_selectedPickerValue',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),

            // Segmented Control
            const Text('Choose Option (wenige Optionen):',
                style: TextStyle(fontSize: 16.0)),
            const SizedBox(height: 8.0),
            CupertinoSegmentedControl<String>(
              children: const {
                'Option 1': Text('Option 1'),
                'Option 2': Text('Option 2'),
                'Option 3': Text('Option 3'),
              },
              onValueChanged: (String value) {
                setState(() {
                  _selectedSegment = value;
                });
              },
              groupValue: _selectedSegment,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Selected Segment: $_selectedSegment',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(CupertinoApp(
    home: CupertinoOptionsExample(),
  ));
}
