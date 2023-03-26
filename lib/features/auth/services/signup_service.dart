import 'package:hayaath_shopping/model/usermodel.dart';
import 'package:http/http.dart' as http;

import '../../../constants/ipaddress/myipaddress.dart';

class SignUpServie {
  signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {} catch (e) {
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
      http.post(theurl,
          body: user.toJson(),
          headers: <String, String>{'Content-Type': 'application/json;' 'charset=UTF-8',
          });
    }
  }
}
