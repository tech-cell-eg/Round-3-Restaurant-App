import 'package:bloc/bloc.dart';
import 'package:food_app/features/client/home/data/model/categpry_model.dart';
import 'package:food_app/features/client/home/data/repository/home_repository.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepository) : super(CategoryInitial());

  List<CategoryModel> categories = [];
  final HomeRepository homeRepository;

  List<CategoryModel> getAllCategories() {
    emit(CategoryLoading());
    homeRepository.getAllProducts().then((categories) {

      emit(CategoryLoaded(categories));
      this.categories = categories;
    });

    return categories;
  }

  
}
