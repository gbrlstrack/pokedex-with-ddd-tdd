import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/domain/pokedex/entities/stats.dart';

class PokemonStatsBar extends StatelessWidget {
  const PokemonStatsBar(
      {super.key, required this.pokemonStats, required this.pokemonTypes});

  final Stats pokemonStats;
  final List<ElementalType> pokemonTypes;

  double getStatusPercentage(int stat) {
    return stat / 255;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Stats',
              style: TextStyle(
                color: pokemonTypes[0].getColor(),
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    'HP',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: pokemonTypes[0].getColor(),
                      fontFamily: 'CircularStd',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: getStatusPercentage(pokemonStats.hp),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        pokemonTypes[0].getColor()),
                    backgroundColor: Colors.grey[300],
                    minHeight: 10,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'ATK',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: pokemonTypes[0].getColor(),
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: getStatusPercentage(pokemonStats.attack),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          pokemonTypes[0].getColor()),
                      backgroundColor: Colors.grey[300],
                      minHeight: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'DEF',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: pokemonTypes[0].getColor(),
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: getStatusPercentage(pokemonStats.defense),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        pokemonTypes[0].getColor()),
                    backgroundColor: Colors.grey[300],
                    minHeight: 10,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'S.ATK',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: pokemonTypes[0].getColor(),
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: getStatusPercentage(pokemonStats.specialAttack),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          pokemonTypes[0].getColor()),
                      backgroundColor: Colors.grey[300],
                      minHeight: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    'S.DEF',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: pokemonTypes[0].getColor(),
                      fontFamily: 'CircularStd',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: getStatusPercentage(pokemonStats.specialDefense),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        pokemonTypes[0].getColor()),
                    backgroundColor: Colors.grey[300],
                    minHeight: 10,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'SPEED',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: pokemonTypes[0].getColor(),
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: getStatusPercentage(pokemonStats.speed),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          pokemonTypes[0].getColor()),
                      backgroundColor: Colors.grey[300],
                      minHeight: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
