import 'package:dio/dio.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/features/client/food_burger/data/data_source/base_food_data_source.dart';
import 'package:food_app/core/constants/end_point.dart';

class RemoteFoodDataSource implements BaseFoodDataSource {
  late Dio dio;

  RemoteFoodDataSource() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  @override
  Future<List<dynamic>> getAllFood() async {
    try {
      Response response = await dio.get(EndPoint.meals);
      print("RemoteFoodDataSource: Response: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        if (response.data is Map<String, dynamic> && response.data['data'] != null) {
          return response.data['data'] as List<dynamic>;
        } else {
          print("RemoteFoodDataSource: Invalid response format, expected 'data' key");
          throw Exception('Invalid response format: Expected "data" key');
        }
      } else {
        print("RemoteFoodDataSource: Failed with status: ${response.statusCode}");
        throw Exception('Failed to load meals: ${response.statusCode}');
      }
    } catch (e) {
      print('RemoteFoodDataSource: Error fetching meals: $e');
      throw Exception('Error fetching meals: $e');
    }
  }
}