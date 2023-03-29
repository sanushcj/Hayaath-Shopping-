import 'package:flutter/material.dart';
import 'package:hayaath_shopping/core/failures/errorhandling.dart';
import 'package:hayaath_shopping/core/utilitiies.dart';
import 'package:hayaath_shopping/model/usermodel.dart';
import 'package:http/http.dart' as http;

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
          type: '');

      final uri = Uri.parse('$url/authentication/login');

      final response = await http.post(
        uri,
        body: userobj.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      errorHandling(
          onSuccess: () {
            showSnackBar(context, "Login Successfully");
          },
          response: response,
          context: context);
    } catch (e) {
      showSnackBar(context, "$e -- Errorr Successfully");
    }
  }
}
