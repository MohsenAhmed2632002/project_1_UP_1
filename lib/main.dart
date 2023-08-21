import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/cubits/allcubits/category/category_cubit.dart';
import 'package:project_1/cubits/allcubits/peoduct/cubit/product_cubit.dart';
import 'package:project_1/screens/login.dart';

import 'screens/mainpage.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: mainpage(),
      ),
    ),
  );
}

bool Isconncted = false;

class App_1 extends StatefulWidget {
  @override
  State<App_1> createState() => _App_1();
}

class _App_1 extends State<App_1> {
  void initState() {
    super.initState();
    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          Isconncted = false;
        });
      } else {
        setState(() {
          Isconncted = true;
        });
      }
    });
  }

  _App_1({Key? key}) : super();
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameControllor = TextEditingController();
  TextEditingController emailControllor = TextEditingController();
  TextEditingController passControllor = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    if (Isconncted == false) {
      return Scaffold(body: Center(child: Text("no net")));
    } else {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180,
                      height: 100,
                      child: Image.asset(
                        "assets/images/pic1.PNG",
                      ),
                    ),
                    Text(
                      'wellcome to lafyuu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'sign in to continue',
                      style: TextStyle(
                        color: Color.fromARGB(255, 43, 42, 42),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.person),
                            Container(
                              height: 100,
                              width: 340,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: nameControllor,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.length < 8 || value.isEmpty) {
                                    return "it must be biger than 8 ";
                                  } else {}
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter The name",
                                  labelText: "Enter Your name",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 76, 148),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 76, 148),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.person),
                            Container(
                              height: 100,
                              width: 340,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: emailControllor,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.length < 8 || value.isEmpty) {
                                    return "it must be biger than 8 ";
                                  } else {}
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter The email",
                                  labelText: "Enter Your email",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 76, 148),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 76, 148),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.lock_sharp),
                            Container(
                              height: 100,
                              width: 340,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: passControllor,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.length < 8 || value.isEmpty) {
                                    return "it must be biger than 8 ";
                                  } else {}
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter the Password",
                                  labelText: "Enter The Password",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 76, 148),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 76, 148),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 350,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                _login();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "your data is wrong  sign to  continue")));
                              }
                            },
                            child: Text(
                              "login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(),
                          ),
                        ),
                        Container(
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.facebook),
                              label: Text("login with facebook")),
                        ),
                        Container(
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.mail_outline_sharp),
                              label: Text("login with mail")),
                        ),
                        GestureDetector(
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Text(
                            "sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(150, 8, 89, 240),
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  _login() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameControllor.text,
        "email": emailControllor.text,
        "password": passControllor.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });
      print(response);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return loginScreen();
      }));
    } on DioError catch (e) {
      print(e);
      print(e.response);
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$e")));
      }
    }
  }
}
