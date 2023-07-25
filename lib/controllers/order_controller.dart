import 'package:get/get.dart';

import '../data/api/repository/order_repo.dart';
import '../models/orders_model.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;
  
  var isprocessing=RxBool(false);
  OrderController({required this.orderRepo});
  List<OrderModel> _orderList =[];
  List<OrderModel> get orderList => _orderList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;




    Future<void> getUserOrders() async {
    Response? response = await orderRepo.getUserOrders();
    print("this is the esponse ${response?.bodyString}");
    if (response?.statusCode == 200) {
      print(" YOUR user orders $_orderList");
      // FoodModel.fromJson(response.body);
      _orderList = [];
      _orderList.addAll(Order.fromJson(response?.body).orders);
      print( _orderList);
      _isLoaded = true;
      update();
    } else {
      print("user orders not found");
    }
  }
  

  //     Future<void> getCategory() async {
  //   Response? response = await orderRepo.getUserOrders();
  //   print("this is the esponse ${response?.bodyString}");
  //   if (response?.statusCode == 200) {
  //     // print(" YOUR user orders $_orderList");
  //     // FoodModel.fromJson(response.body);
  //     _featuredList = [];
  //     _featuredList.addAll(Order.fromJson(response?.body).orders);
  //     // print( _orderList);
  //     _isLoaded = true;
  //     update();
  //   } else {
  //     print("user orders not found");
  //   }
  // }
}
