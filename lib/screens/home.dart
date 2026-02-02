import 'package:flutter/material.dart';
import 'package:foodgo/widgets/burger_list.dart';
import 'package:foodgo/widgets/custom_app_bar.dart';

import 'package:foodgo/widgets/options_container.dart';
import 'package:foodgo/widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),

          // Use SliverPadding to apply your horizontal padding safely
          SliverPadding(
            padding: const .symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),
                SearchBox(),
                const SizedBox(height: 20),
                OptionsContainer(),
                BurgerList(),
                const SizedBox(height: 10), // Space for the BottomNavBar
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
