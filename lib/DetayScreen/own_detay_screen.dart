import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/own_item_store.dart';

class OwnDetayScreen extends StatefulWidget {
  final String? initialName;
  final List<String>? initialMaterials;
  final int? editIndex;

  const OwnDetayScreen({super.key, this.initialName, this.initialMaterials, this.editIndex});

  @override
  State<OwnDetayScreen> createState() => _OwnDetayScreenState();
}

class _OwnDetayScreenState extends State<OwnDetayScreen> {
  String? secilenDeger;
  List<String> secenekler = ['Uhu', 'Bant', 'Makas', 'Cetvel', 'İğne', 'Kağıt'];
  List<String> liste = [];
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    OwnItemStore().load();
    if (widget.initialName != null) {
      _nameController.text = widget.initialName!;
    }
    if (widget.initialMaterials != null) {
      liste = List.from(widget.initialMaterials!);
    }
  }

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
        return Icon(Icons.help_outline, size: 30, color: Colors.grey);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveItem() async {
    final name = _nameController.text.trim();
    if (name.isNotEmpty && liste.isNotEmpty) {
      if (widget.editIndex != null) {
        await OwnItemStore().updateAt(widget.editIndex!, name, List.from(liste));
      } else {
        await OwnItemStore().addItem(name, List.from(liste));
      }
      // No need to call load() here since the parent screen will reload
      setState(() {
        _nameController.clear();
        liste.clear();
        secilenDeger = null;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ürün kaydedildi!')));
      Navigator.pop(context, true); // Return true to indicate successful save
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen ürün adı ve en az bir malzeme girin.')),
      );
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          child: Column(
                            children: [
                              // Ürün adı TextField
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextField(
                                  controller: _nameController,
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
                                        if (secilenDeger != null && !liste.contains(secilenDeger)) {
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
                                  onPressed: _saveItem,
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
