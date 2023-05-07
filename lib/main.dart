import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/features/auth/services/authentication.dart';
import 'package:hayaath_shopping/features/home/pages/home_page.dart';
import 'package:hayaath_shopping/routes/routes.dart';
import 'package:hayaath_shopping/theme/application_theme.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TokenCheck tokenController = TokenCheck();

  @override
  void initState() {
    tokenController.tokenResult(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomePage()
          : LoginPage(),
      theme: HayaathTheme.theme,
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      routes: routes,
    );
  }
}
