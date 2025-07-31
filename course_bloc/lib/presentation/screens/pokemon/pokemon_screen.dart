import 'package:course_bloc/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 1;
  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.read<PokemonBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Pokemon ID: $pokemonId')),
      body: Center(
        child: FutureBuilder(
          future: pokemonBloc.fetchPokemonName(pokemonId),
          initialData: pokemonBloc.state.pokemons[pokemonId] ?? 'Loading...',
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (asyncSnapshot.hasError) {
              return Text('Error: ${asyncSnapshot.error}');
            }
            return Text(asyncSnapshot.data!);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-add',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              setState(() {
                pokemonId++;
              });
            },
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: 'btn-minus',
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              setState(() {
                if (pokemonId <= 1) return;
                pokemonId--;
              });
            },
          ),
        ],
      ),
    );
  }
}
