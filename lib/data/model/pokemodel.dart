class PokemonModel {
  final String name;
  final String imageUrl;

  PokemonModel({required this.name, required this.imageUrl});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json["name"],
      imageUrl: json["sprites"]["other"]["home"]["front_default"],
    );
  }
}
