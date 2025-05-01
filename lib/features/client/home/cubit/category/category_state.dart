part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
   List<CategoryModel> category;

  CategoryLoaded(this.category,);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}


