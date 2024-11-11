// user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>(_onFetchUser);
  }

  Future<void> _onFetchUser(
      FetchUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final response = await http.get(Uri.parse('https://randomuser.me/api/'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final user = data['results'][0];
        final name = user['name'];

        emit(UserLoaded(
          title: name['title'],
          firstName: name['first'],
          lastName: name['last'],
        ));
      } else {
        emit(UserError());
      }
    } catch (_) {
      emit(UserError());
    }
  }
}
