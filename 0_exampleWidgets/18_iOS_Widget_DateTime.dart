import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CupertinoDateTimePickerExample extends StatefulWidget {
  @override
  _CupertinoDateTimePickerExampleState createState() =>
      _CupertinoDateTimePickerExampleState();
}

class _CupertinoDateTimePickerExampleState
    extends State<CupertinoDateTimePickerExample> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  void _showTimePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    _selectedTime.hour,
                    _selectedTime.minute,
                  ),
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() {
                      _selectedTime = TimeOfDay(
                        hour: newTime.hour,
                        minute: newTime.minute,
                      );
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String getFormattedTime() {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, _selectedTime.hour, _selectedTime.minute);
    return DateFormat.jm().format(dateTime);
  }

  String getFormattedDate() {
    return DateFormat('dd.MM.yyyy').format(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Date & Time Picker Example'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Time Picker Button
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: () => _showTimePicker(context),
                child: Text(getFormattedTime()),
              ),
              SizedBox(width: 16.0),

              // Date Picker Button
              CupertinoButton(
                color: CupertinoColors.activeGreen,
                onPressed: () => _showDatePicker(context),
                child: Text(getFormattedDate()),
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
    home: CupertinoDateTimePickerExample(),
  ));
}
