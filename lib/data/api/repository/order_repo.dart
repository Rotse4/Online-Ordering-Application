import 'package:get/get.dart';
import 'package:online_order_app/data/api/api_client.dart';
import 'package:online_order_app/utils/app_constants.dart';

class OrderRepo extends GetxService{
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future <Response?> getUserOrders() async {
    var ndata = await apiClient.getData(AppConstants.USER_ORDERS);
    return ndata;
  }
}