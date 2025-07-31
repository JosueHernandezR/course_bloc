import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int pokemonId) _fetchPokemonName;

  PokemonBloc({
    required Future<String> Function(int pokemonId) fetchPokemonName,
  }) : _fetchPokemonName = fetchPokemonName,
       super(PokemonState()) {
    on<PokemonFetchedEvent>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);
      newPokemons[event.pokemonId] = event.pokemonName;
      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> fetchPokemonName(int pokemonId) async {
    if (state.pokemons.containsKey(pokemonId)) {
      return state.pokemons[pokemonId]!;
    }
    try {
      final pokemonName = await _fetchPokemonName(pokemonId);
      add(PokemonFetchedEvent(pokemonId, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon name');
    }
  }
}
