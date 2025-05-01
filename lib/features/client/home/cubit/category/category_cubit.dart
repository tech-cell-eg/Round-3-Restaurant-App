import 'package:bloc/bloc.dart';
import 'package:food_app/features/client/home/data/model/categpry_model.dart';
import 'package:food_app/features/client/home/data/repository/home_repository.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepository) : super(CategoryInitial());

  List<CategoryModel> categories = [];
  List<CategoryModel> filteredCategories = [];

  final HomeRepository homeRepository;

  List<CategoryModel> getAllCategories() {
    emit(CategoryLoading());
    homeRepository.getAllProducts().then((categories) {
      this.categories = categories;
      filteredCategories = categories;
      emit(CategoryLoaded(filteredCategories));
    });

    return categories;
  }

  void searchCategory(String query) {
    if (query.isEmpty) {
      filteredCategories = categories;
    } else {
      filteredCategories =
          categories.where((restaurant) {
            return restaurant.name.toLowerCase().startsWith(
              query.toLowerCase(),
            );
          }).toList();
    }
    emit(CategoryLoaded(filteredCategories));
  }
}
