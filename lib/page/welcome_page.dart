import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  bool isLoading = false;

  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  // even space distribution
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "hard to find the nearest repair shop?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "let's try the eservice app.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/welcome.png"))),
                    ),
                    Column(
                      children: <Widget>[
                        // the login button
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login_page');
                          },
                          // defining the shape
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "User App",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        // creating the signup button
                        SizedBox(height: 20),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Bengkel_page');
                          },
                          color: Colors.green[500],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Workshop Owner",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
