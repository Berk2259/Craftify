import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:craftify/model/favorite_item_model.dart';
import 'package:craftify/Widget/widget.dart';

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
      body:
          favorites.isEmpty
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
