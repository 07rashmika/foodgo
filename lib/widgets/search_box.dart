import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:standard_searchbar/new/standard_search_controller.dart';

// import 'package:standard_searchbar/new/standard_search_anchor.dart';
// import 'package:standard_searchbar/new/standard_search_bar.dart';
// import 'package:standard_searchbar/new/standard_suggestions.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final StandardSearchController _searchController = StandardSearchController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 56,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black54.withValues(alpha: .25),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            style: GoogleFonts.roboto(fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
              prefixIcon: Icon(Icons.search, size: 32),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 239, 42, 57),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
