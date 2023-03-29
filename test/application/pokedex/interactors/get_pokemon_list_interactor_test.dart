import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/application/pokedex/interactors/get_pokemon_list_interactor.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/domain/pokedex/services/pokemon_service.dart';

class MockPokemonService extends Mock implements PokemonService {}

void main() {
  late PokemonService service;
  late GetPokemonListInteractor interactor;
  group('getPokemonListInteractor', () {
    setUp(() {
      service = MockPokemonService();
      interactor = GetPokemonListInteractor(service);
    });
    test('should return a pokemon list on success', () async {
      final expectedPokemonList = [
        Pokemon(
            imageUri: Uri.https("raw.githubusercontent.com",
                "/PokeAPI/sprites/master/sprites/pokemon/1.png"),
            number: 1,
            name: "Bulbasaur",
            type: [ElementalType.grass, ElementalType.poison]),
        Pokemon(
            imageUri: Uri.https("raw.githubusercontent.com",
                "/PokeAPI/sprites/master/sprites/pokemon/2.png"),
            number: 2,
            name: "Ivysaur",
            type: [ElementalType.grass, ElementalType.poison]),
      ];

      when(() => service.getPaginatedList(limit: 2))
          .thenAnswer((_) => Future.value(expectedPokemonList));

      final result = await interactor(offset: 0, limit: 2);

      expect(result, expectedPokemonList);
    });

    test('should call pokemonService only once', () async {
      when(() => service.getPaginatedList(limit: 2))
          .thenAnswer((_) => Future.value([]));

      await interactor(offset: 0, limit: 2);

      verify(() => service.getPaginatedList(limit: 2)).called(1);
    });

    test('should bubble up an Exception on error', () {
      when(() => service.getPaginatedList(limit: 2)).thenThrow(Exception());

      expect(() => interactor(limit: 2, offset: 0), throwsA(isA<Exception>()));
    });
  });
}
