import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokedex/entities/elemental_type.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({Key? key, required this.type, this.hasColor = false})
      : super(key: key);

  final ElementalType type;
  final bool hasColor;

  // LinearGradient _getColor(ElementalType type) {
  //   switch (type) {
  //     case ElementalType.bug:
  //       return const LinearGradient(
  //           colors: [Color(0xff729f3f), Color(0xff729f3f)]);
  //     case ElementalType.dragon:
  //       return const LinearGradient(
  //           colors: [Color(0xff53a4cf), Color(0xfff16e57)]);
  //     case ElementalType.fairy:
  //       return const LinearGradient(
  //           colors: [Color(0xfffdb9e9), Color(0xfffdb9e9)]);
  //     case ElementalType.fire:
  //       return const LinearGradient(
  //           colors: [Color(0xfffd7d24), Color(0xfffd7d24)]);
  //     case ElementalType.ghost:
  //       return const LinearGradient(
  //           colors: [Color(0xff7b62a3), Color(0xff7b62a3)]);
  //     case ElementalType.ground:
  //       return const LinearGradient(
  //           colors: [Color(0xfff7de3f), Color(0xffab9842)]);
  //     case ElementalType.normal:
  //       return const LinearGradient(
  //           colors: [Color(0xffa4acaf), Color(0xffa4acaf)]);
  //     case ElementalType.psychic:
  //       return const LinearGradient(
  //           colors: [Color(0xfff366b9), Color(0xfff366b9)]);
  //     case ElementalType.steel:
  //       return const LinearGradient(
  //           colors: [Color(0xff9eb7b8), Color(0xff9eb7b8)]);
  //     case ElementalType.dark:
  //       return const LinearGradient(
  //           colors: [Color(0xff707070), Color(0xff707070)]);
  //     case ElementalType.electric:
  //       return const LinearGradient(
  //           colors: [Color(0xffeed535), Color(0xffeed535)]);
  //     case ElementalType.fighting:
  //       return const LinearGradient(
  //           colors: [Color(0xffd56723), Color(0xffd56723)]);
  //     case ElementalType.flying:
  //       return const LinearGradient(
  //           end: Alignment.bottomCenter,
  //           begin: Alignment.topCenter,
  //           colors: [Color(0xff3dc7ef), Color(0xffbdb9b8)]);
  //     case ElementalType.grass:
  //       return const LinearGradient(
  //           colors: [Color(0xff9bcc50), Color(0xff9bcc50)]);
  //     case ElementalType.ice:
  //       return const LinearGradient(
  //           colors: [Color(0xff51c4e7), Color(0xff51c4e7)]);
  //     case ElementalType.poison:
  //       return const LinearGradient(
  //           colors: [Color(0xffb97fc9), Color(0xffb97fc9)]);
  //     case ElementalType.rock:
  //       return const LinearGradient(
  //           colors: [Color(0xfffdb9e9), Color(0xfffdb9e9)]);
  //     case ElementalType.water:
  //       return const LinearGradient(
  //           colors: [Color(0xff4592c4), Color(0xff4592c4)]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: hasColor ? type.getColor() : Colors.white.withOpacity(0.3),
      ),
      child: Center(
        child: Text(
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'CircularStd',
            color: Colors.white,
          ),
          type.toLocalized(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
