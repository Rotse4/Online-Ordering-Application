import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/widgets/cart_page.dart';

import '../utils/app_constants.dart';
import '../utils/counter.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  int pageId;
  DetailPage({Key? key, required this.pageId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FoodController foodController = Get.find();
  @override
  Widget build(BuildContext context) {
    var foodModel = foodController.getFoodById(widget.pageId);
    Cart cart = foodController.cart;

    // var product = Get.find<FoodController>().foodList[pageId];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 235, 218),
      body: SizedBox(
        //color: Colors.blue,
        //margin: EdgeInsets.only(left: 30, right: 30, top: 40),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 30, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20.075,
                      width: MediaQuery.of(context).size.width / 9.818181,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 245, 233, 214),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(CartPage());
                      Get.toNamed(RouteHelper.cartPage);

                    },
                    child: Stack(
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
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Obx(() {
                            return Text(
                                "${foodController.cart.foodListModel.length}",
                                style: TextStyle(
                                    fontSize: 8, color: Colors.white));
                          })),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40.15,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${foodModel.title ?? ""}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40.15,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              //color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height / 5.735714,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.cyan,
                        image: DecorationImage(
                          image: NetworkImage(
                              AppConstants.BASE_URL + (foodModel.image ?? "")),
                          fit: BoxFit.cover,
                        )),
                    /*child: Image.asset(
                      'assets/images/hamburg.jpg',
                      fit: BoxFit.cover,
                        ),*/
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: MediaQuery.of(context).size.height / 5.01875,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 20.075,
                          width: MediaQuery.of(context).size.width / 9.8181818,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.favorite_outline,
                            color: Colors.orange,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 20.075,
                          width: MediaQuery.of(context).size.width / 9.8181818,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.directions_outlined,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                
              ),
              margin: EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height / 16.06,
              //color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ksh ${foodModel.price ?? ""}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Obx(() {
                    return Row(
                      children: [
                        Count(
                          foodModel: cart.getCartItem(foodModel) ??
                              CartItem(foodModel: foodModel, quantity: 0.obs),
                          productEvent: (foodModel, itemEvent) {
                            switch (itemEvent) {
                              case ItemEvent.INCREMENT:
                                {
                                  cart.addItem(foodModel);
                                }
                                break;
                              case ItemEvent.DECREMENT:
                                {
                                  cart.reduceQuantity(foodModel);
                                }
                                break;

                              default:
                            }

                            print(
                                "this food ${foodModel.title} as being ${itemEvent.name} by 1");
                          },
                        ),
                        cart.isInCart(foodModel)
                            ? GestureDetector(
                                onTap: () {
                                  cart.deleteItem(foodModel);
                                },
                                child: Container(
                                    height: 60,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    margin: EdgeInsets.only(right: 25, left: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )
                                        // Text(
                                        //   "Remove from cart",
                                        //   style: TextStyle(
                                        //       color: Colors.white,
                                        //       fontWeight: FontWeight.w800),
                                        // ),
                                        )),
                              )
                            : GestureDetector(
                                onTap: () {
                                  cart.addItem(foodModel);
                                },
                                child: Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                        margin: EdgeInsets.only(right: 20),
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // margin: EdgeInsets.only(right: 15, ),
                                    child: Center(
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )),
                              )
                      ],
                    );
                  })
                ],
              ),
            ),
           Expanded(
            child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text("${foodModel.description}"),
            ),
           )),
           SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}
