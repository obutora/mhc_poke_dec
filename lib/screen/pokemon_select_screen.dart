import 'package:flutter/material.dart';
import 'package:poke_dec/const.dart';
import 'package:poke_dec/decoration/animation/ball_animation.dart';
import 'package:poke_dec/decoration/side.dart';
import 'package:poke_dec/logic/json_handle.dart';
import 'package:poke_dec/logic/pokemon_model.dart';
import 'package:simple_animations/simple_animations.dart';

class PokemonSelectScreen extends StatelessWidget {
  static String id = 'PokemonSelectScreen';
  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemonList = ModalRoute.of(context).settings.arguments;

    final Pokemon pokemon1 = selectPokemon(pokemonList);
    final Pokemon pokemon2 = selectPokemon(pokemonList);
    final Pokemon pokemon3 = selectPokemon(pokemonList);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotateBall(
                  delay: 150,
                  onPressed: () {
                    showPokeDialog(context, pokemon1);
                  },
                ),
                RotateBall(
                  delay: 300,
                  onPressed: () {
                    showPokeDialog(context, pokemon2);
                  },
                ),
                RotateBall(
                  delay: 450,
                  onPressed: () {
                    showPokeDialog(context, pokemon3);
                  },
                ),
              ],
            ),
            const SizedBox(height: 33),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: PokeMessegeContainer(
                child: Text(
                  'そこに ３びき\nポケモンが いる じゃろう ！\n\nすきなのを おまえに やろう！',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showPokeDialog(BuildContext context, Pokemon pokemon) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: kPokeBeige,
          title: Text(
            'きみ の ポケモンは',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/ball.png',
              image: pokemon.imgUrl,
            ),
            PlayAnimation<double>(
              curve: Curves.easeInOutExpo,
              duration: const Duration(seconds: 4),
              tween: Tween<double>(begin: 0, end: 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pokemon.jpnName,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              builder: (context, child, value) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
