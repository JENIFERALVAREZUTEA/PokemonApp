import 'package:flutter/material.dart';
import 'package:pokemon_app/ui/widgets/item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  String name;
  String image;

  List <String> types;

  ItemPokemonWidget({
    required this.name,
    required this.image,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
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
            //    Column(
            //      children: 
             //       types.map((e) => ItemTypeWidget()).toList(),
            //    ),
            ...types.map((e) => ItemTypeWidget(text: e,)).toList(),



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
