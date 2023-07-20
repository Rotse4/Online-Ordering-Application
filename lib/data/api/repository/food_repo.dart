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

  Future<Response> orderNow(Map<String, Object> order) async {
        var data= await apiClient.postData(AppConstants.Order_URL,order);
  //  print(data.bodyString);
   return data;
  }

  Future <Response?> getUserOrders() async {
    var ndata = await apiClient.getData(AppConstants.USER_ORDERS);
    return ndata;
  }
}