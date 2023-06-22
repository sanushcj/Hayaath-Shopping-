import 'package:flutter/material.dart';
import 'package:hayaath_shopping/common/alltextfields.dart';
import 'package:hayaath_shopping/features/admin/pages/product/add_product.dart';
import '../../../../theme/colors.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Pallete.iceBlue,
        title: Text(
          'Hayaath Shopping',
          style: TextStyle(
              fontSize: 25, color: Pallete.premium, fontFamily: "LogoName"),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TheBoldText(
                thetile: 'Hello Admin',
                size: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProductPage.routeName);
        },
        child: Icon(Icons.add),
        elevation: 5,
        backgroundColor: Pallete.premium,
        tooltip: 'Add your Product',
      ),
    );
  }
}
