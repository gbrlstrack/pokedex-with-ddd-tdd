import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';
import 'package:pokedex/presentation/pokedex/widgets/atoms/pokemon_type_chip.dart';

class PokemonCharacteristics extends StatelessWidget {
  const PokemonCharacteristics({
    Key? key,
    required this.pokemonImage,
    required this.pokemonTypes,
  }) : super(key: key);

  final Uri pokemonImage;
  final List<ElementalType> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: pokemonTypes
              .map((elementalType) => Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 16),
                    child: PokemonTypeChip(type: elementalType),
                  ))
              .toList(),
        ),
        Expanded(
          child: Image.network(
            alignment: Alignment.bottomRight,
            pokemonImage.toString(),
            // fit: BoxFit.contain,
            height: 120,
          ),
        ),
      ],
    );
  }
}
