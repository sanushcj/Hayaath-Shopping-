import 'dart:convert';
import 'dart:developer';

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
        log('token null in token check');
        mysharedPreferences.setString('x-auth-token', '');
      }
      log('token not null in token check');

      final tokenuri = Uri.parse('$url/authentication/usercheck');
log(token.toString()
);
      http.Response tokenResult = await http.post(tokenuri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Bearer': token!
          });
          log(tokenResult.body);
      bool response = jsonDecode(tokenResult.body);
      // log(response);

      if (response
       == true) {
        log('token not null in token check response trueeeee');

        http.Response userResponse = await http.get(
            Uri.parse('$url/authentication/userdata'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Bearer': token
            });
            log(userResponse.body);

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      showSnackBar(context,
          "$e -- Errorr Successfully in authentication token checking from dart");
    }
  }
}
