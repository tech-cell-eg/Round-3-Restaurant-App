import 'package:food_app/features/client/home/data/data_source/base_home_data_source.dart';
import 'package:food_app/features/client/home/data/model/categpry_model.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';

class HomeRepository {
final  BaseHomeDataSource baseHomeDataSource ;

  HomeRepository(this.baseHomeDataSource);


 Future<List<CategoryModel>> getAllProducts() async {
  final categories = await baseHomeDataSource.getAllCategories();
  return categories.map((cat) => CategoryModel.fromJson(cat)).toList();
}



Future<List<RestaurantModel>> getAllRestaurants() async {
    try {
      final rest = await baseHomeDataSource.getAllRestaurants();
      print("HomeRepository: Received ${rest.length} restaurants");
      return rest.map((json) {
        print("HomeRepository: Converting restaurant: $json");
        return RestaurantModel.fromJson(json as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("HomeRepository: Error: $e");
      throw Exception('Failed to load restaurants: $e');
    }
  }


}
