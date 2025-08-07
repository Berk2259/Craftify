import 'package:flutter/material.dart';

class ClipReactImageWidget extends StatelessWidget {
  final String image;

  const ClipReactImageWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0), // 4 px aşağı kaydır
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
