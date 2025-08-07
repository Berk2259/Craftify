import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class OwnFavoriteItem {
  final String name;
  final List<String> materials;
  final int originalIndex; // OwnItemStore'daki orijinal index

  OwnFavoriteItem({
    required this.name, 
    required this.materials, 
    required this.originalIndex
  });

  // JSON serialization için
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'materials': materials,
      'originalIndex': originalIndex,
    };
  }

  // JSON deserialization için
  factory OwnFavoriteItem.fromJson(Map<String, dynamic> json) {
    return OwnFavoriteItem(
      name: json['name'],
      materials: List<String>.from(json['materials']),
      originalIndex: json['originalIndex'],
    );
  }
}

class OwnFavoriteProvider extends ChangeNotifier {
  final List<OwnFavoriteItem> _favorites = [];
  static const String _prefsKey = 'own_favorites';

  List<OwnFavoriteItem> get favorites => _favorites;

  OwnFavoriteProvider() {
    loadFavorites();
  }

  void addFavorite(OwnFavoriteItem item) {
    if (!_favorites.any((f) => f.name == item.name && f.originalIndex == item.originalIndex)) {
      _favorites.add(item);
      saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(OwnFavoriteItem item) {
    _favorites.removeWhere((f) => f.name == item.name && f.originalIndex == item.originalIndex);
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(String name, int originalIndex) {
    return _favorites.any((f) => f.name == name && f.originalIndex == originalIndex);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = _favorites.map((f) => jsonEncode(f.toJson())).toList();
    await prefs.setStringList(_prefsKey, favList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(_prefsKey) ?? [];
    _favorites.clear();
    for (final f in favList) {
      try {
        final map = jsonDecode(f);
        _favorites.add(OwnFavoriteItem.fromJson(map));
      } catch (e) {
        // Hatalı veri varsa atla
        continue;
      }
    }
    notifyListeners();
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
    _favorites.clear();
    notifyListeners();
  }
}
