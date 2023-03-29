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
  fighter,
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
        return "BUG";
      case ElementalType.dragon:
        return "DRAGON";
      case ElementalType.fairy:
        return "FAIRY";
      case ElementalType.fire:
        return "FIRE";
      case ElementalType.ghost:
        return "GHOST";
      case ElementalType.ground:
        return "GROUND";
      case ElementalType.normal:
        return "NORMAL";
      case ElementalType.psychic:
        return "PSYCHIC";
      case ElementalType.steel:
        return "STEEL";
      case ElementalType.dark:
        return "DARK";
      case ElementalType.electric:
        return "ELECTRIC";
      case ElementalType.fighter:
        return "FIGHTER";
      case ElementalType.flying:
        return "FLYING";
      case ElementalType.grass:
        return "GRASS";
      case ElementalType.ice:
        return "ICE";
      case ElementalType.poison:
        return "POISON";
      case ElementalType.rock:
        return "ROCK";
      case ElementalType.water:
        return "WATER";
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
      case 'fighter':
        return ElementalType.fighter;
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
        throw Exception('Invalid elemental type');
    }
  }
}
