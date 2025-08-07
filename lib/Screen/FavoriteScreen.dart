import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craftify/model/favorite_item_model.dart';
import 'package:craftify/model/own_favorite_model.dart';
import 'package:craftify/Widget/widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProvider>(context).favorites;
    final ownFavorites = Provider.of<OwnFavoriteProvider>(context).favorites;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('Favori Sayfası', style: TextStyle(color: Colors.white)),
      ),
      body:
          (favorites.isEmpty && ownFavorites.isEmpty)
              ? Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -80,
                              child: ThoughtBubble(
                                text:
                                    "Hey sen! Ben Mercan buranın efendisi benim \nsen yeni bir şey favorileyene kadar \nsana ben eşlik edeceğim",
                              ),
                            ),
                            Image.asset('assets/images/favori_maskot.png'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
              : ListView(
                children: [
                  // Normal favoriler
                  if (favorites.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Ana Sayfa Favorileri',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ...favorites.map((item) => Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item.imagePath),
                        ),
                        title: Text(item.title),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Provider.of<FavoriteProvider>(context, listen: false)
                                .removeFavorite(item);
                          },
                        ),
                      ),
                    )).toList(),
                  ],
                  
                  // OwnItem favorileri
                  if (ownFavorites.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Kendi Bölümü Favorileri',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                                        ...ownFavorites.map((item) => Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple.shade100,
                            child: Icon(
                              Icons.folder,
                              color: Colors.deepPurple.shade900,
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Malzemeler: ${item.materials.join(', ')}',
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Provider.of<OwnFavoriteProvider>(context, listen: false)
                                  .removeFavorite(item);
                            },
                          ),
                        ),
                      ),
                    )).toList(),
                  ],
                ],
              ),
    );
  }
}
