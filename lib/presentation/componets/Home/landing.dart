import 'package:dreamslanduae/presentation/Contact/Contact_us.dart';
import 'package:dreamslanduae/presentation/componets/Home/HeroSection.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [HeroSectionPage(), ContactSection()]),
      ),
    );
  }
}
