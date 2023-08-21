import 'package:dio/dio.dart';
import 'package:project_1/Model/Category_Repo_Model.dart';

class productRepository {
  Future<ProductModel> getSingleProduct(int productId) async {
    final response =
        await Dio().get("https://dummyjson.com/products/$productId");
    final product = ProductModel.fromJson(response.data);
    return product;
  }
}

class ProductRepository {
  Future<ProductModel> getSingleProduct(int productId) async {
    final response =
        await Dio().get('https://dummyjson.com/products/$productId');

    final product = ProductModel.fromJson(response.data);

    return product;
  }
}
