import 'package:flutter/material.dart';

class PokemonBasicInfos extends StatelessWidget {
  const PokemonBasicInfos({
    Key? key,
    required this.pokemonNumber,
    required this.pokemonName,
  }) : super(key: key);

  final String pokemonNumber;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pokemonName,
          style: const TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Text(
          pokemonNumber,
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
