import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';

class CounterControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
          child: const Text('+'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
          child: const Text('-'),
        ),
      ],
    );
  }
}
