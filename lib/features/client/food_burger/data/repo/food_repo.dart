import 'package:food_app/features/client/food_burger/data/data_source/base_food_data_source.dart';
import 'package:food_app/features/client/food_burger/data/models/food_model.dart';

class FoodRepo {
  final BaseFoodDataSource baseFoodDataSource;

  FoodRepo(this.baseFoodDataSource);

  Future<List<FoodMealsModel>> getAllProducts() async {
    try {
      final meals = await baseFoodDataSource.getAllFood();
      print("FoodRepo: Received ${meals.length} meals");
      return meals.map((meal) {
        print("FoodRepo: Converting meal: $meal");
        return FoodMealsModel.fromJson(meal as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("FoodRepo: Error: $e");
      throw Exception('Failed to load meals: $e');
    }
  }
}