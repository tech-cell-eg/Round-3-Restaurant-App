import 'package:bloc/bloc.dart';
import 'package:food_app/features/client/food_burger/data/models/food_model.dart';
import 'package:food_app/features/client/food_burger/data/repo/food_repo.dart';
part 'food_state.dart';




class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this.foodRepo) : super(FoodInitial());

  List<FoodMealsModel> categories = [];
  final FoodRepo foodRepo;

  Future<void> getAllCategories() async {
    emit(FoodLoading());
    try {
      final categories = await foodRepo.getAllProducts();
      print("FoodCubit: Loaded ${categories.length} categories");
      this.categories = categories;
      emit(FoodLoaded(categories));
    } catch (e) {
      print("FoodCubit: Error: $e");
      emit(FoodError('Failed to load categories: $e'));
    }
  }
}