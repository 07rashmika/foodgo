import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/screens/add.dart';
import 'package:foodgo/widgets/bottom_nav_bar.dart';
import 'package:foodgo/widgets/custom_app_bar.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      // body: Column(children: [const CustomAppBar()]),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFFEF2A39),
        elevation: 6,
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: const Icon(
          Icons.add_sharp,
          color: Colors.white,
          size: 36,
          fontWeight: FontWeight.w900,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
}
