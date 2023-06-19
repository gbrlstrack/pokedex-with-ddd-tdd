import 'package:flutter/foundation.dart';
import 'package:pokedex/domain/pokedex/entities/stats.dart';

import 'elemental_type.dart';

class Pokemon {
  final Uri imageUri;
  final int number;
  final String name;
  final List<ElementalType> type;
  final int weight;
  final int height;
  final String ability;
  final Stats stats;

  const Pokemon._({
    required this.imageUri,
    required this.number,
    required this.name,
    required this.type,
    required this.height,
    required this.weight,
    required this.ability,
    required this.stats,
  });

  factory Pokemon({
    required Uri imageUri,
    required int number,
    required String name,
    required List<ElementalType> type,
    required int weight,
    required int height,
    required String ability,
    required Stats stats,
  }) {
    final parsedName = name.toLowerCase();
    final firstCharacter = parsedName[0].toUpperCase();
    final capitalizedName =
        firstCharacter + parsedName.substring(1, parsedName.length);

    return Pokemon._(
      imageUri: imageUri,
      number: number,
      name: capitalizedName,
      type: type,
      height: height,
      weight: weight,
      ability: ability,
      stats: stats,
    );
  }

  @override
  String toString() {
    return 'Pokemon{imageUri: $imageUri, number: $number, name: $name, type: $type}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pokemon &&
          runtimeType == other.runtimeType &&
          imageUri == other.imageUri &&
          number == other.number &&
          name == other.name &&
          listEquals(type, other.type);

  @override
  int get hashCode =>
      imageUri.hashCode ^ number.hashCode ^ name.hashCode ^ type.hashCode;

  String getFormattedPokemonNumber() {
    if (number < 10) {
      return '#00$number';
    } else if (number < 100) {
      return '#0$number';
    }
    return '#$number';
  }
}
