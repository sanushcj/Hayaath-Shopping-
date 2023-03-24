import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/routes/routes.dart';
import 'package:hayaath_shopping/theme/application_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: HayaathTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
