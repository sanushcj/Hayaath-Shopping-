import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:hayaath_shopping/features/auth/services/tokencheck.dart';
import 'package:hayaath_shopping/features/splash/page/splashscreen.dart';
import 'package:hayaath_shopping/routes/routes.dart';
import 'package:hayaath_shopping/theme/application_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences mysharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mysharedPreferences = await SharedPreferences.getInstance();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child:  MyApp()));
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
      home: SplashScreen(),
      theme: HayaathTheme.theme,
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      routes: routes,
    );
  }
}
