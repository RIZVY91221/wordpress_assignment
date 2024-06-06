import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/core/base/paging_controller.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/toasts.dart';
import 'package:bs_assignment/models/product/product_resource.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum FilterBy { newest, oldest, lowestPrice, heightPrice }

class HomeController extends BaseController {
  final BaseRepository repository;

  HomeController({required this.repository});

  late CustomPaginationController<ProductResource> paginationController = CustomPaginationController<ProductResource>(
      onFetchPage: (pageKey, filterText, searchText) async => await getOrderListService(pageKey, filterText, searchText));

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  var selectedTab = 0.obs;

  var selectFilter = ''.obs;
  var productResource = List<ProductResource>.empty(growable: true).obs;
  @override
  void onInit() {
    paginationController.initialize();
    super.onInit();
  }

  @override
  void dispose() {
    paginationController.dispose();
    super.dispose();
  }

  /* ***
   * call data from repo
   * **/
  Future<List<ProductResource>> getOrderListService(int pageKey, String? filter, String? search) async {
    productResource.value = await callDataService(repository.getProductList(selectFilter.value));
    return productResource;
  }

  Future<void> onRefresh() async {
    paginationController.refresh(filter: '', search: '');
  }

  void updateUser() async {
    Map<String, dynamic> data = {"name": fullNameController.text, "email": emailController.text};
    await callDataService(repository.updateUser(repository.currentUserId, data), onSuccess: (v) {
      AppToasts.defaultBanner(msg: "Update Successfully");
    });
  }

  void onApplyFilter() async {
    Get.back();
    await onRefresh();
  }
}
