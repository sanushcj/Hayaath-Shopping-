// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/core/failures/errorhandling.dart';
import 'package:hayaath_shopping/core/utilitiies.dart';
import 'package:hayaath_shopping/model/usermodel.dart';
import 'package:http/http.dart' as http;

import '../../../network/mynet.dart';
class SignUpServie {
  signupUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext ctx}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: 'User',
        type: '',
        token: '',
      );
      final theurl = Uri.parse('$url/apiauthentication/signup');
      http.Response result = await http
          .post(theurl, body: user.toJson(), headers: <String, String>{
        'Content-Type': 'application/json;' 'charset=UTF-8',
      });
      if (kDebugMode) {
        print(result);
      }
      errorHandling(
          onSuccess: () {
            showSnackBar(ctx, 'Congratulations Your Account has been Created');
          },
          response: result,
          context: ctx);
    } catch (e) {
      showSnackBar(ctx, 'Oops $e'.toString());
    }
  }
}
