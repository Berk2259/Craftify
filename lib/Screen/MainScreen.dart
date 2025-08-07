import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:craftify/Screen/Screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:craftify/Widget/widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 2;

  final List<Widget> _pages = [
    OwnScreen(),
    FavoriteScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  final List<Widget> _icons = [
    ClipReactImageWidget(image: 'assets/images/file.png'),
    ClipReactImageWidget(image: 'assets/images/heart.png'),
    ClipReactImageWidget(image: 'assets/images/house.png'),
    ClipReactImageWidget(image: 'assets/images/logo.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        height: 65,
        items: _icons,
        index: _page,
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple.shade900,
        buttonBackgroundColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
      ),
    );
  }
}
