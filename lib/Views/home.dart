import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/pokemon.dart';
import '../Views/single.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();

  List<Pokemon> _pokemons = [];
  int _currentPage = 0;
  final int _limit = 20;
  bool _isLoading = false;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadPage(_currentPage);
  }

  Future<void> _loadPage(int page) async {
    setState(() {
      _isLoading = true;
      _isSearching = false;
    });

    try {
      int offset = page * _limit;
      final newPokemons = await apiService.fetchPokemons(offset);

      setState(() {
        _pokemons = newPokemons;
        _currentPage = page;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar Pokémons')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _searchPokemon(String name) async {
    if (name.isEmpty) {
      _loadPage(0);
      return;
    }

    setState(() {
      _isLoading = true;
      _isSearching = true;
    });

    try {
      final pokemon = await apiService.fetchPokemonDetails(name.toLowerCase().trim());
      setState(() {
        _pokemons = [pokemon];
      });
    } catch (e) {
      setState(() => _pokemons = []);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokéDex'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar Pokémon por nome...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _isSearching
                    ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _loadPage(0);
                    })
                    : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Colors.white,
              ),
              onSubmitted: (value) => _searchPokemon(value),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Lista de Pokémons
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _pokemons.isEmpty
                ? const Center(child: Text('Nenhum Pokémon encontrado.'))
                : ListView.builder(
              itemCount: _pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = _pokemons[index];
                return ListTile(
                  leading: Hero(
                    tag: pokemon.name,
                    child: Image.network(
                      pokemon.imageUrl,
                      width: 50,
                      errorBuilder: (context, error, stack) =>
                      const Icon(Icons.catching_pokemon),
                    ),
                  ),
                  title: Text(pokemon.name.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
          ),

          if (!_isSearching && _pokemons.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, -2))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _currentPage > 0 ? () => _loadPage(_currentPage - 1) : null,
                    child: const Text('Anterior'),
                  ),
                  Text(
                    'Página ${_currentPage + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () => _loadPage(_currentPage + 1),
                    child: const Text('Próximo'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}