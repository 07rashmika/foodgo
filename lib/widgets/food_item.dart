import 'package:flutter/material.dart';
import 'package:foodgo/models/food_details.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.foodDetails});

  final FoodDetails foodDetails;

  String get categoryText {
    return foodDetails.category.name[0].toUpperCase() +
        foodDetails.category.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(foodDetails.imgUrl, width: 120)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(categoryText), Text(foodDetails.description)],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orangeAccent),
                    Text(foodDetails.rating.toString()),
                  ],
                ),
                Icon(Icons.favorite_border_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
