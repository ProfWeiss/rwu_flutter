// Verwaltet die Daten
import 'package:equatable/equatable.dart';

// Hier werden die States definiert. Equatable erlaubt den Vergleich von Arrays
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String title;
  final String firstName;
  final String lastName;

  UserLoaded(
      {required this.title, required this.firstName, required this.lastName});

  @override
  List<Object> get props => [title, firstName, lastName];
}

class UserError extends UserState {}
