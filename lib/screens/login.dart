import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screens/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailControllor = TextEditingController();

  TextEditingController passControllor = TextEditingController();

  bool isObscuretextone = true;

  bool isObscuretexttwo = true;

  Widget build(BuildContext context) {
    return Scaffold(
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
                    )),
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
                            controller: emailControllor,
                            obscureText: isObscuretextone,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (value) {
                              if (value!.length < 8 || value.isEmpty) {
                                return "it must be biger than 8 ";
                              } else {}
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscuretextone = !isObscuretextone;
                                  });
                                },
                                icon: isObscuretextone
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
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
                            validator: (value) {
                              if (value!.length < 8 || value.isEmpty) {
                                return "it must be biger than 8 ";
                              } else {}
                              return null;
                            },
                            obscureText: isObscuretexttwo,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isObscuretexttwo
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isObscuretexttwo = !isObscuretexttwo;
                                  });
                                },
                              ),
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
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _login();

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return mainpage();
                            }));
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
    );
  }

  _login() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/auth/login", data: {
        "email": emailControllor.text,
        "password": passControllor.text,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$response")));

      final accessToken = response.data(["access_token"]);

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("access_token", accessToken);

      final access = await prefs.get("access_token");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$access")));

      print("my access$accessToken");
      print(access);
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
