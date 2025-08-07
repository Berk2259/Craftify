import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OwnItemStore {
  static final OwnItemStore _instance = OwnItemStore._internal();
  factory OwnItemStore() => _instance;
  OwnItemStore._internal();

  final List<Map<String, List<String>>> _items = [];
  static const String _prefsKey = 'own_items';

  List<Map<String, List<String>>> get items => _items;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_prefsKey);
    _items.clear();
    if (data != null) {
      final List decoded = jsonDecode(data);
      for (var entry in decoded) {
        final name = entry['name'] as String;
        final materials = List<String>.from(entry['materials']);
        _items.add({name: materials});
      }
    }
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> data = _items
        .map((entry) => {
              'name': entry.keys.first,
              'materials': entry.values.first,
            })
        .toList();
    await prefs.setString(_prefsKey, jsonEncode(data));
  }

  Future<void> addItem(String name, List<String> materials) async {
    _items.add({name: materials});
    await save();
  }

  Future<void> removeAt(int index) async {
    _items.removeAt(index);
    await save();
  }

  Future<void> updateAt(int index, String newName, List<String> newMaterials) async {
    _items[index] = {newName: newMaterials};
    await save();
  }

  Future<void> clear() async {
    _items.clear();
    await save();
  }
}
