import 'package:e_service/page/user/activity/activity_page.dart';
import 'package:e_service/page/user/bengkel_profile/bengkel.dart';
import 'package:e_service/page/user/garage_page.dart';
import 'package:e_service/page/user/home/home.dart';
import 'package:e_service/page/user/location.dart';
import 'package:e_service/page/user/profile/profile/body.dart';
import 'package:e_service/page/user/select_bengkel/selectbengkel_page.dart';

/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// This is the stateful widget that the main application instantiates.
class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomnavigationState extends State<Bottomnavigation> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    ActivtyPage(),
    GaragePage(),
    ProfilePage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: ImageIcon(AssetImage("image/ic_repair.png")),
        onPressed: () {
          Navigator.of(context).pushNamed('/selectbengkel_page');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HomePage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home_rounded,
                          color: currentTab == 0 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ActivtyPage(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.format_list_bulleted,
                          color: currentTab == 1 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Activity',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            GaragePage(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("image/garage.png"),
                          color: currentTab == 2 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Garage',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfilePage(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
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
