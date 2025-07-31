import 'package:bloc/bloc.dart';
import 'package:course_bloc/config/helpers/pokemon_information.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState()) {
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
      final pokemonName = await PokemonInformation.getPokemonInformation(
        pokemonId,
      );
      add(PokemonFetchedEvent(pokemonId, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon name');
    }
  }
}
