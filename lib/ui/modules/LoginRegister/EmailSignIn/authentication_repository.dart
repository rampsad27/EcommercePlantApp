import 'dart:developer';

import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/ui/modules/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  SharedPreferences? preferences;
  AuthenticationRepository() {
    _getSharedPrefInstance();
  }

  Future<void> _getSharedPrefInstance() async {
    await Future.delayed(const Duration(seconds: 1));
    preferences = await getIt.getAsync<SharedPreferences>();
  }

  final String _email = 'email';
  final String _password = 'password';

  Future<bool> saveUserInfo(String email, String password) async {
    try {
      await preferences?.setString(_email, email);
      await preferences?.setString(_password, password);

      var x = getUserInfo();
      log("X is $x");
    } catch (e) {
      log(e.toString());
    }

    return true;
  }

  UserNameModel getUserInfo() {
    var email = preferences?.getString(_email);
    return UserNameModel(email: email ?? "");
  }

  Future<bool> isUserLoggedIn() async {
    var email = preferences?.getString(_email);
    var password = preferences?.getString(_password);

    return email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  Future<bool?> logout() async {
    return await preferences?.clear();
  }
}
