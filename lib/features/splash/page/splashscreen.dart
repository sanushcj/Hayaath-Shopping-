import 'package:flutter/material.dart';
import 'package:hayaath_shopping/constants/global_variables.dart';
import 'package:hayaath_shopping/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../auth/controller/user_provider.dart';
import '../../auth/pages/login_page.dart';
import '../../home/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final routeName = '/splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  gotoHome(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Provider.of<UserProvider>(context).user.token.isNotEmpty
        ? Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (route) => false)
        : Navigator.pushNamedAndRemoveUntil(
            context, LoginPage.routeName, (route) => false);
  }

  @override
  void initState() {
    gotoHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(' SHOPPING'), rrHeight40, Text('SHOP - SMARTER')],
            ),
          ],
        ),
      ),
    );
  }
}
