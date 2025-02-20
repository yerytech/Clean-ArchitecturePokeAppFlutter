import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebadeclases/core/Dioclient/dioclient.dart';

import 'package:pruebadeclases/data/datasource/get.pokemon.dart';

import 'package:pruebadeclases/data/repository/getpokemonimpl.dart';
import 'package:pruebadeclases/domain/resository/getpokemonrepository.dart';
import 'package:pruebadeclases/domain/usecase/get_pokemon.dart';

final httpclientProvider = Provider<DioHttpClient>((ref) {
  return DioHttpClient();
});

final getpokeProvider = Provider<GetPokemon>((ref) {
  final http = ref.watch(httpclientProvider);
  return GetPokemon(http);
});

final getPokemonRepositoryProvider = Provider<GetpokemonRepository>((ref) {
  final getpo = ref.watch(getpokeProvider);

  return Getpokemonimpl(getPokemon: getpo);
});

final pokemonProvider = Provider((ref) {
  final respository = ref.watch(getPokemonRepositoryProvider);
  return GetPokemonUseCase(respository);
});

final pokeProvider = FutureProvider((ref) async {
  final usecase = ref.watch(pokemonProvider);
  final id = ref.watch(counterProvider);
  return usecase.gepoke(id);
});

final counterProvider = StateProvider<int>((ref) => 1);
