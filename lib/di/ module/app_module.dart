import 'package:bs_assignment/bindings/initial_binding.dart';
import 'package:bs_assignment/core/theme/app_themes.dart';
import 'package:bs_assignment/datasource/local_data_source/base_local_source.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@module
abstract class App {
  @lazySingleton
  GetMaterialApp provideGetMaterialApp(BaseLocalDataSource baseLocalDataSource) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: AppRoutes.INITINAL,
      theme: AppTheme.primaryTheme(),
      darkTheme: AppTheme.darkModeTheme(),
      defaultTransition: Transition.fade,
      getPages: AppRoutes.routes,
      locale: Get.deviceLocale, //Get.deviceLocale, //AppTranslation.localeMapper["nl_NL"], // //localeMapper["en_US"],
    );
  }
}
