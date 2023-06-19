import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/domain/pokedex/entities/stats.dart';
import 'package:pokedex/domain/pokedex/services/pokemon_service.dart';

class HttpPokemonService implements PokemonService {
  //injeção de dependencia
  final http.Client _client;
  const HttpPokemonService(this._client);

  String parsePokemonName(String name) {
    if (name.endsWith("-f")) {
      return name.replaceFirst('-f', ' ♀');
    } else {
      return name.replaceFirst('-m', ' ♂');
    }
  }

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
      imageUri: Uri.parse(responsePokemon['sprites']['other']
          ['official-artwork']['front_default']),
      number: responsePokemon['id'],
      name: parsePokemonName(responsePokemon['name']),
      type: parsedPokemonTypes,
      weight: responsePokemon['weight'],
      height: responsePokemon['height'],
      ability: responsePokemon['abilities'][0]['ability']['name'],
      stats: Stats(
        hp: responsePokemon['stats'][0]['base_stat'],
        attack: responsePokemon['stats'][1]['base_stat'],
        defense: responsePokemon['stats'][0]['base_stat'],
        specialAttack: responsePokemon['stats'][3]['base_stat'],
        specialDefense: responsePokemon['stats'][4]['base_stat'],
        speed: responsePokemon['stats'][5]['base_stat'],
      ),
    );
    return pokemon;
  }

  @override
  Future<Pokemon> getById({required int id}) async {
    final response =
        await _client.get(Uri.parse('pokeapi.co/api/v2/pokemon/$id'));
    if (response.statusCode == 200) {
      final responsePokemon = await compute(jsonDecode, response.body);
      final Pokemon pokemon = _pokemonFromJson(responsePokemon);

      return pokemon;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Pokemon> getByName({required String name}) async {
    final response =
        await _client.get(Uri.parse('pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode == 200) {
      final responsePokemon = await compute(jsonDecode, response.body);
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
    final response = await _client.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));

    final decodedResponse = await compute(jsonDecode, response.body);
    final results = decodedResponse['results'];
    final List<Pokemon> pokemonsList = [];

    for (var item in results) {
      final poke = await _client.get(Uri.parse(item['url']));
      final decodedPokemon = _pokemonFromJson(json.decode(poke.body));
      pokemonsList.add(decodedPokemon);
    }

    return pokemonsList;
  }
}
