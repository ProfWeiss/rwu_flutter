// person.dart
class Person {
  final String firstName;
  final String lastName;
  final int age;
  final String city;
  final String zip;

  Person({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.city,
    required this.zip,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'city': city,
        'zip': zip,
      };

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'],
        city: json['city'],
        zip: json['zip'],
      );
}
