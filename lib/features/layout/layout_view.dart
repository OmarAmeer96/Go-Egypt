import 'package:flutter/material.dart';
import 'package:go_egypt/features/favorites/favorites_view.dart';
import 'package:go_egypt/features/profile/profile_view.dart';
import '../governments/views/governments_view.dart';
import '../home/views/home_view.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = 'layout';

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeView(),
    GovernmentsView(),
    FavoritesView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/government_icon.png')),
              label: 'Governments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile')
        ],
      ),
    );
  }
}
