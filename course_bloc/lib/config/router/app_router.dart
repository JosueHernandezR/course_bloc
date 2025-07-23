import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:course_bloc/presentation/screens/screens.dart';

final _publicRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    GoRoute(
      path: '/simple-cubit',
      builder: (context, state) => const CubitScreen(),
    ),

    GoRoute(
      path: '/cubit-router',
      builder: (context, state) => const RouterScreen(),
    ),

    GoRoute(
      path: '/cubit-state',
      builder: (context, state) => const MultipleCubitsScreen(),
    ),

    GoRoute(
      path: '/guest-bloc',
      builder: (context, state) => const GuestsScreen(),
    ),

    GoRoute(
      path: '/pokemon-bloc',
      builder: (context, state) => const PokemonScreen(),
    ),

    GoRoute(
      path: '/blocs-with-blocs',
      builder: (context, state) => const BlocsWithBlocsScreen(),
    ),
  ],
);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_publicRouter);
  void goHome() => state.go('/');
  void goBack() => state.pop();
}
