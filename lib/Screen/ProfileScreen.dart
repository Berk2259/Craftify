import 'package:craftify/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:craftify/model/model.dart'; // Model burada tanımlı olmalı

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('Profil Sayfası ', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Craftify',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Kişisel Origami Rehberi',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.lightbulb, color: Colors.yellow),
                  SizedBox(width: 10),
                  Text(
                    'Özellikler',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            ProfileOzellikCardWidget(
              ozellik: ProfileOzellikCardModel(
                Baslik: 'Favoriler',
                Aciklama: 'Beğendiğin Origamiyi Favorile',
                icon: Icons.favorite,
                color: Colors.deepPurple.shade900,
              ),
            ),
            ProfileOzellikCardWidget(
              ozellik: ProfileOzellikCardModel(
                Baslik: 'Ana Sayfa',
                Aciklama: 'Sevebileceğin origamileri burda bulabilirsin',
                icon: Icons.home,
                color: Colors.red,
              ),
            ),
            ProfileOzellikCardWidget(
              ozellik: ProfileOzellikCardModel(
                Baslik: 'Profil Sayfası',
                Aciklama: 'Uygulama hakkında bilgiler bulunur',
                image: 'assets/images/logo.png',
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
