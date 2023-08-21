import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_1/Model/Category_Repo_Model.dart';
import 'package:project_1/Repository/CategoreRepository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  void getAllCategory() async {
    final result = await CategoryRepository().getAllCategories();
    emit(CategorySuccess(result));
  }
}
