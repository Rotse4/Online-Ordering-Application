import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/widgets/drawer.dart';
import 'package:online_order_app/widgets/food_menu_widget.dart';
import 'package:online_order_app/widgets/home_content.dart';
import 'package:online_order_app/widgets/user_dialog.dart';

import '../details/list_page.dart';
import '../models/Food_models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FoodController foodController = Get.find();
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
            height: MediaQuery.of(context).size.height / 20.075,
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.orange,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.cartPage);
                    // Get.to(()=>DialogExample());
                  },
                  child: Obx(() {
                    return Container(
                        height: MediaQuery.of(context).size.height / 22.3,
                        width: MediaQuery.of(context).size.width / 11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.orange,
                        ),
                        child: Stack(alignment: Alignment.topRight, children: [
                          Container(
                            child: Center(
                                child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            )),
                          ),
                          foodController.cart.foodListModel.isNotEmpty
                              ? Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "${foodController.cart.foodListModel.length}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                    ),
                                  ),
                                )
                              : Container()
                        ]));
                  }),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: const Text(
                    'SEARCH FOR \nRECIPES',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40.15),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.searchPage);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.0634,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.search_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Search Foods",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 100, 100, 100)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35.15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Recommended',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40.15),
                Container(
                  child: GetBuilder<FoodController>(builder: (allFoods) {
                    return allFoods.isLoaded
                        ? Container(
                            // padding: EdgeInsets.only(right: 20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 3.824,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: allFoods.foodList.length,
                                itemBuilder: (context, index) {
                                  FoodModel foodModel = allFoods.foodList[index];
                                  Color itemColor = index % 2 == 0
                                      ? Colors.orange.withOpacity(0.4)
                                      : Colors.blue.withOpacity(0.5);
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.getDetailPage(
                                          foodModel.id ?? 0));
                                    },
                                    child: FoodMenuWidget(
                                      itemColor: itemColor,
                                      foodModel: foodModel,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height / 3.824,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CupertinoActivityIndicator(
                                  color: Colors.blue,
                                  radius: 20,
                                )
                              ],
                            ),
                          );
                  }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 26.766667),
                Container(
                    // height: MediaQuery.of(context).size.height,
                    child: ListPage())
                          ],
                        ),
              ))
        ],
      ),
    );
  }
}
