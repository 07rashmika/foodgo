import 'package:flutter/material.dart';
import 'package:foodgo/models/food_details.dart';
import 'package:foodgo/widgets/custom_app_bar.dart';
import 'package:foodgo/widgets/food_item.dart';
import 'package:foodgo/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _selectedIndex = 0;
  // final Color red = Color(0xFFEF2B39);

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {},
        // children: [
        //   const CustomAppBar(),
        //   const SearchBox(),
        //   FoodItem(
        //     foodDetails: FoodDetails(
        //       id: 'id',
        //       imgUrl:
        //           'https://imgs.search.brave.com/KwXjVTh4fG7-S5jvBkX19nA0jSOceNmFQXXPs_qpNJI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9ncmlsbGVkLWJl/ZWYtYnVyZ2VyLXdp/dGgtZnJpZXMtY2hl/ZXNlLXRvbWF0b18x/MjgyNTI0LTEzMS5q/cGc_c2VtdD1haXNf/aHlicmlkJnc9NzQw/JnE9ODA',
        //       category: Category.cheeseburger,
        //       subName: 'subName',
        //       description: 'description',
        //       rating: 4.9,
        //       price: 8.43,
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
