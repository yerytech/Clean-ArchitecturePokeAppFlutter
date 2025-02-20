import 'package:pruebadeclases/data/model/pokemodel.dart';
import 'package:pruebadeclases/domain/resository/getpokemonrepository.dart';

class GetPokemonUseCase {
  final GetpokemonRepository _getpokemonRepository;
  GetPokemonUseCase(this._getpokemonRepository);

  Future<PokemonModel> gepoke(int id) {
    return _getpokemonRepository.getpokemon(id);
  }
}
