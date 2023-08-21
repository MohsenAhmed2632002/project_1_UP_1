// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:project_1/screens/Homescreen.dart';
import 'package:project_1/screens/cart.dart';
import 'package:project_1/screens/product.dart';
import 'package:project_1/screens/shopping_cart.dart';
import 'package:project_1/screens/search.dart';

class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final ScreenList = [
    Homescreen(),
    search(),
    shopping_cart(),
    cart(),
    product(),
  ];
  bool Isconncted = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            onTap: (Index) {
              setState(() {
                currentIndex = Index;
              });
            },
            unselectedItemColor: Color.fromARGB(255, 59, 59, 59),
            selectedItemColor: Color.fromARGB(255, 16, 9, 107),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "shopping_cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_contact_calendar_rounded),
                  label: "cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits_outlined),
                  label: "production"),
            ]),
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Row(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "searsh",
                      border: OutlineInputBorder(),
                      focusColor: Color.fromARGB(255, 255, 255, 255),
                      prefixIcon: Icon(Icons.search_sharp,
                          color: Color.fromARGB(255, 16, 9, 107))),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.favorite, color: Color.fromARGB(255, 0, 0, 0)),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.notifications, color: Color.fromARGB(255, 0, 0, 0)),
            ],
          ),
        ),
        body: ScreenList[currentIndex]);
  }
}
// void initState() {
  //   super.initState();
  //   final subscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     if (result == ConnectivityResult.none) {
  //       setState(() {
  //         Isconncted = false;
  //       });
  //     } else {
  //       setState(() {
  //         Isconncted = true;
  //       });
  //     }
  //   });
  // }