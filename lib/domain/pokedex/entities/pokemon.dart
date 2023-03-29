import 'package:flutter/foundation.dart';

import 'elemental_type.dart';

class Pokemon {
  final Uri imageUri;
  final int number;
  final String name;
  final List<ElementalType> type;

  const Pokemon._({
    required this.imageUri,
    required this.number,
    required this.name,
    required this.type,
  });

  factory Pokemon({
    required Uri imageUri,
    required int number,
    required String name,
    required List<ElementalType> type,
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
}
