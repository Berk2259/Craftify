export 'hakkinda_özellik_card_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteItem {
  final String title;
  final String imagePath;

  FavoriteItem({required this.title, required this.imagePath});
}

class FavoriteProvider extends ChangeNotifier {
  final List<FavoriteItem> _favorites = [];

  List<FavoriteItem> get favorites => _favorites;

  FavoriteProvider() {
    loadFavorites();
  }

  void addFavorite(FavoriteItem item) {
    if (!_favorites.any((f) => f.title == item.title && f.imagePath == item.imagePath)) {
      _favorites.add(item);
      saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(FavoriteItem item) {
    _favorites.removeWhere((f) => f.title == item.title && f.imagePath == item.imagePath);
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(FavoriteItem item) {
    return _favorites.any((f) => f.title == item.title && f.imagePath == item.imagePath);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = _favorites.map((f) => jsonEncode({'title': f.title, 'imagePath': f.imagePath})).toList();
    await prefs.setStringList('favorites', favList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorites') ?? [];
    _favorites.clear();
    for (final f in favList) {
      try {
        final map = jsonDecode(f);
        _favorites.add(FavoriteItem(title: map['title'], imagePath: map['imagePath']));
      } catch (e) {
        // Hatalı veri varsa atla
        continue;
      }
    }
    notifyListeners();
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('favorites');
    _favorites.clear();
    notifyListeners();
  }
}

