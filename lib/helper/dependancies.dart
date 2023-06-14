import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/data/api/api_client.dart';
import 'package:online_order_app/data/api/repository/food_repo.dart';
import 'package:online_order_app/utils/app_constants.dart';

Future<void> init()async {
  //api cliend
  Get.put(ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => FoodRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => FoodController(foodRepo: Get.find()));
}