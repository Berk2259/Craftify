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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 40),
                        child: Image(
                          image: AssetImage('assets/images/paper1.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                        child: Text(
                          'Gül Yapımı',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Image(image: AssetImage('assets/images/indir.jpeg')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
