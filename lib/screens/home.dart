import 'package:flutter/material.dart';
import 'package:foodgo/widgets/custom_app_bar.dart';
import 'package:foodgo/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(children: [const CustomAppBar(), SearchBox()]),
        ),
      ),
    );
  }
}
