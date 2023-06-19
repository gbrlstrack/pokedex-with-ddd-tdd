import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/pokemon.dart';
import 'package:pokedex/presentation/pokedex/widgets/molecules/pokemon_stats_bar.dart';

import '../widgets/atoms/pokemon_type_chip.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({Key? key, required this.pokemon})
      : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: pokemon.type[0].getColor(),
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              // border: BoxBorder,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width / 2, 30),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  pokemon.type[0].getColor(),
                  pokemon.type.length < 2
                      ? Color.alphaBlend(Colors.black.withOpacity(0.35),
                          pokemon.type[0].getColor())
                      : pokemon.type[1].getColor(),
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        pokemon.getFormattedPokemonNumber(),
                        style: const TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            heightFactor: 1.1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Image.network(
                    pokemon.imageUri.toString(),
                    height: 200,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pokemon.type.map((elementalType) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: PokemonTypeChip(
                          type: elementalType,
                          hasColor: true,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        Text(
                          'Seed',
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: pokemon.type[0].getColor(),
                          ),
                        ),
                        const Text('Species')
                      ]),
                      Column(children: [
                        Text(
                          pokemon.height.toString(),
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: pokemon.type[0].getColor(),
                          ),
                        ),
                        const Text('Height')
                      ]),
                      Column(children: [
                        Text(
                          pokemon.weight.toString(),
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: pokemon.type[0].getColor(),
                          ),
                        ),
                        const Text('Weight')
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text(
                            'Smart Candy',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: pokemon.type[0].getColor(),
                            ),
                          ),
                          const Text('Candy')
                        ]),
                        Column(children: [
                          Text(
                            "Kanto",
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: pokemon.type[0].getColor(),
                            ),
                          ),
                          const Text('Location')
                        ]),
                      ]),
                ),
                PokemonStatsBar(
                    pokemonStats: pokemon.stats, pokemonTypes: pokemon.type),
                Column(
                  children: [
                    Text(
                      'Evolution',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: pokemon.type[0].getColor(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
