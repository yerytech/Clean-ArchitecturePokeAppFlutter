import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebadeclases/presentation/provider/pokemon_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemon = ref.watch(pokeProvider);
    final counter = ref.watch(counterProvider);
    var size = MediaQuery.of(context).size;
    Color color = const Color.fromARGB(255, 185, 226, 245);
    return MaterialApp(
      title: 'Pokemon',
      home: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          backgroundColor: color,
          centerTitle: true,
          title: Text(
            pokemon.value!.name.toString(),
            style: TextStyle(
              fontSize: size.height * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              // color: color,
              height: size.height * 0.6,
              width: double.infinity,
              child: pokemon.when(
                data:
                    (data) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: size.height * 0.5,
                          child: Image.network(data.imageUrl),
                        ),
                        Text(
                          data.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                error: (error, stack) => Center(child: Text("$error")),
                loading:
                    () => SizedBox(
                      width: double.infinity,
                      height: size.height * 0.5,
                      child: Center(child: CircularProgressIndicator()),
                    ),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.purple,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      color: Colors.white,
                      iconSize: size.height * 0.07,
                      onPressed: () {
                        if (counter >= 2) {
                          ref.watch(counterProvider.notifier).state--;
                        }
                        return;
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      color: Colors.white,
                      iconSize: size.height * 0.07,
                      onPressed: () {
                        ref.watch(counterProvider.notifier).state++;
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
