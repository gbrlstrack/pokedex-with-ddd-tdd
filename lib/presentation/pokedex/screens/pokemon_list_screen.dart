import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/pokedex/screens/pokemon_details_screen.dart';
import 'package:pokedex/presentation/pokedex/viewmodels/pokemon_list_screen/pokemon_list_screen_bloc.dart';
import 'package:pokedex/presentation/pokedex/widgets/organisms/pokemon_card.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.title});

  final String title;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late final PokemonListScreenBloc bloc;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I();
    bloc.add(GetPokemonListEvent());
    scrollController.addListener(
      () {
        if (scrollController.offset ==
            scrollController.position.maxScrollExtent) {
          bloc.add(GetPokemonListOnEndReached());
        }
      },
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<PokemonListScreenBloc, PokemonListScreenState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.isLoading && state.pokemonList.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.red));
          }
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 140,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return PokemonDetailsScreen(
                                    pokemon: state.pokemonList[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: PokemonCard(pokemon: state.pokemonList[index]),
                        ),
                      );
                    },
                    childCount: state.pokemonList.length,
                  ),
                ),
              ),
              if (state.isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: Colors.red),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
