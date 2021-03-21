import 'package:flutter/material.dart';
import 'package:poke_dec/const.dart';
import 'package:poke_dec/logic/json_handle.dart';
import 'package:poke_dec/screen/pokemon_select_screen.dart';

import 'screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ポケモン図鑑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'dot',
        backgroundColor: kPokeBeige,
        scaffoldBackgroundColor: kPokeBeige,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, color: kPokeBlack),
          bodyText1: TextStyle(fontSize: 20, color: kPokeBlack),
        ),
      ),
      initialRoute: HomeScreen.id,
      routes: <String, WidgetBuilder>{
        HomeScreen.id: (context) => HomeScreen(),
        PokemonSelectScreen.id: (context) => PokemonSelectScreen(),
      },
    );
  }
}
