import 'package:e_service/page/splash_screen.dart';
import 'package:e_service/page/bengkel/bengkel_profile/bengkel.dart';
import 'package:e_service/page/user/bengkel_profile/bengkel.dart';
import 'package:e_service/page/user/forgot_password_screen.dart';
import 'package:e_service/page/user/forgot_password_verification.dart';
import 'package:e_service/page/user/home/home.dart';
import 'package:e_service/page/user/location.dart';
import 'package:e_service/page/user/login_screen.dart';
import 'package:e_service/page/user/navbar_bottom.dart';
import 'package:e_service/page/user/profile/detail_page/body.dart';
import 'package:e_service/page/user/registration_screen.dart';
import 'package:e_service/page/user/registration_succes.dart';
import 'package:e_service/page/user/reset_succes.dart';
import 'package:e_service/page/user/resetpassword.dart';
import 'package:e_service/page/user/select_bengkel/selectbengkel_page.dart';
import 'package:e_service/page/welcome_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SplasScreen',
        theme: ThemeData(),
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/splash_screen': (BuildContext context) => SplashScreen(),
          '/login_page': (BuildContext context) => LoginPage(),
          '/Registration_page': (BuildContext context) => RegistrationPage(),
          '/forgot_page': (BuildContext context) => ForgotpasswordPage(),
          '/Otp_page': (BuildContext context) => OTPPage(),
          '/navbar_bottom': (BuildContext context) => Bottomnavigation(),
          '/resetpassword': (BuildContext context) => Resetpasswordpage(),
          '/registrationsucces': (BuildContext context) => SuccesScreen(),
          '/resetsucces': (BuildContext context) => ResetsuccesScreen(),
          '/profile_page': (BuildContext context) => ProfilePage(),
          '/home_page': (BuildContext context) => HomePage(),
          '/Bengkel_page': (BuildContext context) => BengkelPage(),
          '/Profile_page': (BuildContext context) => ProfilePage(),
          '/location': (BuildContext context) => Location(),
          '/welcome_page': (BuildContext context) => WelcomePage(),
          '/selectbengkel_page': (BuildContext context) => SelectbengkelPage(),
        });
  }
}
