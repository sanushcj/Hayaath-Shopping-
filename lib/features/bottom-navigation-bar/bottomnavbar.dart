import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hayaath_shopping/features/home/pages/home_page.dart';
import 'package:hayaath_shopping/theme/colors.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  static final bottomRoute = '/bottomPage';

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _listofPages = <Widget>[
    HomePage(),
    Text(
      'Likes',
    ),
    Text(
      'Search',
    ),
    Text(
      'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _listofPages.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Pallete.pureblack),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
            child: GNav(
              // mainAxisAlignment: MainAxisAlignment.center,
              // tabBorderRadius: 30,
              duration: Duration(milliseconds: 400),
              gap: 8,
              activeColor: Pallete.iceBlue,
              color: Color.fromARGB(255, 43, 44, 45),
              backgroundColor: Pallete.pureblack,
              curve: standardEasing,
              // haptic: bool.fromEnvironment(AutofillHints.addressCity),
              tabs: [
                GButton(
                  icon: CupertinoIcons.home,
                  text: 'HOME',
                ),
                GButton(
                  icon: CupertinoIcons.list_bullet_below_rectangle,
                  text: 'STORE',
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  text: 'ACCOUNT',
                ),
                GButton(
                  icon: CupertinoIcons.cart,
                  text: 'CART',
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
