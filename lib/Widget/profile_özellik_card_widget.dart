import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:craftify/model/model.dart';

class ProfileOzellikCardWidget extends StatelessWidget {
  final ProfileOzellikCardModel ozellik;

  Widget _iconFoto() {
    //bu kısım icon varsa ikon image varsa image kullanmaya dayalı bir fonksiyon
    if (ozellik.icon != null) {
      return Icon(ozellik.icon, size: 30, color: Colors.white);
    } else if (ozellik.image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          ozellik.image!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  ProfileOzellikCardWidget({super.key, required this.ozellik});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ozellik.color,
                    ),
                    child: _iconFoto(),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ozellik.Baslik,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ozellik.color,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ozellik.Aciklama,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
