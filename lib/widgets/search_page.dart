import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/models/Food_models.dart';
import 'package:online_order_app/utils/app_constants.dart';

import '../controllers/search_controller.dart';
import '../routes/rout_helper.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var schingController = TextEditingController();
  var serchingController = Get.find<SerchController>();
  // Future <List<FoodModel>> _search() async{
  //   String searchKey = schingController.text.trim();
  //   var serchKey = await serchingController.searchFoods(searchKey);
  //   return serchKey;
  // }

  @override
  initState() {
    super.initState();
    schingController.addListener(() async {
      String searchKey = schingController.text.trim();
      var serchKey = await serchingController.searchFoods(searchKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 235, 218),
      body: Container(
        margin: EdgeInsets.only(
          top: 40,
        ),
        // height: 700,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Icon(Icons.arrow_back))),
                  Container(
                      width: 320,
                      height: 45,
                      padding: EdgeInsets.only(right: 10,),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: schingController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                            hintText: "Search for foods",
                            border: InputBorder.none),
                      ))
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<SerchController>(
                  init: Get.find<SerchController>(),
                  builder: (food) {
                    return ListView.builder(
                        // reverse: true,
                        itemCount: food.foodl.length,
                        itemBuilder: (context, index) {
                          // OrderModel orderModel = allOrders.orderList[index];
                          FoodModel fooditems = food.foodl[index];
                          return Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: MediaQuery.of(context).size.height * 0.1175,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                                  RouteHelper.getDetailPage(
                                                      fooditems.id ?? 0));
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.11751,
                                    width: MediaQuery.of(context).size.width *
                                        0.25445,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue,
                                    ),
                                    child: Image(
                                      image: NetworkImage(AppConstants.BASE_URL +
                                          (fooditems.image!)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    // color: const Color.fromARGB(255, 185, 153, 101),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${fooditems.description}",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        Text("${fooditems.title}", style: TextStyle(
                                              fontWeight: FontWeight.bold),),
                                        Text("Price: Ksh${fooditems.price}"),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
