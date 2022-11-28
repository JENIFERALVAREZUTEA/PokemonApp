import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {

  getdataPokemon()async{
    Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
  http.Response response = await http.get(_uri);
  print(response.statusCode);
  print(response.body);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
          child:Column(
            children: [
              Text("Pokedex",
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount:2,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                ],
                )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
