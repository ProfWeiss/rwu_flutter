import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Definiert die Events
class FetchUserEvent extends UserEvent {}
