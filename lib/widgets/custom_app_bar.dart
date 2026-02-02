import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.profilePicture = 'https://www.gravatar.com/avatar/?d=mp&s=256',
  });

  final String profilePicture;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100.0,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // The "Foodgo" title that stays pinned
      title: Text(
        'Foodgo',
        style: GoogleFonts.lobster(
          fontSize: 45,
          color: const Color(0xFF3E3232),
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const .only(right: 15),
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: .circular(15),
              image: DecorationImage(
                image: NetworkImage(profilePicture),
                fit: .cover,
              ),
            ),
          ),
        ),
      ],
      // The subtitle that disappears on scroll
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const .symmetric(horizontal: 20),
          alignment: .bottomLeft,
          child: Padding(
            padding: const .only(bottom: 10),
            child: Text(
              'Order your favourite food!',
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: .w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
