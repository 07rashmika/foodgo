import 'package:flutter/material.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [StandardSearchBar(width: 60)],
      ),
    );
  }
}
