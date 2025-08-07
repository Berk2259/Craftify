import 'package:flutter/material.dart';

class OwnDetayScreen extends StatefulWidget {
  const OwnDetayScreen({super.key});

  @override
  State<OwnDetayScreen> createState() => _OwnDetayScreenState();
}

class _OwnDetayScreenState extends State<OwnDetayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Text('Kendin Ekle', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade900,
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
      ),
    );
  }
}
