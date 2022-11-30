import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/ui/widgets/item_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  List<PokemonModel> pokemonsModel = [];

  @override
  initState() {
    super.initState();
    getdataPokemon();
  }

  getdataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
    //  pokemons = myMap["pokemon"];
    pokemonsModel = myMap["pokemon"].map<PokemonModel>((e)=>PokemonModel.fromJson(e)).toList();
    print(pokemonsModel);
      setState(() {});

//pokemons.forEach((element){
      // print(element["name"]);
//});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Pokedex",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 1.35,
                    children:
                        pokemonsModel
                        .map(
                          (e) => ItemPokemonWidget(
                           // name: e.name,
                            //image: e.img,
                            //types: e.type,
                            pokemon: e,
                            ),
                            )
                            .toList()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
