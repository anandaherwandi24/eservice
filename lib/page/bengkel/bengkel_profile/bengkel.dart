import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:e_service/page/user/bengkel_profile/constans.dart';
import 'package:e_service/page/user/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../size_config.dart';
import 'list_item.dart';

class BengkelPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kLightTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: BengkelScreen(),
          );
        },
      ),
    );
  }
}

class BengkelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 10, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(100),
            ),
            decoration: BoxDecoration(
              color: Colors.green[300],
              // borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('image/banner.JPG'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: 24,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Agung Toyota",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 24,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "5 Km",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      profileInfo,
                      ProfileListItem(
                        icon: LineAwesomeIcons.map_marker,
                        text: 'Jl.Yos Sudarso,Kec.Batu Ampar',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.clock,
                        text: 'Buka-tutup 08.00-18.00',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.phone,
                        text: '0813-7766-2012',
                      ),
                      Container(
                        height: kSpacingUnit.w * 4,
                        width: kSpacingUnit.w * 20,
                        margin: EdgeInsets.all(kSpacingUnit.w * 3),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).accentColor,
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) {
                                return EditProfilePage();
                              }),
                            );
                          },
                          padding: EdgeInsets.all(12),
                          color: Colors.green,
                          child: Text('Daftar Produk',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 4,
                        width: kSpacingUnit.w * 20,
                        margin: EdgeInsets.only(
                          left: kSpacingUnit.w * 3,
                          right: kSpacingUnit.w * 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).accentColor,
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) {
                                return EditProfilePage();
                              }),
                            );
                          },
                          padding: EdgeInsets.all(12),
                          color: Colors.green,
                          child: Text('Edit Data',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
