import 'package:flutter/material.dart';

class ProfileOzellikCardModel {
  final String Baslik;
  final String Aciklama;
  final IconData? icon;
  final Color color;
  final String? image;

  ProfileOzellikCardModel({
    required this.Baslik,
    required this.Aciklama,
    this.icon,
    required this.color,
    this.image,
  });
}
