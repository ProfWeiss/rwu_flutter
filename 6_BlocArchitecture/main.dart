import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
import 'counter_page.dart';

// Quelle: https://www.dhiwise.com/post/flutter-bloc-tutorial-understanding-state-management

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Um Bloc in einer App nutzen zu können braucht es einen BlocProvider, der
    // in der Create Funktion  hat.
    //
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}
