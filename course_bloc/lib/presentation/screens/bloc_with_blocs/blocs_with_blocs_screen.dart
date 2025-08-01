import 'package:course_bloc/presentation/bloc/geolocation/geolocation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final geolocationCubit = context.watch<GeolocationCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Blocs with Blocs')),
      body: Center(child: Text(geolocationCubit.state.location.toString())),
    );
  }
}
