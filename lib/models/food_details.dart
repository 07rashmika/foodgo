enum Category { cheeseburger, hamburger }

class FoodDetails {
  const FoodDetails({
    required this.id,
    required this.imgUrl,
    required this.category,
    required this.subName,
    required this.description,
    required this.rating,
    required this.price,
  });

  final String id;
  final String imgUrl;
  final Category category;
  final String subName;
  final String description;
  final double rating;
  final double price;
}
