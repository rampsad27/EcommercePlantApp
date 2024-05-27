import 'package:get_it/get_it.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/authentication_repository.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/emailsignup_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());
  getIt.registerLazySingleton<EmailSignUpRepository>(
      () => EmailSignUpRepository());

  getIt.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
}
