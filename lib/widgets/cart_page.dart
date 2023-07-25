import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/widgets/checkout_page.dart';

import '../controllers/food_controller.dart';
import '../utils/app_constants.dart';
import '../utils/counter.dart';

class CartPage extends StatelessWidget {
  FoodController foodController = Get.find();
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 235, 218),
      body: Obx(() {
        var adedItems = foodController.cart;
        // adedItems.foodListModel.firstWhere
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 8),
              color: Colors.orange[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 20.075,
                        width: MediaQuery.of(context).size.width / 9.818181,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 20.075,
                        width: MediaQuery.of(context).size.width / 9.818181,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.0117,
                        width: MediaQuery.of(context).size.width*0.02544,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text("${adedItems.foodListModel.length}",
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: adedItems.foodListModel.length,
                    itemBuilder: (context, index) {
                      CartItem cartItem = adedItems.foodListModel[index];
                      print("sHeight is ${MediaQuery.of(context).size.height}");
                      print("sHeight is ${MediaQuery.of(context).size.width}");
                      return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          // padding: EdgeInsets.only(right: 10),
                          height: MediaQuery.of(context).size.height*0.1175,
                          width: MediaQuery.of(context).size.width*0.14249,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(153, 199, 191, 191),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.height*0.1175,
                                  width: MediaQuery.of(context).size.width*0.25445,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                (cartItem.foodModel.image ?? ""),
                                          ),
                                          fit: BoxFit.cover))),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 15, right: 6),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${cartItem.foodModel.title}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "${cartItem.foodModel.description},",
                                        style: TextStyle(
                                            color: Colors.black,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "Ksh ${cartItem.foodModel.price}",
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                // color: Colors.red,
                                // width: 120,
                                child: Count(
                                  foodModel: cartItem,
                                  productEvent: (foodModel, itemEvent) {
                                    switch (itemEvent) {
                                      case ItemEvent.INCREMENT:
                                        {
                                          foodController.cart.addItem(foodModel);
                                        }
                                        break;
                                      case ItemEvent.DECREMENT:
                                        {
                                          foodController.cart
                                              .reduceQuantity(foodModel);
                                        }
                                        break;
            
                                      default:
                                    }
            
                                    print(
                                        "this food ${foodModel.title} as being ${itemEvent.name} by 1");
                                  },
                                ),
                                // width: 100,
                              )
                            ],
                          ));
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 226, 185),
              borderRadius: BorderRadius.circular(20)),
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Order details",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.1175,
                padding: EdgeInsets.symmetric(horizontal: 20),
                // margin: EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                    itemCount: adedItems.foodListModel.length,
                    itemBuilder: (context, index) {

                      var caritem=adedItems.foodListModel[index];
                      return Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${caritem.foodModel.title} x ${caritem.quantity}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ksh ${caritem.subTatal}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ));
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.4580,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Tatal: Ksh ${adedItems.bill}",
                          style:
                              TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to( CheckOutPage());
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width*0.3053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Center(child: Text("Place Order",
                        style:
                                TextStyle(fontSize: 16, color: Colors.white),)),
                      ),
                    ),
                  ],
                ),
              )
            ],
              ),
            )
          ],
        );
      }),
    );
  }
}
