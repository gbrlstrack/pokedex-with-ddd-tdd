import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/presentation/pokedex/widgets/molecules/pokemon_basic_infos.dart';
import 'package:pokedex/presentation/pokedex/widgets/molecules/pokemon_characteristics.dart';

var myFile = File('lib/presentation/assets/images/pokeball.png');

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          pokemon.type[0].getColor(),
          pokemon.type.length < 2
              ? Color.alphaBlend(
                  Colors.black.withOpacity(0.35), pokemon.type[0].getColor())
              : pokemon.type[1].getColor()
        ]),
        boxShadow: kElevationToShadow[4],
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Stack(children: [
        Positioned(
          bottom: -30,
          right: -70,
          child: Image.network(
              fit: BoxFit.cover,
              height: 130,
              color: Colors.white.withOpacity(0.3),
              'https://www.pngall.com/wp-content/uploads/4/Pokeball-PNG-Free-Download.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: PokemonBasicInfos(
                  pokemonNumber: pokemon.getFormattedPokemonNumber(),
                  pokemonName: pokemon.name,
                ),
              ),
              Expanded(
                flex: 3,
                child: PokemonCharacteristics(
                  pokemonImage: pokemon.imageUri,
                  pokemonTypes: pokemon.type,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
