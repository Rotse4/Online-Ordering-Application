import 'package:get/get.dart';
import 'package:online_order_app/data/api/api_client.dart';
import 'package:online_order_app/utils/app_constants.dart';

class SearchRepo extends GetxService{
  final ApiClient apiClient;
  SearchRepo({required this.apiClient});

  Future <Response?> searchFoods(String key) async {
    return await apiClient.getData(AppConstants.SEARCH,query: {"q":key});
  }
}