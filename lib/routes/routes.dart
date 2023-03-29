import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/features/auth/pages/signup_page.dart';
import 'package:hayaath_shopping/features/home/pages/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  SignUPage.routeName: (context) => const SignUPage(),
  HomePage.routeName:(context) => const HomePage()
};
