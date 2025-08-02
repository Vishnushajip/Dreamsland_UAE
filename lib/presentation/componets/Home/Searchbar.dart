import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../viewmodels/Landing/Searchhint.dart';

class CustomSearchBar extends ConsumerWidget {
  final IconData suffixIcon;

  const CustomSearchBar({super.key, this.suffixIcon = Icons.search});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hintIndex = ref.watch(searchHintProvider);
    final notifier = ref.watch(searchHintProvider.notifier);
    final hints = notifier.hints;

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return SizedBox(
      width: screenWidth * 0.5,
      child: TextField(
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hints.isNotEmpty
              ? 'Search "${hints[hintIndex]}"'
              : 'Search properties',
          hintStyle: GoogleFonts.poppins(
            fontSize: isMobile ? 9 : 14,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          suffixIcon: Icon(suffixIcon, color: Colors.cyan[700]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.cyan.shade700, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.cyan.shade700, width: 0.5),
          ),
        ),
      ),
    );
  }
}
