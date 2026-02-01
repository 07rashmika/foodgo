import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerCard extends StatefulWidget {
  const BurgerCard({
    super.key,
    this.burgerImage =
        'https://imgs.search.brave.com/aJQf9STNa2h81KCYU0ptPlXUoTPCAFx42bV72itk7IE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzEzLzQ0/L2NiLzEzNDRjYjQ5/MzdjZGU0MTE4YzYx/MGFjYTEzNjI4OWM4/LmpwZw',
    required this.name,
    required this.rating,
  });

  final String burgerImage;
  final String name;
  final double rating;

  @override
  State<BurgerCard> createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  bool _isLiked = false;

  void _likeBurger() {
    setState(() => _isLiked = !_isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 220,
        width: 180,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFF3F4F6), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.burgerImage,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
            Text(
              widget.name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisSize: .min,
              mainAxisAlignment: .spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.price_change, color: Colors.amber),
                    SizedBox(width: 5),
                    Text(
                      widget.rating.toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: IconButton(
                    onPressed: _likeBurger,
                    icon: Icon(
                      _isLiked
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.amber,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
