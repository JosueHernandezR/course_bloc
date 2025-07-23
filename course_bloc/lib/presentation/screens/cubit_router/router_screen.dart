import 'package:course_bloc/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit + Go Router')),
      body: const Center(child: Text('Repaso Bloc')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RouterSimpleCubit>().goBack();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
