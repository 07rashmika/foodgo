class Burger {
  final int id;
  final String name;
  final String image;
  final String description;
  final Map<String, String> ingredients;
  final double price;

  const Burger({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.price,
  });

  factory Burger.fromJson(Map<String, dynamic> json) {
    final Map<String, String> ingredientMap = {};

    if (json['ingredients'] != null) {
      for (var item in json['ingredients']) {
        ingredientMap[item['name']] = item['img'];
      }
    }

    final String imageUrl =
        (json['images'] != null && json['images'].isNotEmpty)
        ? json['images'][0]['sm'] ?? ''
        : '';

    return Burger(
      id: json['id'],
      name: json['name'],
      description: json['desc'] ?? '',
      image: imageUrl,
      ingredients: ingredientMap,
      price: (json['price'] as num).toDouble(),
    );
  }
}
