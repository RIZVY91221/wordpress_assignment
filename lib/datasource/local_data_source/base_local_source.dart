import 'package:bs_assignment/datasource/local_data_source/i_base_local_data_source.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseLocalDataSource {
  @factoryMethod
  factory BaseLocalDataSource.from() => ImplementBaseLocalDataSource();

  Future initBoxes(List<String> boxs);
  String get accessToken;
  Future<void> setAccessToken(String accessToken);
  Future<void> logout();
  String get currentUserId;
  Future<void> setCurrentUserId(String userId);
  LoginResponse get userDefault;
  Future<void> setUserDefault(LoginResponse userDefault);
}
