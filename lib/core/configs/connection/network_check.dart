import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/app/sections/main/main_section.dart';

import 'bloc/connected_bloc.dart';

class NChecking extends StatelessWidget {
  const NChecking({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ConnectedSucessState) {
          return const MainPage();
        } else {
          return const MainPage();
        }
      },
    );
  }
}

class NoConnectionError extends StatelessWidget {
  const NoConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connection failed!"),
          ],
        ),
      ),
    );
  }
}
