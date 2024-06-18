import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_app/configs/constants/api_constants.dart';
import 'package:plant_app/configs/helpers/dio_helper.dart';
import 'package:plant_app/data/db/app_database.dart';
import 'package:plant_app/data/repository/news_repo.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignIn/authentication_repository.dart';
import 'package:plant_app/ui/modules/LoginRegister/EmailSignUp/emailsignup_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  ));

  getIt.registerSingleton<DioHelper>(DioHelper());
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());
  getIt.registerLazySingleton<EmailSignUpRepository>(
      () => EmailSignUpRepository());

  getIt.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
  getIt.registerSingleton<NewsRepository>(NewsRepository());
}
