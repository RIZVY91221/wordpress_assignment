import 'package:bs_assignment/core/network/dio_client.dart';
import 'package:bs_assignment/core/network/rest_client.dart';
import 'package:bs_assignment/core/utils/endpoints/endpoints.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRemoteDataSource extends BaseRemoteDataSource {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ImplementBaseRemoteDataSource(this._dioClient, this._restClient);

  @override
  Future<LoginResponse> postLogin(String email, String password) async {
    Map<String, dynamic> body = {};
    body["username"] = email;
    body["password"] = password;
    try {
      final res = await _dioClient.post(Endpoints.POST_LOGIN, queryParameters: body);
      return LoginResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> postSignup(Map<String, dynamic> data) async {
    try {
      final res = await _dioClient.post(Endpoints.POST_SIGNUP, data: data);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
