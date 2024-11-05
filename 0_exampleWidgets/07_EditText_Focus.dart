import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Focus Demo')),
        body: FocusWidget(),
      ),
    );
  }
}

class FocusWidget extends StatefulWidget {
  @override
  _FocusWidgetState createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  TextEditingController prenameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  FocusNode prenameFocusNode = FocusNode();
  FocusNode surnameFocusNode = FocusNode();

  String prename = '';
  String surname = '';

  @override
  void initState() {
    super.initState();

    prenameController.addListener(() {
      setState(() {
        prename = prenameController.text;
      });
    });

    surnameController.addListener(() {
      setState(() {
        surname = surnameController.text;
      });
    });
  }

  @override
  void dispose() {
    prenameController.dispose();
    surnameController.dispose();
    prenameFocusNode.dispose();
    surnameFocusNode.dispose();
    super.dispose();
  }

  void unfocusFields() {
    prenameFocusNode.unfocus();
    surnameFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display prename and surname above the edit fields
          Text('Prename: $prename', style: const TextStyle(fontSize: 18)),
          Text('Surname: $surname', style: const TextStyle(fontSize: 18)),
          SizedBox(height: 20),

          // Two buttons for focusing and removing focus
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(prenameFocusNode);
                },
                child: Text('Prename'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: unfocusFields,
                child: Text('No Focus'),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Prename TextField
          TextField(
            focusNode: prenameFocusNode,
            controller: prenameController,
            decoration: InputDecoration(labelText: 'Prename'),
          ),
          SizedBox(height: 10),

          // Surname TextField
          TextField(
            focusNode: surnameFocusNode,
            controller: surnameController,
            decoration: InputDecoration(labelText: 'Surname'),
          ),
        ],
      ),
    );
  }
}
