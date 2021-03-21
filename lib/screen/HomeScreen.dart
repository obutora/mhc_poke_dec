import 'package:flutter/material.dart';
import 'package:poke_dec/const.dart';
import 'package:poke_dec/decoration/side.dart';
import 'package:poke_dec/logic/json_handle.dart';
import 'package:poke_dec/logic/pokemon_model.dart';
import 'package:poke_dec/screen/pokemon_select_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Text(
                'ぽけもん を　えらぼう！',
                style: Theme.of(context).textTheme.headline1,
              )),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPokeBeige,
                  side: pokeDialogBorder(),
                ),
                child: Text(
                  'スタート',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () async {
                  final List<Pokemon> pokemonList = await initPokemonList();
                  Navigator.pushNamed(context, PokemonSelectScreen.id,
                      arguments: pokemonList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
