part of 'food_cubit.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}
class FoodLoaded extends FoodState {
  final List<FoodMealsModel> categories;
  FoodLoaded( this.categories);
}
class FoodError extends FoodState {
  final String message;
  FoodError(this.message);
}
