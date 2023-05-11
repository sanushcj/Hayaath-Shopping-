import 'package:flutter/material.dart';
import 'package:hayaath_shopping/constants/global_variables.dart';
import 'package:hayaath_shopping/features/splash/controller/splashcontroller.dart';
import 'package:hayaath_shopping/theme/colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

 final SplashProvider splashController = SplashProvider();

  @override
  Widget build(BuildContext context) {
    splashController.gotoHome(context);

    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text('HAYAATH SHOPPING'),
              rrHeight40,
              Text('SHOP - SMARTER')
            ],
          ),],
        ),
      ),
    );
  }
}
