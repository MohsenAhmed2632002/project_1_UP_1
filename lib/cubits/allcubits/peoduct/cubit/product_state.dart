part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductSuccess extends ProductState {
  final ProductModel productModel;
  GetProductSuccess(this.productModel);
}
