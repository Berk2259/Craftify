import 'package:craftify/DetayScreen/DetayScreen.dart';
import 'package:flutter/material.dart';
import 'package:craftify/Widget/widget.dart';
import '../model/own_item_store.dart';
import 'package:provider/provider.dart';
import '../model/own_favorite_model.dart';

class OwnScreen extends StatefulWidget {
  const OwnScreen({super.key});

  @override
  State<OwnScreen> createState() => _OwnScreenState();
}

class _OwnScreenState extends State<OwnScreen> {
  bool _loading = true;

  @override
  void initState() {
    //bir widget'ın durumu oluşturulurken ilk kez çalışır.
    super.initState();
    _loadItems(); //bu method çağrılır
  }

  Future<void> _loadItems() async {
    await OwnItemStore()
        .load(); //OwnItemStore sınıfından bir nesne oluşturup onun load() methodunu çağırır.
    setState(() {
      _loading = false; //loading kısmını false yapar
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies(); //üst sınıftaki işlemlerin yapılmaısnı sağlar
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final items = OwnItemStore().items;
    final ownFavoriteProvider = Provider.of<OwnFavoriteProvider>(context);
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
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OwnDetayScreen()),
            );
            if (result == true) {
              await _loadItems();
            }
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
                                  direction:
                                      DismissDirection
                                          .endToStart, // sadece sağdan sola
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 24),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  confirmDismiss: (direction) async {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      await OwnItemStore().removeAt(index);
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
                                    child: ListTile(
                                      title: Text(
                                        name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Favori butonu
                                          IconButton(
                                            icon: Icon(
                                              ownFavoriteProvider.isFavorite(name, index) 
                                                ? Icons.favorite 
                                                : Icons.favorite_border,
                                              color: ownFavoriteProvider.isFavorite(name, index) 
                                                ? Colors.red 
                                                : Colors.grey,
                                            ),
                                            onPressed: () {
                                              final favoriteItem = OwnFavoriteItem(
                                                name: name,
                                                materials: materials,
                                                originalIndex: index,
                                              );
                                              if (ownFavoriteProvider.isFavorite(name, index)) {
                                                ownFavoriteProvider.removeFavorite(favoriteItem);
                                              } else {
                                                ownFavoriteProvider.addFavorite(favoriteItem);
                                              }
                                            },
                                          ),
                                          // Düzenleme butonu
                                          IconButton(
                                            icon: Icon(Icons.arrow_forward_ios),
                                            onPressed: () async {
                                              final result = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => OwnDetayScreen(
                                                        initialName: name,
                                                        initialMaterials: materials,
                                                        editIndex: index,
                                                      ),
                                                ),
                                              );
                                              if (result == true) {
                                                await _loadItems(); // Refresh the list after editing
                                              }
                                            },
                                          ),
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
