import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text('${user.toJson()}'),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  mysharedPreferences.clear();
                  Navigator.pushNamedAndRemoveUntil(context,LoginPage.routeName, (route) => false);
                },
                icon: Icon(Icons.logout),
                label: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
