import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/allcubits/peoduct/cubit/product_cubit.dart';


class single_product extends StatefulWidget {
  final int productId;

  const single_product({super.key, required this.productId});
  @override
  State<single_product> createState() => _single_productState();}


class _single_productState extends State<single_product> {
  int activeAnimation = 0;
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getsingleproduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'productData',
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
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is GetProductSuccess) {
                  final productData = state.productModel;
                  return Container(
                    child: CarouselSlider.builder(
                      itemCount: productData.images.length,
                      options: CarouselOptions(
                          height: 180,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 1),
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeAnimation = index)),
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Container(
                          child: Image.network(
                            productData.images[itemIndex],
                            width: MediaQuery.of(context).size.width,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  CircularProgressIndicator();
                }
                return Scaffold();
              },
            )
          ],
        ),
      ),
    );
  }
}
