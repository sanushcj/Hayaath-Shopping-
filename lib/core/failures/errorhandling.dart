import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hayaath_shopping/core/utilitiies.dart';
import 'package:http/http.dart' as http;

void errorHandling(
    {required VoidCallback onSuccess,
    required http.Response response,
    required BuildContext context}) async {
  switch ( response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;

    default:
      showSnackBar(
          context, 'Something Went Wrong Please Restart your Application');
  }
}
