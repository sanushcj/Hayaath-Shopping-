import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hayaath_shopping/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/mycarosal.dart';
import '../widgets/rowmini.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Pallete.backgroundColor,
        centerTitle: true,
        title: Text(
          'Hayaath Shopping',
          style: TextStyle(
              fontSize: 40, color: Pallete.premium, fontFamily: "LogoName"),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
              child: SizedBox(
                height: 50,
                child: CupertinoSearchTextField(
                  placeholder: "Search hayaath.com",
                ),
              ),
            ),
            MyCarosal(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: RowMiniCategories(),
            ),
          ],
        ),
      ),
    );
  }
}
