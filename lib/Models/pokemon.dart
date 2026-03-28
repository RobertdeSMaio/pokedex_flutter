class Pokemon {
  final String name;
  final String? url;
  final int? height;
  final int? weight;
  final List<String>? abilities;
  final String? imageFromApi;

  Pokemon({
    required this.name,
    this.url,
    this.height,
    this.weight,
    this.abilities,
    this.imageFromApi,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String>? abilitiesList;
    if (json['abilities'] != null) {
      abilitiesList = (json['abilities'] as List)
          .map((item) => item['ability']['name'].toString())
          .toList();
    }

    return Pokemon(
      name: json['name'],
      url: json['url'],
      height: json['height'],
      weight: json['weight'],
      abilities: abilitiesList,
      imageFromApi: json['sprites'] != null
          ? json['sprites']['other']['official-artwork']['front_default']
          : null,
    );
  }
  String get imageUrl {
    if (imageFromApi != null && imageFromApi!.isNotEmpty) {
      return imageFromApi!;
    }
    if (url != null && url!.isNotEmpty) {
      final parts = url!.split('/');
      final id = parts[parts.length - 2];
      return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
    }
    return "";
  }
}