import 'package:get/get.dart';
import 'package:online_order_app/data/api/api_client.dart';
import 'package:online_order_app/utils/app_constants.dart';

class FoodRepo extends GetxService{
  final ApiClient apiClient;
  FoodRepo({required this.apiClient});

  Future<Response?> getFoodList() async{
     
    var data= await apiClient.getData(AppConstants.fOOD_URI);
    return data;
  }
}