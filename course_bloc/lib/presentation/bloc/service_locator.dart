import 'package:course_bloc/config/helpers/pokemon_information.dart';
import 'package:get_it/get_it.dart';

import 'package:course_bloc/config/router/app_router.dart';
import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<UsernameCubit>(UsernameCubit());
  getIt.registerSingleton<CounterCubit>(CounterCubit());
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
  getIt.registerSingleton<RouterSimpleCubit>(RouterSimpleCubit());
  getIt.registerSingleton<GuestsBloc>(GuestsBloc());
  getIt.registerSingleton<PokemonBloc>(
    PokemonBloc(fetchPokemonName: PokemonInformation.getPokemonInformation),
  );
  // Se debe crear el cubit y luego llamar al metodo watchUserLocation
  getIt.registerSingleton<GeolocationCubit>(
    GeolocationCubit()..watchUserLocation(),
  );
}
