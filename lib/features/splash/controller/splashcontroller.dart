import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/controller/user_provider.dart';
import '../../auth/pages/login_page.dart';
import '../../home/pages/home_page.dart';

class SplashProvider extends ChangeNotifier {
  gotoHome(BuildContext context) async {
     Future.delayed(
      const Duration(seconds: 3),
    );
    Provider.of<UserProvider>(context).user.token.isNotEmpty
        ? Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (route) => false)
        : Navigator.pushNamedAndRemoveUntil(
            context, LoginPage.routeName, (route) => false);
  }
}
