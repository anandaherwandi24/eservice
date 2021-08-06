import 'dart:convert';

import 'package:e_service/models/verificationmodel.dart';
import 'package:e_service/service/forgotservices.dart';
import 'package:flutter/material.dart';

class Resetpasswordpage extends StatefulWidget {
  static String tag = 'ForgotPaswword-page';
  final VerificationCodeModel verificationEmail;
  const Resetpasswordpage({Key key, this.verificationEmail}) : super(key: key);
  @override
  ResetpasswordpageState createState() => new ResetpasswordpageState();
}

class ResetpasswordpageState extends State<Resetpasswordpage> {
  var _passwordController = new TextEditingController();
  var _repasswordController = new TextEditingController();
  bool isChangePassword = false;

  @override
  Widget build(BuildContext context) {
    final password = TextFormField(
      keyboardType: TextInputType.text,
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Type New Password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.green,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final repassword = TextFormField(
      keyboardType: TextInputType.text,
      controller: _repasswordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Retype New Password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.green,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final saveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          resetPassword();
        },
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child:
            Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Reset Password",
          ),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 150),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                child: Image.asset(
                  'image/icon-key2.png',
                  width: 320,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 270, left: 70, right: 70),
                child: Text(
                  "Your New Password Must Be Different from Previously Used Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 140),
                children: <Widget>[
                  password,
                  SizedBox(height: 15.0),
                  repassword,
                  SizedBox(height: 15.0),
                  saveButton,
                ],
              ),
            ),
          ],
        ));
  }

  void resetPassword() {
    String emailAddress;
    emailAddress = widget.verificationEmail.email.toString();
    Map map = {"email": emailAddress, "password": _repasswordController.text};
    var requestBody = jsonEncode(map);
    UserForgotServices.changePassword(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        Navigator.of(context).pushNamed('/resetsucces');
      } else {
        _handledVerifError(
            "Failed to Send Verification Code, message: " + result.message);
      }
    }).catchError((error) {
      _handledVerifError(
          "Failed to Send Verification Code, message: " + error.toString());
    });
    print(requestBody);
  }

  void _handledVerifError(String errorMessage) {
    print(errorMessage);
    if (!mounted) return;
    setState(() {
      isChangePassword = false;
    });
  }
}
