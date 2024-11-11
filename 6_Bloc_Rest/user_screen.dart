// user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random User")),
      body: BlocProvider(
        create: (context) => UserBloc(),
        child: const UserView(),
      ),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              userBloc.add(FetchUserEvent());
            },
            child: const Text("Fetch User"),
          ),
          const SizedBox(height: 20),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Text("Loading...");
              } else if (state is UserLoaded) {
                return Text(
                    "${state.title} ${state.firstName} ${state.lastName}");
              } else if (state is UserError) {
                return const Text("Error");
              } else {
                return const Text("Press the button to load a user");
              }
            },
          ),
        ],
      ),
    );
  }
}
