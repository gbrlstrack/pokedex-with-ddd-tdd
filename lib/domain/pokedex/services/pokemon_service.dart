import '../entities/pokemon.dart';

abstract class PokemonService {
  Future<Pokemon> getById({required int id});
  Future<Pokemon> getByName({required String name});
  Future<List<Pokemon>> getPaginatedList({
    required int limit,
    int offset = 0,
  });
}
