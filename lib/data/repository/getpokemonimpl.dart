import 'package:pruebadeclases/data/datasource/get.pokemon.dart';
import 'package:pruebadeclases/data/model/pokemodel.dart';

import 'package:pruebadeclases/domain/resository/getpokemonrepository.dart';

class Getpokemonimpl implements GetpokemonRepository {
  final GetPokemon _getPokemon;

  Getpokemonimpl({required GetPokemon getPokemon}) : _getPokemon = getPokemon;
  @override
  Future<PokemonModel> getpokemon(int id) async {
    final res = await _getPokemon.getPokemon(id);

    return res;
  }
}
