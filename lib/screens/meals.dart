import 'package:flutter/material.dart';
import 'package:foodgo/models/burger.dart'; // Update with your actual path
import 'package:foodgo/services/burger_api.dart';
import 'burger_detail_screen.dart'; // We will create this next

class BurgerListScreen extends StatefulWidget {
  const BurgerListScreen({super.key});

  @override
  State<BurgerListScreen> createState() => _BurgerListScreenState();
}

class _BurgerListScreenState extends State<BurgerListScreen> {
  // We store the Future in a variable so it doesn't reload every time we rebuild
  late Future<List<Burger>> _burgersFuture;

  @override
  void initState() {
    super.initState();
    _burgersFuture = BurgerApi().getBurgers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burgers Hub"),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Burger>>(
        future: _burgersFuture,
        builder: (context, snapshot) {
          // 1. Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Error State
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          // 3. Data State
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No burgers found."));
          }

          final burgers = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: burgers.length,
            itemBuilder: (context, index) {
              final burger = burgers[index];
              return _buildBurgerCard(burger);
            },
          );
        },
      ),
    );
  }

  Widget _buildBurgerCard(Burger burger) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigate to details when tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BurgerDetailScreen(burger: burger),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Burger Image with Error Handling
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  burger.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.fastfood,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          burger.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${burger.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    burger.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
