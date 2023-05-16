import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/features/auth/controller/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../core/utilitiies.dart';
import '../../../main.dart';
import '../../../network/mynet.dart';

class TokenCheck {
  tokenResult({required BuildContext context}) async {
    try {
      String? token = mysharedPreferences.getString('x-auth-token');
      if (token == null) {
        mysharedPreferences.setString('x-auth-token', '');
      }

      final tokenuri = Uri.parse('$url/authentication/usercheck');
      http.Response tokenResult = await http.post(tokenuri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Bearer': token!
          });
      bool response = jsonDecode(tokenResult.body);
      // log(response);

      if (response
       == true) {
        http.Response userResponse = await http.get(
            Uri.parse('$url/authentication/userdata'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Bearer': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      showSnackBar(context,
          "$e -- Errorr Successfully in authentication token checking from dart");
    }
  }
}
