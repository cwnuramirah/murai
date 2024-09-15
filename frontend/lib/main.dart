import 'package:flutter/material.dart';
import 'package:frontend/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Murai',
      theme: ThemeData(
        fontFamily: 'Inter'
      ),
      debugShowCheckedModeBanner: false,
      home: const Navigation(),
    );
  }
}