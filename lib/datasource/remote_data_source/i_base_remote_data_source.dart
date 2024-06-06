import 'dart:convert';

import 'package:bs_assignment/core/network/dio_client.dart';
import 'package:bs_assignment/core/network/rest_client.dart';
import 'package:bs_assignment/core/utils/endpoints/endpoints.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/models/auth/login_response.dart';
import 'package:bs_assignment/models/product/product_resource.dart';
import 'package:flutter/services.dart';
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

  @override
  Future<List<ProductResource>> getProductList(String filterBy) async {
    try {
      // Load JSON string from assets
      List<dynamic> res = [];
      await rootBundle.loadString(Assets.assetsProductResponse).then((value) async => res = await json.decode(value) as List<dynamic>);
      // Sort and filter the list based on the filterBy parameter
      List<ProductResource> resource = res.map((x) => ProductResource.fromJson(x)).toList();

      if (filterBy.isNotEmpty) {
        switch (filterBy) {
          case "Newest":
            resource.sort((a, b) => DateTime.parse(b.product?.dateCreated ?? '').compareTo(DateTime.parse(a.product?.dateCreated ?? '')));
            break;
          case "Oldest":
            resource.sort((a, b) => DateTime.parse(a.product?.dateCreated ?? '').compareTo(DateTime.parse(b.product?.dateCreated ?? '')));
            break;
          case "Price low > high":
            resource.sort((a, b) => int.parse(a.product?.price ?? '0').compareTo(int.parse(b.product?.price ?? '0')));
            break;
          case "Price high > low":
            resource.sort((a, b) => int.parse(b.product?.price ?? '0').compareTo(int.parse(a.product?.price ?? '0')));
            break;
          default:
            break;
        }
      }
      return resource;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getUserDetails() async {
    try {
      final res = await _dioClient.get(Endpoints.USER_DETAILS);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser(String id, Map<String, dynamic> data) async {
    try {
      final res = await _dioClient.post("${Endpoints.UPDATE_USER}/$id", data: data);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
