import 'package:flutter/material.dart';
import 'package:craftify/Widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
        title: Text('Craftify', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.deepPurple.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16.0), child: Gul()),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
