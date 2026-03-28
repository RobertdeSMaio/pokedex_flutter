import '../models/pokemon.dart';

class FavService {
  static List<Pokemon> favoritePokemons = [];

  static void toggleFavorite(Pokemon pokemon) {
    if (favoritePokemons.any((p) => p.name == pokemon.name)) {
      favoritePokemons.removeWhere((p) => p.name == pokemon.name);
      pokemon.isFavorite = false;
    } else {
      favoritePokemons.add(pokemon);
      pokemon.isFavorite = true;
    }
  }

  static bool isFav(String name) {
    return favoritePokemons.any((p) => p.name == name);
  }
}