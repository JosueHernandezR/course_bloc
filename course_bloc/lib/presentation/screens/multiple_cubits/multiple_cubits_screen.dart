import 'package:course_bloc/presentation/bloc/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleCubitsScreen extends StatelessWidget {
  const MultipleCubitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple Cubits')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) => Column(
            children: [
              const Spacer(flex: 1),

              IconButton(
                // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
                icon: const Icon(Icons.dark_mode_outlined, size: 100),
                onPressed: () {},
              ),

              const Text('Fernando Herrera', style: TextStyle(fontSize: 25)),

              TextButton.icon(
                icon: const Icon(Icons.add, size: 50),
                label: Text(state.toString(), style: TextStyle(fontSize: 100)),
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
    );
  }
}
