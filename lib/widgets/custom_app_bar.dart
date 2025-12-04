import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foodgo',
              style: GoogleFonts.lobster(
                fontSize: 48,
                color: const Color(0xFF3b2d28),
              ),
            ),
            Text(
              'Order your favourtie food!',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/pic.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.3))],
          ),
        ),
      ],
    );
  }
}
