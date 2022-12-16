import 'package:din_din/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(secondary: Colors.amber.shade200),
        scaffoldBackgroundColor: const Color(0xFF171717),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
      home: const HomePage(),
    );
  }
}
