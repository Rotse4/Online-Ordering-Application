import 'package:get/get.dart';
import 'package:online_order_app/controllers/auth_contloller.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/data/api/repository/order_repo.dart';
import 'package:online_order_app/controllers/order_controller.dart';
import 'package:online_order_app/data/api/api_client.dart';
import 'package:online_order_app/data/api/repository/food_repo.dart';
import 'package:online_order_app/utils/app_constants.dart';

Future<void> init()async {
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  //api cliend
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  //repos
  Get.lazyPut(() => FoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => FoodController(foodRepo: Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => AuthController());
}