import 'package:flutter/material.dart';
import 'package:go_egypt/features/layout/layout_view.dart';
import 'package:go_egypt/features/profile/views/profile_view.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          selectedLabelStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          selectedIconTheme: IconThemeData(color: Colors.deepPurple, size: 28),
          unselectedItemColor: Colors.grey,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey.shade400,
            size: 24,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          elevation: 10,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
      ),
      home: LayoutView(),
    );
  }
}
