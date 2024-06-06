import 'package:bs_assignment/environment/build_config.dart';

class Endpoints {
  Endpoints._();

  // base url
  static var baseUrl = BuildConfig.instance.envVariables.baseUrl;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const int sendTimeout = 10000;

  static const String source = "";

  //TODO: Add other settings and url endpoint here

  static const String POST_LOGIN = "wp-json/jwt-auth/v1/token";
  static const String POST_SIGNUP = "wp-json/wp/v2/users/register";

  static const String USER_DETAILS = "wp-json/wp/v2/users/me";
  static const String UPDATE_USER = "wp-json/wp/v2/users/";
}
