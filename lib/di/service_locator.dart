
import 'package:dio/dio.dart';
import 'package:ecom_print_store/data/network/apis/auth/auth_api.dart' show AuthApi;
import 'package:ecom_print_store/data/network/apis/posts/post_api.dart';
import 'package:ecom_print_store/data/network/dio_client.dart';
import 'package:ecom_print_store/data/network/repository/auth_repository.dart';
import 'package:ecom_print_store/data/network/repository/post_repository.dart';
import 'package:ecom_print_store/data/sharedpref/shared_preference_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setupLocator() async {
  final _prefs = await SharedPreferences.getInstance();
  // singletons:----------------------------------------------------------------
  Get.put(DioClient(Dio()));
  Get.put(SharedPreferenceHelper(_prefs));

  // api's:---------------------------------------------------------------------
  Get.put(PostApi(Get.find<DioClient>()));
  Get.put(AuthApi(Get.find<DioClient>()));

  // repository:----------------------------------------------------------------
  Get.put(
    PostRepository(postApi: Get.find<PostApi>()),
  );
  Get.put(
    AuthRepository(authApi: Get.find<AuthApi>()),
  );
}
