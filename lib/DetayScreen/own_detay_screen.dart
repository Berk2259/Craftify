import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OwnDetayScreen extends StatefulWidget {
  const OwnDetayScreen({super.key});

  @override
  State<OwnDetayScreen> createState() => _OwnDetayScreenState();
}

class _OwnDetayScreenState extends State<OwnDetayScreen> {
  String? secilenDeger;
  List<String> secenekler = ['Uhu', 'Bant', 'Makas', 'Cetvel', 'İğne', 'Kağıt'];
  List<String> liste = [];

  Widget getIconForOption(String option) {
    switch (option) {
      case 'Uhu':
        return Image.asset('assets/images/glue.png', width: 30, height: 30);
      case 'Bant':
        return Image.asset('assets/images/tape.png', width: 30, height: 30);
      case 'Makas':
        return Image.asset('assets/images/scissor.png', width: 30, height: 30);
      case 'Cetvel':
        return Image.asset('assets/images/ruler.png', width: 30, height: 30);
      case 'İğne':
        return Image.asset('assets/images/needle.png', width: 30, height: 30);
      case 'Kağıt':
        return Image.asset('assets/images/paper1.png', width: 30, height: 30);
      default:
        // Tanımlanmayan seçenekler için varsayılan simge
        return Icon(Icons.help_outline, size: 30, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Kendin Ekle', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade900,
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
                child: Column(
                  children: [
                    // Üst Bilgi Kutusu
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.circleInfo,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Kendin Ekle',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // İçerik Kutusu
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          child: Column(
                            children: [
                              // TextField
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextField(
                                  cursorColor: Colors.white,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    labelText: 'İsim Girin',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Dropdown + Ekle Butonu
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Colors.white,
                                      dropdownColor: Colors.white,
                                      hint: const Text(
                                        'Bir seçenek seçin',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: secilenDeger,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          secilenDeger = newValue;
                                        });
                                      },
                                      items:
                                          secenekler.map((String secenek) {
                                            return DropdownMenuItem<String>(
                                              value: secenek,
                                              child: Row(
                                                children: [
                                                  getIconForOption(secenek),
                                                  const SizedBox(width: 8),
                                                  Text(secenek),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (secilenDeger != null &&
                                            !liste.contains(secilenDeger)) {
                                          setState(() {
                                            liste.add(secilenDeger!);
                                          });
                                        }
                                      },
                                      child: const Text('Listeye Ekle'),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // Liste
                              Expanded(
                                child: ListView.builder(
                                  itemCount: liste.length,
                                  itemBuilder: (context, index) {
                                    String item = liste[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        left: 16.0,
                                        right: 16.0,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: ListTile(
                                            leading: getIconForOption(item),
                                            title: Text(
                                              item,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Kaydet Butonu
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Kaydetme işlemi buraya yazılabilir
                                  },
                                  icon: const Icon(
                                    Icons.save_rounded,
                                    size: 25,
                                  ),
                                  label: const Text(
                                    'Kaydet',
                                    style: TextStyle(fontSize: 18),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
