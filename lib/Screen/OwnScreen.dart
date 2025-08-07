import 'package:craftify/DetayScreen/DetayScreen.dart';
import 'package:flutter/material.dart';
import 'package:craftify/Widget/widget.dart';
import '../model/own_item_store.dart';

class OwnScreen extends StatefulWidget {
  const OwnScreen({super.key});

  @override
  State<OwnScreen> createState() => _OwnScreenState();
}

class _OwnScreenState extends State<OwnScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    await OwnItemStore().load();
    setState(() {
      _loading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final items = OwnItemStore().items;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('Kendi Bölümün', style: TextStyle(color: Colors.white)),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple.shade900,
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OwnDetayScreen()),
            );
            await _loadItems();
          },
          child: Icon(Icons.add),
        ),
      ),
      body:
          _loading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child:
                        items.isEmpty
                            ? Center(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -40,
                                    child: ThoughtBubble(
                                      text:
                                          "Henüz bir şey eklemedin mi? Tıkla ve Ekle ",
                                    ),
                                  ),
                                  Image.asset('assets/images/cartoon.png'),
                                ],
                              ),
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final entry = items[index];
                                final name = entry.keys.first;
                                final materials = entry[name]!;
                                return Dismissible(
                                  key: Key('$name-$index'),
                                  background: Container(
                                    color: Colors.green,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 24),
                                    child: const Icon(Icons.edit, color: Colors.white, size: 32),
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 24),
                                    child: const Icon(Icons.delete, color: Colors.white, size: 32),
                                  ),
                                  confirmDismiss: (direction) async {
                                    if (direction == DismissDirection.endToStart) {
                                      // Sil
                                      await OwnItemStore().removeAt(index);
                                      await _loadItems();
                                      return false; // Kartı ListView'dan elle kaldırıyoruz
                                    } else if (direction == DismissDirection.startToEnd) {
                                      // Edit
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OwnDetayScreen(
                                            initialName: name,
                                            initialMaterials: materials,
                                            editIndex: index,
                                          ),
                                        ),
                                      );
                                      await _loadItems();
                                      return false;
                                    }
                                    return false;
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          ...materials
                                              .map((m) => Text('- $m'))
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
    );
  }
}
