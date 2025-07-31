import 'package:dio/dio.dart';

class PokemonInformation {
  static Future<String> getPokemonInformation(int pokemonId) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$pokemonId',
      );
      return response.data['name'] ?? 'No se encontró el pokemon';
    } catch (e) {
      return 'No se encontró el pokemon';
    }
  }
}
