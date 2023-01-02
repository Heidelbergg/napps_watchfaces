import 'package:flutter/material.dart';
import 'package:napps_watchfaces/presentation/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}