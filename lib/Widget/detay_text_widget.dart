import 'package:flutter/material.dart';

class DetayTextWidget extends StatelessWidget {
  final String text;

  DetayTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
