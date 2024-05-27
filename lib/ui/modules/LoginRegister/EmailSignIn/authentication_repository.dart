import 'dart:developer';

import 'package:plant_app/configs/di/di.dart';
import 'package:plant_app/ui/modules/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  AuthenticationRepository() {
    _getSharedPrefInstance();
  }

  Future<void> _getSharedPrefInstance() async {
    await Future.delayed(const Duration(seconds: 1));
    preferences = getIt.get<SharedPreferences>();
  }

  SharedPreferences? preferences;
  final String _email = 'email';
  final String _password = 'password';
  // final String _user = 'user';

// // TODO: Let's save all the values like 1st name, last name and email in shared preferences
// // Use UserEntity as a parameter.
//   Future<bool?> saveUserInfo(UserEntity user) async {
//     return await preferences?.setString(_user, user.toJson());
//   }

//   // to get UserEntity
//   UserEntity? getUserInfo() {
//     var user = preferences?.getString(_user);
//     if (user != null) {
//       return UserEntity.fromJson(user);
//     }
//     return null;
//   }

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
