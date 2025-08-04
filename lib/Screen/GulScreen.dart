import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:craftify/DetayScreen/DetayScreen.dart';
import 'package:craftify/Widget/widget.dart'; // MalzemeItem burada olmalı

class GulScreen extends StatefulWidget {
  const GulScreen({super.key});

  @override
  State<GulScreen> createState() => _GulScreenState();
}

class _GulScreenState extends State<GulScreen> {
  void _launchUrl() async {
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=Ep-DoqqDBE4');
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Bağlantı açılamadı: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: const Text('Gül Yapımı', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white70,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.circleInfo,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Malzemeler',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: MalzemeKart(
                                  imagePath: 'assets/images/glue.png',
                                  label: 'Uhu',
                                ),
                              ),
                              MalzemeKart(
                                imagePath: 'assets/images/tape.png',
                                label: 'Bant',
                              ),
                              MalzemeKart(
                                imagePath: 'assets/images/scissor.png',
                                label: 'Makas',
                              ),
                              MalzemeKart(
                                imagePath: 'assets/images/ruler.png',
                                label: 'Cetvel',
                              ),
                              MalzemeKart(
                                imagePath: 'assets/images/needle.png',
                                label: 'İğne',
                              ),
                              MalzemeKart(
                                imagePath: 'assets/images/paper1.png',
                                label: 'Kağıt',
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                          FontAwesomeIcons.video,
                                        ),
                                        label: const Text(
                                          'Video',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(150, 50),
                                        ),
                                        onPressed: _launchUrl,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => GulDetayScreen(),
                                            ),
                                          );
                                        },
                                        label: const Text(
                                          'Detay',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        icon: const Icon(
                                          FontAwesomeIcons.circleInfo,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(150, 50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
