import 'package:flutter/material.dart';

enum ElementalType {
  bug,
  dragon,
  fairy,
  fire,
  ghost,
  ground,
  normal,
  psychic,
  steel,
  dark,
  electric,
  fighting,
  flying,
  grass,
  ice,
  poison,
  rock,
  water,
}

extension ElementalTypeExtension on ElementalType {
  String toLocalized() {
    switch (this) {
      case ElementalType.bug:
        return "Bug";
      case ElementalType.dragon:
        return "Dragon";
      case ElementalType.fairy:
        return "Fairy";
      case ElementalType.fire:
        return "Fire";
      case ElementalType.ghost:
        return "Ghost";
      case ElementalType.ground:
        return "Ground";
      case ElementalType.normal:
        return "Normal";
      case ElementalType.psychic:
        return "Psychic";
      case ElementalType.steel:
        return "Steel";
      case ElementalType.dark:
        return "Dark";
      case ElementalType.electric:
        return "Electric";
      case ElementalType.fighting:
        return "Fighting";
      case ElementalType.flying:
        return "Flying";
      case ElementalType.grass:
        return "Grass";
      case ElementalType.ice:
        return "Ice";
      case ElementalType.poison:
        return "Poison";
      case ElementalType.rock:
        return "Rock";
      case ElementalType.water:
        return "Water";
    }
  }
}

extension ParseElementalType on String {
  ElementalType toElementalType() {
    switch (this) {
      case 'bug':
        return ElementalType.bug;
      case 'dragon':
        return ElementalType.dragon;
      case 'fairy':
        return ElementalType.fairy;
      case 'fire':
        return ElementalType.fire;
      case 'ghost':
        return ElementalType.ghost;
      case 'ground':
        return ElementalType.ground;
      case 'normal':
        return ElementalType.normal;
      case 'psychic':
        return ElementalType.psychic;
      case 'steel':
        return ElementalType.steel;
      case 'dark':
        return ElementalType.dark;
      case 'electric':
        return ElementalType.electric;
      case 'fighting':
        return ElementalType.fighting;
      case 'flying':
        return ElementalType.flying;
      case 'grass':
        return ElementalType.grass;
      case 'ice':
        return ElementalType.ice;
      case 'poison':
        return ElementalType.poison;
      case 'rock':
        return ElementalType.rock;
      case 'water':
        return ElementalType.water;
      default:
        return ElementalType.normal;
    }
  }
}

extension GetElementalTypeColor on ElementalType {
  Color getColor() {
    switch (this) {
      case ElementalType.dragon:
        return Colors.deepPurpleAccent;
      case ElementalType.fairy:
        return Colors.pinkAccent.shade100;
      case ElementalType.bug:
        return const Color(0xff2CDAB1);
      case ElementalType.fire:
        return Colors.redAccent;
      case ElementalType.grass:
        return const Color(0xff2CDAB1);
      case ElementalType.water:
        return const Color(0xff58ABF6);
      case ElementalType.normal:
        return Colors.grey;
      case ElementalType.poison:
        return const Color(0xff9F5BBA);
      case ElementalType.electric:
        return const Color(0xffFFCE4B);
      case ElementalType.ghost:
        return Colors.deepPurple.shade800;
      case ElementalType.ground:
        return Colors.brown.shade400;
      case ElementalType.psychic:
        return Colors.pink.shade400;
      case ElementalType.fighting:
        return Colors.deepOrange.shade500;
      case ElementalType.rock:
        return Colors.lime.shade900;
      case ElementalType.ice:
        return Colors.cyanAccent.shade400;
      case ElementalType.steel:
        return Colors.blueGrey.shade200;
      case ElementalType.dark:
        return Colors.grey.shade800;
      case ElementalType.flying:
        return Colors.purple.shade200;
      default:
        return const Color(0xff303943);
    }
  }
}
