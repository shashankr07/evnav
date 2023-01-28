import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter UI",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
