import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/cubits/allcubits/category/category_cubit.dart';
import 'package:project_1/screens/category_product_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  int activeAnimation = 0;
  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeAnimation, count: ImageList.length);

  final ImageList = [
    'assets/images/pic2.JPG',
    'assets/images/pic3.JPG',
    'assets/images/pic4.JPG',
    'assets/images/pic5.JPG',
  ];
  final listview2 = [
    {
      "name": "lap2",
      "pic": "assets/images/pic2.JPG",
      "per": "200",
      "sale": "%15"
    },
    {
      "name": "lap3",
      "pic": "assets/images/pic3.JPG",
      "per": "300",
      "sale": "%15"
    },
    {
      "name": "lap4",
      "pic": "assets/images/pic4.JPG",
      "per": "400",
      "sale": "%15",
    },
    {
      "name": "lap5",
      "pic": "assets/images/pic5.JPG",
      "per": "500",
      "sale": "%15"
    },
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<CategoryCubit>(context).getAllCategory();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategory(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  items: ImageList.map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                  options: CarouselOptions(
                      height: 180,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          setState(() => activeAnimation = index)),
                ),
                SizedBox(height: 10),
                buildIndicator(),
                SizedBox(height: 10),
                Divider(
                  height: 15,
                  thickness: 3,
                  indent: 15,
                  endIndent: 15,
                  color: Color.fromARGB(255, 16, 9, 107),
                ),
                SizedBox(height: 10),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    print(state);
                    if (state is CategorySuccess) {
                      final listOfCategories = state.list;
                      return Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: listOfCategories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return CategoryProductScreen(
                                    categoryName: listOfCategories[index].name,
                                  );
                                }));
                              },
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 31,
                                      backgroundImage: NetworkImage(
                                        listOfCategories[index].image,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      listOfCategories[index].name,
                                      style: TextStyle(
                                        color: Color(0xff9098B1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Text("handl");
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "category",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 140),
                    Text(
                      "more categories ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 16, 9, 107), fontSize: 18),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 300,
                  width: 600,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listview2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("${listview2[index]["pic"]}",
                                  height: 150, width: 200),
                              Text("${listview2[index]["per"]}"),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 10),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
