import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/widgets/order_history.dart';

import '../controllers/order_controller.dart';
import '../routes/rout_helper.dart';

// ignore: must_be_immutable
class Draawer extends StatelessWidget {
  Draawer({super.key});
  OrderController orderController =Get.find<OrderController>();

  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: Container(
        padding: EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange,
                        backgroundImage: AssetImage("assets/images/avatar.png"),),
                        Text("    Online foods", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50,left: 15 ),
              child: Text("Cart history"),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.orderHistory);
              },
              child: Container(
                margin: EdgeInsets.only(left: 25, top: 10, right: 20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.shopping_bag),
                    Text("Active", style: TextStyle(
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(width: 20,),
                    Container(
                      height: 15,
                      width: 20,
                      
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text("4",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(OrderHistory());
              },
              child: Container(
                margin: EdgeInsets.only(left: 25, top: 10, right: 20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.shopping_basket),
                    Text("Delivered", style: TextStyle(
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(width: 20,),
                    Container(
                      height: 15,
                      width: 20,
                      
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text("10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
