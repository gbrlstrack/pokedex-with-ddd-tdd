import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/domain/pokedex/services/pokemon_service.dart';
import 'package:pokedex/infrastructure/pokedex/services/http_pokemon_service.dart';

import '../fixtures/get_pokemon_by_id_fixture.dart';
import '../fixtures/get_pokemon_list_fixture.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late PokemonService service;
  late http.Client httpMock;
  group('getById', () {
    setUp(() {
      httpMock = MockHttpClient();
      service = HttpPokemonService(httpMock);
    });
    test('should return a valid Pokemon on success', () async {
      //Arrange
      final expectedPokemon = Pokemon(
          imageUri: Uri.https("raw.githubusercontent.com",
              "/PokeAPI/sprites/master/sprites/pokemon/2.png"),
          number: 2,
          name: "Ivysaur",
          type: [ElementalType.grass, ElementalType.poison]);
      const pokemonId = 2;
      final uri = Uri.https('pokeapi.co', '/api/v2/pokemon/$pokemonId');
      final mockedResponse = http.Response(ivysaurFixture, 200);
      when(() => httpMock.get(uri))
          .thenAnswer((_) => Future.value(mockedResponse));

      //Act
      final result = await service.getById(id: pokemonId);

      //Assert
      expect(result, expectedPokemon);
    });

    test('should return an error when request failed', () async {
      //Arrange
      const pokemonId = 2;
      final uri = Uri.https('pokeapi.co', '/api/v2/pokemon/$pokemonId');
      when(() => httpMock.get(uri)).thenThrow(PlatformException(code: "500"));
      //Act

      //Assert
      expect(() => service.getById(id: pokemonId),
          throwsA(isA<PlatformException>()));
    });
  });

  group('getByName', () {
    setUp(() {
      httpMock = MockHttpClient();
      service = HttpPokemonService(httpMock);
    });
    test('should return a valid Pokemon on success', () async {
      //Arrange
      final expectedPokemon = Pokemon(
          imageUri: Uri.https("raw.githubusercontent.com",
              "/PokeAPI/sprites/master/sprites/pokemon/2.png"),
          number: 2,
          name: "Ivysaur",
          type: [ElementalType.grass, ElementalType.poison]);
      const pokemonName = 'ivysaur';
      final uri = Uri.https('pokeapi.co', '/api/v2/pokemon/$pokemonName');
      final mockedResponse = http.Response(ivysaurFixture, 200);
      when(() => httpMock.get(uri))
          .thenAnswer((_) => Future.value(mockedResponse));

      //Act
      final result = await service.getByName(name: pokemonName);

      //Assert
      expect(result, expectedPokemon);
    });
  });

  group('getPaginatedList', () {
    setUp(() {
      httpMock = MockHttpClient();
      service = HttpPokemonService(httpMock);
    });
    test('should return a valid pokemon list on success', () async {
      //Arrange
      final uri = Uri.https('pokeapi.co', '/api/v2/pokemon?limit=2&offset=0');
      final uriPokemon1 = Uri.https('pokeapi.co', '/api/v2/pokemon/bulbasaur');
      final uriPokemon2 = Uri.https('pokeapi.co', '/api/v2/pokemon/ivysaur');
      final List<Pokemon> expectedPokemonList = [
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

      final mockedResponse = http.Response(pokemonListFixture, 200);
      final mockedBulbasaurResponse = http.Response(bulbasaurFixture, 200);
      final mockedIvysaurResponse = http.Response(ivysaurFixture, 200);

      when(() => httpMock.get(uri))
          .thenAnswer((_) => Future.value(mockedResponse));
      when(() => httpMock.get(uriPokemon1))
          .thenAnswer((_) => Future.value(mockedBulbasaurResponse));
      when(() => httpMock.get(uriPokemon2))
          .thenAnswer((_) => Future.value(mockedIvysaurResponse));

      //Act
      final result = await service.getPaginatedList(limit: 2);

      //Assert
      expect(result, expectedPokemonList);
    });
  });
}
