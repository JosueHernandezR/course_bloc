import 'package:flutter/material.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guest')),
      body: const Center(child: Text('Repaso Bloc')),
    );
  }
}
