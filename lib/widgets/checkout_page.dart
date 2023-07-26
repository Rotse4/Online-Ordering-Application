import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/food_controller.dart';
import 'radio_button.dart';

// ignore: must_be_immutable
class CheckOutPage extends StatefulWidget {

  CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var phoneNumberController = TextEditingController();

  FoodController foodController = Get.find();

  ScrollController controller = ScrollController();


@override
  void initState() {
    // TODO: implement initState
        super.initState();
    phoneNumberController.addListener(() {
      String phoneNumber =phoneNumberController.text.trim();
      foodController.payment_number(phoneNumber);
      
    });
    
    
  }

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
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                padding: EdgeInsets.only(right: 20),
                
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
                              child:  Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.black,
                              ),
                            ),
                    ),
                          Text("Checkout", style: 
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
                          ,)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                height: MediaQuery.of(context).size.height*0.25,
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
                      Expanded(
                        child: Container(
                          // height: 140,
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
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.005875,
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 0,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 20, top: 5, bottom: 5),
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
                        SizedBox(height: MediaQuery.of(context).size.height*0.011751,),
                         Text("Enter your mobile number(Saf)"),
                         TextField(
                          controller: phoneNumberController,
                          
                          decoration: InputDecoration(
                            
                            hintText: "7XXXXXXXX",
                            prefix: Text("+254 ")
                          ),
                          
                         )
                         
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                height: MediaQuery.of(context).size.height*0.05875,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.458,
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
                    Obx(
                       () {
                        return GestureDetector(
                          onTap: () {
                            foodController.orderNow();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.06462,
                            width: MediaQuery.of(context).size.width*0.25445,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: foodController.isprocessing.value ? Colors.orange[200] : Colors.orange,
                            ),
                            child: Center(
                                child: Text(
                              "Pay Now",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            )),
                          ),
                        );
                      }
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
