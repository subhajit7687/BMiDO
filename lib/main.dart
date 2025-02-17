import 'package:bmi_do/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_do/values/theme_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: HomeScreen(),
    );
  }
}
