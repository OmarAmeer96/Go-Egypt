import 'package:flutter/material.dart';
import 'package:go_egypt/features/layout/layout_view.dart';

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
          backgroundColor: Color(0xFFFFFFFF),
          type: BottomNavigationBarType.fixed,
          selectedItemColor:Color(0xff182542),
          selectedLabelStyle: TextStyle(
            color:Color(0xff182542),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          selectedIconTheme: IconThemeData(
              color:Color(0xff182542),
              size: 30
          ),
          unselectedItemColor: Color(0xffb79696),
          unselectedIconTheme: IconThemeData(
            color: Color(0xffccc7c7),
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xffccc7c7),
            fontSize: 14,
          ),
        ),
      ),
      home: const LayoutView(),
    );
  }
}
