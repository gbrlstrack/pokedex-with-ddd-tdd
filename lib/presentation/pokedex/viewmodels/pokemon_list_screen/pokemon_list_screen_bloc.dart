import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/application/pokedex/interactors/get_pokemon_list_interactor.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';

part 'pokemon_list_screen_event.dart';
part 'pokemon_list_screen_state.dart';

class PokemonListScreenBloc
    extends Bloc<PokemonListScreenEvent, PokemonListScreenState> {
  final GetPokemonListInteractor getPokemonList;
  PokemonListScreenBloc(this.getPokemonList)
      : super(
          const PokemonListScreenState(
            isLoading: false,
            pokemonList: [],
          ),
        ) {
    on<GetPokemonListEvent>((event, emit) async {
      if (state.isLoading == true) return;
      emit(PokemonListScreenState(
          pokemonList: state.pokemonList, isLoading: true));
      final pokemonList = await getPokemonList.call(limit: 20, offset: 0);

      emit(PokemonListScreenState(pokemonList: pokemonList, isLoading: false));
    });

    on<GetPokemonListOnEndReached>((event, emit) async {
      if (state.isLoading == true) return;
      emit(PokemonListScreenState(
          pokemonList: state.pokemonList, isLoading: true));
      final morePokemonsList = await getPokemonList.call(
          limit: 20, offset: state.pokemonList.length);
      final pokeList = state.pokemonList;
      pokeList.addAll(morePokemonsList);

      emit(PokemonListScreenState(pokemonList: pokeList, isLoading: false));
    });
  }
}
