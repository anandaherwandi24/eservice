import 'dart:convert';

import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/usermodel.dart';
import 'package:e_service/page/user/navbar_bottom.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/userloginservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Usermodel usermodel = new Usermodel();
  ApiResponse apiResponse;
  String uid;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Incorrect email or password'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Oke'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void authentication() {
    setState(() {
      isLoading = true;
    });
    Usermodel usermodel = new Usermodel(
        email: _emailController.text, password: _passwordController.text);

    var requestBody = jsonEncode(usermodel.toJson());
    print(requestBody);
    UserLoginServices.authentication(requestBody).then((value) {
      final result = value;
      print(result.content);
      if (result.success == true && result.code == 200) {
        usermodel = Usermodel.fromJson(result.content);
        uid = usermodel.id.toString();
        print(uid);

        _storeUserData();
        _emailController.text = "";
        _passwordController.text = "";
        Navigator.of(context).pushReplacementNamed('/navbar_bottom');
      } else {
        _showMyDialog();
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      // String err = error.toString();
    });
  }

  void _storeUserData() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyId, value: uid);
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            inputFile(
                                label: "Email", controller: _emailController),
                            inputFile(
                                label: "Password",
                                obscureText: true,
                                controller: _passwordController)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              )),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                              authentication();
                            },
                            color: Colors.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/forgot_page');
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.green),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Registration_page');
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/img_login.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
    );
  }
}

Widget inputFile({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 3.0),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
