// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_1/Model/Category_Repo_Model.dart';
import 'package:project_1/Repository/CategoreRepository.dart';
import 'package:project_1/screens/single_product.dart';

class CategoryProductScreen extends StatelessWidget {
  String categoryName;
  CategoryProductScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '$categoryName category',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: CategoryRepository().getProductsByCategory(categoryName),
          builder: (context, snapshot) {
            print("snap...${snapshot.data}");
            print("snap...${snapshot.connectionState}");

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("wait you are in CategoryRepository"),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: Text("data is null"),
              );
            }

            if (snapshot.connectionState == ConnectionState.none) {
              return Text("ConnectionState.none");
            }
            if (snapshot.data != null &&
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final listOfProducts = snapshot.data!;
                return GridView.builder(
                  itemCount: listOfProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (context) {
                          return single_product(
                            productId: listOfProducts[index].id,
                          );
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        margin:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              listOfProducts[index].thumbnail,
                              height: 100,
                              width: 100,
                            ),
                            Text('${listOfProducts[index].title}'),
                            Text('\$ ${listOfProducts[index].price}'),
                            Row(
                              children: [
                                Text('\$250'),
                                SizedBox(width: 30),
                                Text(
                                    '${listOfProducts[index].discountPercentage}%'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                );
              }
            }
            return Text('Try Again Later!');
          }),
    );
  }
}
