import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:craftify/Screen/Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 1;

  final List<Widget> _pages = [FavoriteScreen(), HomeScreen(), ProfileScreen()];
  final List<Widget> _icons = [
    Icon(Icons.favorite, size: 30, color: Colors.white),
    Icon(Icons.home, size: 30, color: Colors.white),
    ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        'assets/images/logo.png',
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        items: _icons,
        index: _page,
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple.shade900,
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
      ),
    );
  }
}
