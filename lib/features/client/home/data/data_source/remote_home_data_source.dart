import 'package:dio/dio.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/core/constants/end_point.dart';
import 'package:food_app/features/client/home/data/data_source/base_home_data_source.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';

class RemoteHomeDataSource implements BaseHomeDataSource {
late Dio dio;

  RemoteHomeDataSource() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 20 * 1000), // 20 seconds,
      receiveTimeout: Duration(milliseconds: 20 * 1000),
    );

    dio = Dio(options);
  }
  


  @override
Future<List<dynamic>> getAllCategories() async {
  try {
    Response response = await dio.get(EndPoint.categories);
    print(response.data.toString());

    if (response.data != null && response.data['data'] is List) {
      return response.data['data'];
    } else {
      throw Exception('Invalid response format');
    }
  } catch (e) {
    print('Error fetching categories: $e');
    return [];
  }




  }
  
   @override
  Future<List<dynamic>> getAllRestaurants() async {
    try {
      Response response = await dio.get(EndPoint.restaurants);
      print("RemoteHomeDataSource: Full Response: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        if (response.data is Map<String, dynamic>) {
          final data = response.data as Map<String, dynamic>;
          if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
            final nestedData = data['data'] as Map<String, dynamic>;
            if (nestedData.containsKey('restaurants') && nestedData['restaurants'] is List<dynamic>) {
              print("RemoteHomeDataSource: Found ${nestedData['restaurants'].length} restaurants");
              return nestedData['restaurants'] as List<dynamic>;
            }
            throw Exception('Invalid response format: Expected "restaurants" key to contain a list');
          }
          throw Exception('Invalid response format: Expected "data" key to contain a map');
        }
        throw Exception('Invalid response format: Expected a map');
      }
      throw Exception('Failed to load restaurants: ${response.statusCode}');
    } catch (e) {
      print('RemoteHomeDataSource: Error fetching restaurants: $e');
      throw Exception('Error fetching restaurants: $e');
    }
  }

  


 
  
  
}
