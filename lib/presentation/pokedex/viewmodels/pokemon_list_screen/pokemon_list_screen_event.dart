part of 'pokemon_list_screen_bloc.dart';

abstract class PokemonListScreenEvent {}

class GetPokemonListEvent extends PokemonListScreenEvent {}

class GetPokemonListOnEndReached extends PokemonListScreenEvent {}
