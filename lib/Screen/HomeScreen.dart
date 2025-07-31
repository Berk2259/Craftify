import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
        title: Text('Ana Sayfa', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.deepPurple.shade300,
    );
  }
}
