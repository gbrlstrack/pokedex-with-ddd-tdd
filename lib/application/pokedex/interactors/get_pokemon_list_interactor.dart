import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/domain/pokedex/services/pokemon_service.dart';

class GetPokemonListInteractor {
  final PokemonService _service;

  const GetPokemonListInteractor(this._service);

  Future<List<Pokemon>> call({required int limit, required int offset}) async {
    final pokemonList =
        await _service.getPaginatedList(limit: limit, offset: offset);

    return pokemonList;
  }
}
