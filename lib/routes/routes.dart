import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/features/auth/pages/signup_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case SignUPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUPage(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
