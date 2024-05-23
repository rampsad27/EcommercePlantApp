import 'package:get_it/get_it.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/emailsignup_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<EmailSignUpRepository>(
      () => EmailSignUpRepository());
}
