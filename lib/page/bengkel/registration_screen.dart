import 'dart:convert';

import 'package:e_service/models/usermodel.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/registrationservices.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  static String tag = 'registration-page';
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _handphoneController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  void sentRequestInsertDataUser() {
    Usermodel usermodel = new Usermodel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        handphone: _handphoneController.text);

    var requestBody = jsonEncode(usermodel.toJson());
    UserRegistrationServices.sentRequestInsertDataUser(requestBody)
        .then((value) {
      Navigator.of(context).pushNamed('/registrationsucces');
    }).catchError((error) {});
    print(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Name", controller: _nameController),
                  inputFile(label: "Email", controller: _emailController),
                  inputFile(
                      label: "Password",
                      controller: _passwordController,
                      obscureText: true),
                  inputFile(
                      label: "Handphone ", controller: _handphoneController),
                ],
              ),
              Container(
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
                    sentRequestInsertDataUser();
                  },
                  color: Colors.green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login_page');
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              )
            ],
          ),
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
