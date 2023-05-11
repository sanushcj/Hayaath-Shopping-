import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/core/failures/errorhandling.dart';
import 'package:hayaath_shopping/core/utilitiies.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:hayaath_shopping/features/home/pages/home_page.dart';
import 'package:hayaath_shopping/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../network/mynet.dart';

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
            mysharedPreferences.setString('x-auth-token', jsonDecode(response.body)['token']);
            // log(mysharedPreferences.getString('x-auth-token').toString());
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          },
          response: response,
          context: context);
    } catch (e) {
      showSnackBar(context, "$e -- Errorr Successfully");
    }
  }
}
