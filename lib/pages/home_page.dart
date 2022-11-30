import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {

List pokemons = [];


  getdataPokemon()async{
    Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
  http.Response response = await http.get(_uri);
 if(response.statusCode==200){
 Map<String,dynamic>myMap = json.decode(response.body);
pokemons = myMap["pokemon"];
print(pokemons);
 }
  
  }

  @override
  Widget build(BuildContext context) {

    getdataPokemon();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
          child:Column(
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Text("Pokedex",
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount:2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 1.35,
                children: [
                  Container(
                    decoration: BoxDecoration(
                    color: Color.fromARGB(255, 76, 196, 207),
                    borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -20,
                          right: -20,
                          child: Image.asset(
                          'assets/images/pokeball.png',
                          height: 120.0,
                          color: Colors.white.withOpacity(0.27),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 12.0),
                            child: Column(
                            children: [
                              Text(
                                "Bulbasur",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 6.0),
                                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.27),
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      offset: const Offset(4,4),
                                      blurRadius: 12.0
                                    )
                                  ]
                                ),
                                child: Text(
                                  "Grass",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  ),
                              ),
                            ],
                          ),
                          
                    ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.network(
                            "http://www.serebii.net/pokemongo/pokemon/001.png",
                          ),
                          ),
                      ],
                    ),
                    
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
