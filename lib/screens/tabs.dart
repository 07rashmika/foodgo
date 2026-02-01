import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodgo/providers/tab_index.dart';

import 'package:foodgo/screens/add.dart';
import 'package:foodgo/screens/favorites.dart';
import 'package:foodgo/screens/home.dart';
import 'package:foodgo/screens/messages.dart';
import 'package:foodgo/screens/profile.dart';
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
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const MessagesScreen(),
    const FavoritesScreen(),
  ];

  Widget _buildFab(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .25),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(2, 8),
          ),
        ],
      ),
      child: FloatingActionButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(),
      body: IndexedStack(index: selectedIndex, children: _screens),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: _buildFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
