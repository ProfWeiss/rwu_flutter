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
          title: const Text('Datum und Zeit'),
        ),
        body: DateTimePickerWidget(),
      ),
    );
  }
}

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({super.key});

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Datum auswählen'),
              ),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: const Text('Zeit auswählen'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _selectedDate != null
              ? Text(
                  'Ausgewähltes Datum: ${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                  style: const TextStyle(fontSize: 18),
                )
              : Container(),
          const SizedBox(height: 10),
          _selectedTime != null
              ? Text(
                  'Ausgewählte Zeit: ${_selectedTime!.hour}:${_selectedTime!.minute}',
                  style: const TextStyle(fontSize: 18),
                )
              : Container(),
        ],
      ),
    );
  }
}
