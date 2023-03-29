import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/domain/pokedex/services/pokemon_service.dart';

class HttpPokemonService implements PokemonService {
  //injeção de dependencia
  final http.Client _client;
  const HttpPokemonService(this._client);

  Pokemon _pokemonFromJson(responsePokemon) {
    final List<String> typeArray = [];
    responsePokemon['types'].forEach((e) {
      typeArray.add(e['type']['name']);
    });

    final List<ElementalType> parsedPokemonTypes = [];
    for (String type in typeArray) {
      parsedPokemonTypes.add(
        type.toElementalType(),
      );
    }

    final pokemon = Pokemon(
      imageUri: Uri.parse(responsePokemon['sprites']['front_default']),
      number: responsePokemon['id'],
      name: responsePokemon['name'],
      type: parsedPokemonTypes,
    );
    return pokemon;
  }

  @override
  Future<Pokemon> getById({required int id}) async {
    final response =
        await _client.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$id'));
    if (response.statusCode == 200) {
      final responsePokemon = jsonDecode(response.body);
      final Pokemon pokemon = _pokemonFromJson(responsePokemon);

      return pokemon;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Pokemon> getByName({required String name}) async {
    final response =
        await _client.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      final responsePokemon = jsonDecode(response.body);
      final Pokemon pokemon = _pokemonFromJson(responsePokemon);

      return pokemon;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Pokemon>> getPaginatedList({
    required int limit,
    int offset = 0,
  }) async {
    final response = await _client.get(
        Uri.https('pokeapi.co', '/api/v2/pokemon?limit=$limit&offset=$offset'));
    final decodedResponse = jsonDecode(response.body);
    final results = decodedResponse['results'];
    final List<Pokemon> pokemonsList = [];

    for (var item in results) {
      final poke = await getByName(name: item['name']);
      pokemonsList.add(poke);
    }

    return pokemonsList;
  }
}
