import 'package:pruebadeclases/data/model/pokemodel.dart';

abstract class GetpokemonRepository {
  Future<PokemonModel> getpokemon(int id);
}
