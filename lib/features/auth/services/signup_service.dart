// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

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
        password: password,
        email: email,
        address: '',
        type: '',
      );

      http.Response res = await http.post(
        Uri.parse('http://192.168.18.250:3000/authentication/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      errorHandling(
        response: res,
        context: ctx,
        onSuccess: () {
          showSnackBar(
            ctx,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      log(e.toString());
      showSnackBar(ctx, 'Oops $e'.toString());
    }
  }
}
