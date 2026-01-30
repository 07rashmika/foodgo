import 'package:flutter/material.dart';
import 'package:foodgo/screens/profile.dart';
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
    return AppBar(
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Foodgo',
              style: GoogleFonts.lobster(
                fontSize: 42,
                color: const Color(0xFF3E3232),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Order your favourite food!',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(profilePicture)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
