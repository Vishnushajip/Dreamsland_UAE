import 'package:dreamslanduae/presentation/componets/Home/landing.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dreamsland Realty',
      home: Landing(),
    );
  }
}
