import 'package:flutter/material.dart';
import 'package:foodgo/models/burger.dart';
import 'package:foodgo/services/burger_api.dart';
import 'package:foodgo/widgets/burger_card.dart';

class BurgerList extends StatefulWidget {
  const BurgerList({super.key});

  @override
  State<BurgerList> createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  late Future<List<Burger>> _burgersList;

  @override
  void initState() {
    super.initState();
    _burgersList = BurgerApi().getBurgers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _burgersList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == .waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No Burgers Found',
              style: TextStyle(color: Colors.red, fontSize: 26),
            ),
          );
        }

        final burgers = snapshot.data!;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: burgers.length,
          itemBuilder: (context, index) {
            final burger = burgers[index];
            return BurgerCard(
              name: burger.name,
              burgerImage: burger.image,
              rating: burger.price,
            );
          },
        );
      },
    );
  }
}
