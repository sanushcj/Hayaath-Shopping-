import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/features/auth/services/tokencheck.dart';
import 'package:hayaath_shopping/features/bottom-navigation-bar/bottomnavbar.dart';
import 'package:hayaath_shopping/routes/routes.dart';
import 'package:hayaath_shopping/theme/application_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/admin/pages/admin_navbar.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences mysharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mysharedPreferences = await SharedPreferences.getInstance();
  final fontLoader = FontLoader("LogoName");
  fontLoader.addFont(rootBundle.load('assets/font/HayaathHomeLogo.TTF'));
  fontLoader.load().then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ], child: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TokenCheck tokencontroller = TokenCheck();
  @override
  void initState() {
    tokencontroller.tokenResult(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == "user"
              ? MyBottomNavBar()
              : AdminNavBar()
          : LoginPage(),
      theme: HayaathTheme.theme,
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      routes: routes,
    );
  }
}
