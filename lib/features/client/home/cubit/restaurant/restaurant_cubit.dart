import 'package:bloc/bloc.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';
import 'package:food_app/features/client/home/data/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(this.homeRepository) : super(RestaurantInitial());

  
   List<RestaurantModel> restaurant = [];
   final HomeRepository homeRepository;

    Future<void> getAllRestaurants() async {
    emit(RestaurantLoading());
    try {
      final restaurant = await homeRepository.getAllRestaurants();
      print("RestaurantCubit: Loaded ${restaurant.length} restaurants");
      this.restaurant = restaurant;
      emit(RestaurantLoaded(restaurant));
    } catch (e) {
      print("RestaurantCubit: Error: $e");
      emit(RestaurantError(message:   'Failed to load restaurants: $e'));
    }
  }

  

}
