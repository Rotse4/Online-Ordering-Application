import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/widgets/drawer.dart';
import 'package:online_order_app/widgets/home_content.dart';
import 'package:online_order_app/widgets/user_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FoodController foodController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 235, 218),
      key: _scaffoldKey,
      drawer: Draawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
              height: MediaQuery.of(context).size.height/20.075,

              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(backgroundColor: Colors.orange,
                  backgroundImage: AssetImage("assets/images/avatar.png"),),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.cartPage);
                      // Get.to(()=>DialogExample());
                    },
                    child: Obx(
                       () {
                        return Container(
                        height: MediaQuery.of(context).size.height/22.3,
                        width: MediaQuery.of(context).size.width/11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.orange,
                        ),

                        child: Stack(
                          alignment: Alignment.topRight,
                          children:[ Container(
                            child: Center(child: Icon(Icons.shopping_cart, color: Colors.white,)),
                          ),
                          foodController.cart.foodListModel.isNotEmpty? Container(
                            
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(
                              child: Text(
                                "${foodController.cart.foodListModel.length}", 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8
                                ),
                              ),
                            ),
                          ):Container()
                          ]
                        )
                  );
                      }
                    ),
                  ),                 
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: HomeContent(),
            ))
        ],
      ),
    );
  }
}