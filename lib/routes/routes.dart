import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/features/auth/pages/signup_page.dart';
import 'package:hayaath_shopping/features/bottom-navigation-bar/bottomnavbar.dart';
import 'package:hayaath_shopping/features/home/pages/home_page.dart';
import 'package:hayaath_shopping/features/splash/page/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginPage.routeName: (context) => const LoginPage(),
  SignUPage.routeName: (context) => const SignUPage(),
  MyBottomNavBar.bottomRoute: (context) => const MyBottomNavBar(),
  HomePage.routeName: (context) => const HomePage()
};
