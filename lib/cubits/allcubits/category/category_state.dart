// ignore_for_file: must_be_immutable

part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<CategoryRepoModel> list;
  CategorySuccess(this.list);
}

class CategoryNoEnterNet extends CategoryState {}

class CategoryFailed extends CategoryState {}

class CategoryEmpty extends CategoryState {}
