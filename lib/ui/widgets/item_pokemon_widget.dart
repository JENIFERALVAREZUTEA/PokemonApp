import 'package:flutter/material.dart';



class ItemPokemonWidget extends StatelessWidget {
 
 String name;
 String image;
 
 ItemPokemonWidget({
  required this.name,
  required this.image,
 });

  @override
  Widget build(BuildContext context) {
    return        Container(
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
                                name,
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
                            child: Image.network(image),
                          ),
                      ],
                    ),
                    
                  );
  }
}