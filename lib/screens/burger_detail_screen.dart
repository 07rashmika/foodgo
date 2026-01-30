import 'package:flutter/material.dart';
import 'package:foodgo/models/burger.dart'; // Update path

class BurgerDetailScreen extends StatelessWidget {
  final Burger burger;

  const BurgerDetailScreen({super.key, required this.burger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsible App Bar with Image
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(burger.name,
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  )),
              background: Image.network(
                burger.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey),
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price and ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${burger.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      Chip(label: Text("ID: ${burger.id}")),
                    ],
                  ),
                  const Divider(height: 30),
                  
                  // Description
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    burger.description.isNotEmpty 
                        ? burger.description 
                        : "No description available.",
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  // Ingredients Section
                  if (burger.ingredients.isNotEmpty) ...[
                    const Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    // Display ingredients as a list of items with images
                    ListView.builder(
                      shrinkWrap: true, // Important inside ScrollView
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: burger.ingredients.length,
                      itemBuilder: (context, index) {
                        String name = burger.ingredients.keys.elementAt(index);
                        String imgUrl = burger.ingredients.values.elementAt(index);

                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              imgUrl,
                              errorBuilder: (_,__,___) => const Icon(Icons.grass),
                            ),
                          ),
                          title: Text(name),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}