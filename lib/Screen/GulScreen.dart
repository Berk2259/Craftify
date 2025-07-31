import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GulScreen extends StatelessWidget {
  const GulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ), //geri gelme buton rengi değişikliği default değer değiştirildi.
        centerTitle: true,
        title: Text('Gül Yapımı', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white70,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/indir.jpeg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Malzemeler',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 60),
                      ),
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.video),
                      label: Text('Videoyu İzle'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
