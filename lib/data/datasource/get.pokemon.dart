import 'dart:developer';

import 'package:pruebadeclases/core/httpclient/http_client.dart';
import 'package:pruebadeclases/data/model/pokemodel.dart';

class GetPokemon {
  final HttpClient httpClient;

  GetPokemon(this.httpClient);

  Future<PokemonModel> getPokemon(int id) async {
    try {
      final response = await httpClient.request(
        "https://pokeapi.co/api/v2/pokemon/$id",
        method: HttpMethod.get,
      );
      final Map<String, dynamic> data = response.data;
      return PokemonModel.fromJson(data);
    } catch (e) {
      log("yery este es el error $e");

      throw Exception("Error fatal yery $e");
    }
  }
}
