import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import 'package:hayaath_shopping/main.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 11,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/img/appbarlogo.png'))
                ],
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  mysharedPreferences.clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.routeName, (route) => false);
                },
                icon: Icon(Icons.logout),
                label: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
