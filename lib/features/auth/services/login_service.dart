import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/core/failures/errorhandling.dart';
import 'package:hayaath_shopping/core/utilitiies.dart';
import 'package:hayaath_shopping/features/admin/pages/admin_navbar.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:hayaath_shopping/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../network/mynet.dart';
import '../../bottom-navigation-bar/bottomnavbar.dart';

class LoginService {
  void loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User userobj = User(
          id: '',
          name: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      final uri = Uri.parse('$url/authentication/login');

      final response = await http.post(
        uri,
        body: userobj.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      errorHandling(
          onSuccess: () async {
            print(response.body.toString());
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            mysharedPreferences.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            log(mysharedPreferences.getString('x-auth-token').toString());
            Provider.of<UserProvider>(context, listen: false).user.type ==
                    "user"
                ? Navigator.pushNamedAndRemoveUntil(
                    context, MyBottomNavBar.bottomRoute, (route) => false)
                : Navigator.pushNamedAndRemoveUntil(
                    context, AdminNavBar.bottomRoute, (route) => false);
          },
          response: response,
          context: context);
    } catch (error) {
      showSnackBar(context, "$error -- Errorr Successfully");
      // if (error == "dkwhcuwucheuc") {}
    }
  }
}
