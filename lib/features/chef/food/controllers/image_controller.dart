import 'package:flutter/material.dart';

class ImageController extends ValueNotifier<List<String>>{
  ImageController() : super([]);

  void add(String imagePath) {
    value.add(imagePath);
    notifyListeners();
  }

  void remove(String imagePath) {
    value.remove(imagePath);
    notifyListeners();
  }

  void clear() {
    value.clear();
    notifyListeners();
  }
}