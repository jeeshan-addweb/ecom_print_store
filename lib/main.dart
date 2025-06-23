import 'dart:async';

import 'package:ecom_print_store/constants/app_theme.dart';
import 'package:ecom_print_store/di/service_locator.dart';
import 'package:ecom_print_store/ui/home/feature_products_controller.dart';
import 'package:ecom_print_store/ui/home/most_loved_products_controller.dart';
import 'package:ecom_print_store/ui/home/product_details_controller.dart';
import 'package:ecom_print_store/ui/product/controller/fetch_related_products_controller.dart';
import 'package:ecom_print_store/ui/product/controller/you_may_like_controller.dart';
import 'package:ecom_print_store/utils/graphqlConfig/graphql_config.dart';
import 'package:ecom_print_store/utils/routes/pages.dart';
import 'package:ecom_print_store/utils/routes/routes.dart';
import 'package:ecom_print_store/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();


  runZonedGuarded(() {
    service.SystemChrome.setPreferredOrientations(
        [service.DeviceOrientation.portraitUp]).then((_) {
      Get.put<GraphQLClient>(GraphQLConfig.initializeClient());
      Get.put(MostLovedProductsController());
      Get.put(FeatureProductsController());
      Get.put(ProductDetailsController());
      Get.put(FetchRelatedProductsController());
      Get.put(YouMayLikeController());
      runApp(const MyApp());
    });
  }, (error, stackTrace) {
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: 'Getx Boilerplate',
      initialRoute: Routes.login,

      theme: themeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      translationsKeys: AppTranslation.translations,
  );}
  }