import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_1/Model/Category_Repo_Model.dart';
import 'package:project_1/Repository/productRepository.dart';


part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getsingleproduct(int productId) async {
    final productData = await ProductRepository().getSingleProduct(productId);
    emit(GetProductSuccess(productData));
  }
}
