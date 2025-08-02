import 'package:dreamslanduae/presentation/componets/Appbar/AppBar.dart';
import 'package:dreamslanduae/presentation/componets/Home/Searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSectionPage extends ConsumerWidget {
  const HeroSectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://www.dso.ae/documents/d/dubai-silicon-oasis/dso-hq-skyline-1440x800-px-jpg?imagePreview=1',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 768;

              return Align(
                alignment: isWide ? Alignment.centerLeft : Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isWide ? 64 : 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Find Your Dream Property',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: isWide ? 36 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'We help you find the perfect home or investment across the UAE and India.',
                        style: GoogleFonts.nunito(
                          color: Colors.white70,
                          fontSize: isWide ? 18 : 14,
                        ),
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      const Center(child: CustomSearchBar()),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
