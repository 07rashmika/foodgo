import 'package:flutter/material.dart';
import 'package:foodgo/screens/favorites.dart';
import 'package:foodgo/screens/messages.dart';
import 'package:foodgo/screens/profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
        child: BottomAppBar(
          color: const Color(0xFFEF2A39),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 36,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 36,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
                const SizedBox(width: 40),
                IconButton(
                  icon: Icon(
                    Icons.message_outlined,
                    size: 36,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MessagesScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite, size: 36, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FavoritesScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
