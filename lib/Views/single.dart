import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/pokemon.dart';

class Single extends StatefulWidget {
  final String pokemonName;
  const Single({super.key, required this.pokemonName});

  @override
  State<Single> createState() => _SinglePageState();
}

class _SinglePageState extends State<Single> {
  final ApiService apiService = ApiService();
  late Future<Pokemon> pokemonFuture;

  @override
  void initState() {
    super.initState();
    pokemonFuture = apiService.fetchPokemonDetails(widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(widget.pokemonName.toUpperCase())),
      body: FutureBuilder<Pokemon>(
        future: pokemonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final pokemon = snapshot.data!;

            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Container(

                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (pokemon.imageUrl.isNotEmpty)
                              Hero(
                                tag: pokemon.name,
                                child: Image.network(
                                  pokemon.imageUrl,
                                  height: 250,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            const SizedBox(height: 30),

                            Text(
                              pokemon.name.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: const Divider(height: 40, thickness: 1),
                            ),

                            Text("Altura: ${(pokemon.height ?? 0) / 10} m",
                                style: const TextStyle(fontSize: 18)),
                            Text("Peso: ${(pokemon.weight ?? 0) / 10} kg",
                                style: const TextStyle(fontSize: 18)),

                            const SizedBox(height: 30),

                            const Text(
                              "Habilidades:",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 15),

                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: (pokemon.abilities ?? [])
                                  .map((habilidade) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: Text(habilidade, style: const TextStyle(fontSize: 16)),
                              ))
                                  .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}