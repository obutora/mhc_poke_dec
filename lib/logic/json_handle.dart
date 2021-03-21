import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:poke_dec/logic/pokemon_model.dart';
import 'dart:math' as math;

Future<List<dynamic>> loadJson(String assetUrl) async {
  String rawData = await rootBundle.loadString(assetUrl);
  final List<dynamic> decode = json.decode(rawData);
  // print(decode);
  return decode;
}

Future<List<Pokemon>> initPokemonList() async {
  final List<dynamic> name = await loadJson('assets/name.json');
  final List<dynamic> data = await loadJson('assets/pokemons.json');

  List<Pokemon> pokemon = [];

  data.forEach((element) {
    final engName = element['name'];
    final worldNames =
        name.firstWhere((value) => value['name']['eng'] == engName);
    final String jpnName = worldNames['name']['jpn'];

    final pokeData = Pokemon(
      engName: element['name'],
      jpnName: jpnName,
      imgUrl: element['imageurl'],
    );

    pokemon.add(pokeData);
  });
  return pokemon;
}

Pokemon selectPokemon(List<Pokemon> pokemonList) {
  final int num = math.Random().nextInt(150);

  return pokemonList[num];
}
