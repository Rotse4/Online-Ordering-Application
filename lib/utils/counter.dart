import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/models/Food_models.dart';

enum ItemEvent { INCREMENT, DECREMENT }

typedef ProductEvent = Function(FoodModel foodModel, ItemEvent itemEvent);
FoodController foodController = Get.find();

class Count extends StatelessWidget {
  var add = foodController.cart;
  int count = 0;
  Count({super.key, this.productEvent, required this.foodModel});
  ProductEvent? productEvent;
  late CartItem foodModel;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return  foodModel.quantity>0?  Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<FoodController>(builder: (food) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                if (productEvent != null) {
                                  productEvent!(
                                      foodModel.foodModel, ItemEvent.DECREMENT);
                                  // food.setQuantity(false);
                                  // foodModel.decementByOne();
                                  print(foodController.cart.bill);
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.orange,
                                size: 20,
                              )),
                          Obx(() {
                            return Text("${foodModel.quantity}");
                          }),
                          InkWell(
                              onTap: () {
                                if (productEvent != null) {
                                  productEvent!(
                                      foodModel.foodModel, ItemEvent.INCREMENT);
                                  // foodModel.incrementByOne();
                                  print(foodController.cart.bill);
                                  // add.addItem(foodModel);
                                }
                              },
                              child:
                                  Icon(Icons.add, color: Colors.orange, size: 20)),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ):SizedBox();
      }
    );
  }
}
