import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/food_controller.dart';
import 'radio_button.dart';

// ignore: must_be_immutable
class CheckOutPage extends StatelessWidget {
  CheckOutPage({super.key});
  FoodController foodController = Get.find();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var adedItems = foodController.cart;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 60, left: 15, right: 15),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 149, 183, 211),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
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
                        height: 180,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // margin: EdgeInsets.only(bottom: 10),
                        child: Scrollbar(
                          thumbVisibility: true,
                          controller: controller,
                          child: ListView.builder(
                            controller: controller,
                              itemCount: adedItems.foodListModel.length,
                              itemBuilder: (context, index) {
                                var caritem = adedItems.foodListModel[index];
                                return Container(
                                    padding: EdgeInsets.only(bottom: 5, right: 10),
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
                                              fontWeight: FontWeight.normal),
                                        )
                                      ],
                                    ));
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 0,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Total: Ksh ${adedItems.bill}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              RadioSelect(),
               Container(
                // height: 200,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20, ),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment  Method", style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                         Text("Enter your mobile number(Saf)"),
                         TextField(
                          decoration: InputDecoration(
                            hintText: "07XXXXXXXX"
                          ),
                          
                         )
                         
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Tatal: Ksh ${adedItems.bill}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: Center(
                          child: Text(
                        "Place Order",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
