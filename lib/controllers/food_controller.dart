import 'dart:io';

import 'package:get/get.dart';
import 'package:online_order_app/models/Food_models.dart';

import '../data/api/repository/food_repo.dart';

class FoodController extends GetxController{
  final FoodRepo foodRepo;
  FoodController({required this.foodRepo});
  List<FoodModel> _foodList=[];
  List<FoodModel> get foodList => _foodList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getFoodList()async{
    
    Response? response = await foodRepo.getFoodList();
    if(response?.statusCode==200){
      // FoodModel.fromJson(response.body);
      _foodList=[];
      _foodList.addAll(Food.fromJson(response?.body).foods);
      print(_foodList);
      _isLoaded = true;
      update();
    }else{

    }
  }
  FoodModel getFoodById(int id){
    return foodList.firstWhere((element) => element.id==id);

  }
}