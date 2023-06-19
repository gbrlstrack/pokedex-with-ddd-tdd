part of 'pokemon_list_screen_bloc.dart';

class PokemonListScreenState {
  const PokemonListScreenState(
      {required this.pokemonList, required this.isLoading});

  final List<Pokemon> pokemonList;
  final bool isLoading;
}
