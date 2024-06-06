import 'package:bs_assignment/core/network/dio_client.dart';
import 'package:bs_assignment/core/network/rest_client.dart';
import 'package:bs_assignment/datasource/remote_data_source/i_base_remote_data_source.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:bs_assignment/models/product/product_resource.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseRemoteDataSource {
  @factoryMethod
  static ImplementBaseRemoteDataSource create(DioClient dioClient, RestClient restClient) =>
      ImplementBaseRemoteDataSource(dioClient, restClient);

  Future<LoginResponse> postLogin(String email, String password);
  Future<Map<String, dynamic>> postSignup(Map<String, dynamic> data);

  Future<List<ProductResource>> getProductList(String filterBy);
}
