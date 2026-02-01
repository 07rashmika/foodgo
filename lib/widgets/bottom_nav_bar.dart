import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodgo/providers/tab_index.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  Widget _buildTabIcon({
    required IconData icon,
    required int index,
    required int selectedIndex,
    required VoidCallback onTap,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 32,
            color: selectedIndex == index ? Colors.white : Colors.white70,
          ),
          Opacity(
            opacity: selectedIndex == index ? 1 : 0,
            child: Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider);

    return SizedBox(
      height: 100,
      child: BottomAppBar(
        color: const Color(0xFFEF2A39),
        shape: const CircularNotchedRectangle(),
        notchMargin: 16.0,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTabIcon(
                icon: Icons.home_outlined,
                index: 0,
                selectedIndex: selectedIndex,
                onTap: () => ref.read(tabIndexProvider.notifier).state = 0,
              ),
              _buildTabIcon(
                icon: Icons.person_outline,
                index: 1,
                selectedIndex: selectedIndex,
                onTap: () => ref.read(tabIndexProvider.notifier).state = 1,
              ),
              const SizedBox(width: 70),
              _buildTabIcon(
                icon: Icons.message_outlined,
                index: 2,
                selectedIndex: selectedIndex,
                onTap: () => ref.read(tabIndexProvider.notifier).state = 2,
              ),
              _buildTabIcon(
                icon: Icons.favorite,
                index: 3,
                selectedIndex: selectedIndex,
                onTap: () => ref.read(tabIndexProvider.notifier).state = 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
