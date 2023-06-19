import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/application/pokedex/interactors/get_pokemon_list_interactor.dart';
import 'package:pokedex/domain/pokedex/services/pokemon_service.dart';
import 'package:pokedex/infrastructure/pokedex/services/http_pokemon_service.dart';
import 'package:pokedex/presentation/pokedex/viewmodels/pokemon_list_screen/pokemon_list_screen_bloc.dart';
// import 'package:pokedex/presentation/pokedex/viewmodels/pokemon_list_screen/';

void configureDependencyInjection() {
  GetIt.I.registerLazySingleton<PokemonService>(
      () => HttpPokemonService(http.Client()));

  GetIt.I.registerLazySingleton(() => GetPokemonListInteractor(GetIt.I()));

  GetIt.I.registerFactory(() => PokemonListScreenBloc(GetIt.I()));
}
