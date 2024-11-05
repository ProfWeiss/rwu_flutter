// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'person.dart';
import 'person_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: PersonList(),
          ),
          Expanded(
            flex: 3,
            child: PersonDetail(),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddPersonDialog();
                },
              );
            },
            child: const Icon(Icons.add),
            heroTag: null,
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              context.read<PersonProvider>().savePersons();
            },
            child: const Icon(Icons.save),
            heroTag: null,
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              context.read<PersonProvider>().loadPersons();
            },
            child: const Icon(Icons.refresh),
            heroTag: null,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class PersonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var persons = context.watch<PersonProvider>().persons;
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(persons[index].firstName + persons[index].lastName),
          onDismissed: (direction) {
            context.read<PersonProvider>().deletePerson(persons[index]);
          },
          background: Container(color: Colors.red),
          child: ListTile(
            title:
                Text('${persons[index].firstName} ${persons[index].lastName}'),
            onTap: () {
              context.read<PersonProvider>().selectPerson(persons[index]);
            },
          ),
        );
      },
    );
  }
}

class PersonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var selectedPerson = context.watch<PersonProvider>().selectedPerson;
    return selectedPerson != null
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name: ${selectedPerson.firstName}',
                    style: const TextStyle(fontSize: 18)),
                Text('Last Name: ${selectedPerson.lastName}',
                    style: const TextStyle(fontSize: 18)),
                Text('Age: ${selectedPerson.age}',
                    style: const TextStyle(fontSize: 18)),
                Text('City: ${selectedPerson.city}',
                    style: const TextStyle(fontSize: 18)),
                Text('Zip: ${selectedPerson.zip}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          )
        : Center(
            child: const Text('Select a person from the list',
                style: const TextStyle(fontSize: 18)),
          );
  }
}

class AddPersonDialog extends StatefulWidget {
  @override
  _AddPersonDialogState createState() => _AddPersonDialogState();
}

class _AddPersonDialogState extends State<AddPersonDialog> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Person'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _zipController,
                decoration: InputDecoration(labelText: 'Zip'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the zip code';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newPerson = Person(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                age: int.parse(_ageController.text),
                city: _cityController.text,
                zip: _zipController.text,
              );
              context.read<PersonProvider>().addPerson(newPerson);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    super.dispose();
  }
}
