import 'package:flutter/material.dart';
import 'package:food_app/features/client/restaurant/model/meal.dart';

class MealQuantityController extends ChangeNotifier {
  int _quantity = 1;
  late MealSize _size;
  MealQuantityController(MealSize size) : _size = size;

  String get id => _size.id;
  int get quantity => _quantity;
  double get total => _size.price * _quantity;

  set size(MealSize value) {
    _size = value;
    notifyListeners();
  }

  void increment() {
    ++_quantity;
    notifyListeners();
  }

  void decrement() {
    _quantity--;
    notifyListeners();
  }
}
