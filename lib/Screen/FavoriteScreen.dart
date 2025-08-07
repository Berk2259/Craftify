import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craftify/model/favorite_item_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProvider>(context).favorites;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('Favori Sayfası', style: TextStyle(color: Colors.white)),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('Henüz favori eklenmedi.', style: TextStyle(color: Colors.white, fontSize: 18)))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item.imagePath),
                    ),
                    title: Text(item.title),
                  ),
                );
              },
            ),
    );
  }
}
