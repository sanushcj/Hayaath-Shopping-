import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  static final bottomRoute = '/bottomPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GNav(tabs: [
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
      ]),
    );
  }
}
