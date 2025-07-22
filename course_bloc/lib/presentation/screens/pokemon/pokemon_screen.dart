import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: const Center(child: Text('Repaso Bloc')),
    );
  }
}
