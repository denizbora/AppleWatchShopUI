import 'package:apple_watch_shop/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Apple Watch Shop UI',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}