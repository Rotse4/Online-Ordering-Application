import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/routes/rout_helper.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: [
          Container(
            // color: Colors.orange,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  
                  child: Icon(Icons.arrow_back)),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.homeScreen),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.home_rounded)),
                )
                ],
                
            )
          ),
          SizedBox(height: 160,),
          Image.asset("assets/images/empty_cart.png"),
          Text("Your cart is empty!", style: TextStyle(
            color: Colors.grey
          ),)
        ],
      ),
    );
  }
}