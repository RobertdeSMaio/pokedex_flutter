import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {

  final String baseUrl = "https://pokeapi.co/api/v2/pokemon";

  Future<List<Pokemon>> fetchPokemons(int offset) async {
    final response = await http.get(
      Uri.parse('$baseUrl?limit=20&offset=$offset'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((item) => Pokemon.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar Pokémon');
    }
  }

  Future<Pokemon> fetchPokemonDetails(String name) async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'),
    );

    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Pokémon não encontrado');
    }
  }
}