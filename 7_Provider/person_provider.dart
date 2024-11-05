// person_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'person.dart';

class PersonProvider with ChangeNotifier {
  List<Person> _persons = [
    Person(
        firstName: "Karl",
        lastName: "Maier",
        age: 30,
        city: "Berlin",
        zip: "10115"),
    Person(
        firstName: "Lea",
        lastName: "Müller",
        age: 25,
        city: "Munich",
        zip: "80331"),
    Person(
        firstName: "Fritz",
        lastName: "Schwarz",
        age: 40,
        city: "Hamburg",
        zip: "20095"),
    Person(
        firstName: "Lisa",
        lastName: "Rot",
        age: 35,
        city: "Frankfurt",
        zip: "60311")
  ];

  Person? _selectedPerson;

  List<Person> get persons => _persons;

  Person? get selectedPerson => _selectedPerson;

  void selectPerson(Person person) {
    _selectedPerson = person;
    notifyListeners();
  }

  void addPerson(Person person) {
    _persons.add(person);
    notifyListeners();
  }

  void deletePerson(Person person) {
    _persons.remove(person);
    notifyListeners();
  }

  Future<void> savePersons() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
        jsonEncode(_persons.map((p) => p.toJson()).toList());
    prefs.setString('persons', encodedData);
  }

  Future<void> loadPersons() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('persons');
    if (encodedData != null) {
      final List decodedData = jsonDecode(encodedData);
      _persons = decodedData.map((item) => Person.fromJson(item)).toList();
      notifyListeners();
    }
  }
}
