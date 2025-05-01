part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<RestaurantModel> restaurant;

  RestaurantLoaded(this.restaurant);
}

class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError({required this.message});
}
