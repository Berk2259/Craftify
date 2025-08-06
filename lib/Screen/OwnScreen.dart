import 'package:flutter/material.dart';

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
    );
  }
}
