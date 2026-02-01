import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/providers/tab_index.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsContainer extends ConsumerStatefulWidget {
  const OptionsContainer({super.key});

  @override
  ConsumerState<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends ConsumerState<OptionsContainer> {
  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["All", "Combos", "Sliders", "Classic"];
    final selectedCategoryIndex = ref.watch(categoryIndexProvider);

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: .horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategoryIndex == index;

          return GestureDetector(
            onTap: () {
              ref.read(categoryIndexProvider.notifier).state = index;
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFEF2A39) : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(15),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: GoogleFonts.inter(
                    color: isSelected ? Colors.white : Colors.grey[600],
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
