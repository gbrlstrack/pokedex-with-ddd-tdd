import 'package:flutter/material.dart';
import 'package:pokedex/configure_dependency_injection.dart';
import 'package:pokedex/presentation/pokedex/screens/pokemon_list_screen.dart';

void main() {
  configureDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PokemonListScreen(title: 'Pokedex'),
    );
  }
}
