import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hayaath_shopping/theme/colors.dart';
import 'home/admin_posts.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  static final bottomRoute = '/bottomPage';

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _listofPages = <Widget>[
    AdminHomePage(),
    Text(
      'Analytics',
    ),
    Text(
      'Cart',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _listofPages.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          width: double.infinity,
          // decoration: BoxDecoration(color: Pallete.pureblack),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
            child: GNav(
              // mainAxisAlignment: MainAxisAlignment.center,
              // tabBorderRadius: 30,
              textStyle: TextStyle(fontSize: 10),
              duration: Duration(milliseconds: 400),
              gap: 8,
              activeColor: Pallete.iceBlue,
              color: Color.fromARGB(255, 43, 44, 45),
              backgroundColor: Pallete.pureblack,
              curve: standardEasing,
              textSize: 3,

              // haptic: bool.fromEnvironment(AutofillHints.addressCity),
              tabs: [
                GButton(
                  icon: CupertinoIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.list_bullet_below_rectangle,
                  text: 'Analytics',
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  text: 'Cart',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
