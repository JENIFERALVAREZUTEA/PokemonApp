class Pokemon{
  String name;
  String img;
  List < String> type;
  Pokemon({
    required this.name,
    required this.img,
    required this.type,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"], 
    img: json["img"], 
    type: List<String>.from(json["type"].map((e)=>e)),
    );

}