import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/utils.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Account created! Login with the same credentials!",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
