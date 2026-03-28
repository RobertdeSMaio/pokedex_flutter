import 'package:flutter/material.dart';
import '../services/fav_service.dart';
import '../Views/single.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavService.favoritePokemons;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text('Você ainda não tem favoritos salvos.'),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final pokemon = favorites[index];
          return ListTile(
            leading: Hero(
              tag: 'fav-${pokemon.name}',
              child: Image.network(
                pokemon.imageUrl,
                width: 50,
              ),
            ),
            title: Text(
              pokemon.name.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.star, color: Colors.yellow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Single(pokemonName: pokemon.name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}