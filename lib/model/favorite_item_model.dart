export 'hakkinda_özellik_card_model.dart';

import 'package:flutter/material.dart';

class FavoriteItem {
  final String title;
  final String imagePath;

  FavoriteItem({required this.title, required this.imagePath});
}

class FavoriteProvider extends ChangeNotifier {
  final List<FavoriteItem> _favorites = [];

  List<FavoriteItem> get favorites => _favorites;

  void addFavorite(FavoriteItem item) {
    if (!_favorites.any((f) => f.title == item.title && f.imagePath == item.imagePath)) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removeFavorite(FavoriteItem item) {
    _favorites.removeWhere((f) => f.title == item.title && f.imagePath == item.imagePath);
    notifyListeners();
  }

  bool isFavorite(FavoriteItem item) {
    return _favorites.any((f) => f.title == item.title && f.imagePath == item.imagePath);
  }
}

