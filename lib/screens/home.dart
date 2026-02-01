import 'package:flutter/material.dart';
import 'package:foodgo/widgets/burger_list.dart';

import 'package:foodgo/widgets/options_container.dart';
import 'package:foodgo/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SearchBox(),
              const SizedBox(height: 20),
              OptionsContainer(),
              const SizedBox(height: 20),
              BurgerList(),
            ],
          ),
        ),
      ),
    );
  }
}
