// ignore_for_file: must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Repository/CategoreRepository.dart';
import 'package:project_1/Model/Category_Repo_Model.dart';
import 'package:project_1/screens/category_product_screen.dart';

class product extends StatelessWidget {
  int activeAnimation = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<List<CategoryRepoModel>>(
              future: CategoryRepository().getAllCategories(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CategoryRepoModel>> snapshot) {
                print('my connection state : ${snapshot.connectionState}');
                final listOfCategories = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Text('List is empty!');
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return Text('No Internet Connection!');
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: listOfCategories!.length,
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
                return SizedBox();
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "what is your raet",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Icon(
                  Icons.favorite,
                )
              ],
            ),
            Container(
              height: 300,
              width: 600,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listview2.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("${listview2[index]["pic"]}",
                              height: 150, width: 200),
                          Text("${listview2[index]["name"]}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 60, 84, 88))),
                          Row(
                            children: [
                              Text(
                                "${listview2[index]["sale"]}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 182, 0, 0)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("${listview2[index]["per"]}"),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
