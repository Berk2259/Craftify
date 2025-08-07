import 'package:craftify/DetayScreen/DetayScreen.dart';
import 'package:flutter/material.dart';
import 'package:craftify/Widget/widget.dart';

class OwnScreen extends StatefulWidget {
  const OwnScreen({super.key});

  @override
  State<OwnScreen> createState() => _OwnScreenState();
}

class _OwnScreenState extends State<OwnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('Kendi Bölümün', style: TextStyle(color: Colors.white)),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple.shade900,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OwnDetayScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -40,
                    child: ThoughtBubble(
                      text: "Henüz bir şey eklemedin mi? Tıkla ve Ekle ",
                    ),
                  ),
                  Image.asset('assets/images/cartoon.png'),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
