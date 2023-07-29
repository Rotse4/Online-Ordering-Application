import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/utils/app_constants.dart';
import 'package:online_order_app/utils/counter.dart';

import '../controllers/search_controller.dart';
import '../models/Food_models.dart';

// import 'details/details_page.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> _categories = [
    'FAVORITES',
    'FEATURED',
    // 'COMBOS',
    // 'POPULAR',
    'RECOMMENDED',
  ];
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  var serchingController = Get.find<SerchController>();
  final ScrollController _listViewController = ScrollController();
  FoodController foodController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodController.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height ,
      height: 900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            //color: Colors.cyan,
            height: MediaQuery.of(context).size.height / 40.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          //color: Colors.amberAccent,
                          margin: const EdgeInsets.only(left: 40, right: 10),
                          child: Text(
                            _categories[index],
                            style: TextStyle(
                              fontSize: _selectedIndex == index ? 15 : 12,
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          )),
                    ],
                  ),
                );
              },
              controller: _listViewController,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 144.7143),
          Expanded(
            // height: double.maxFinite,
            child: GetBuilder<FoodController>(
                init: foodController,
                builder: (ctr) {
                  return PageView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      List<FoodModel> foodModels = [];
                      // foodModels.addAll(foodController.popular)
                      print("foodm $foodModels");
                      foodModels.clear();
                      switch (index) {
                        case 0:
                          foodModels.addAll(ctr.popular);
                          break;
                        case 1:
                          foodModels.addAll(ctr.featured);

                          break;
                        case 2:
                          foodModels.addAll(ctr.recommended);
                          break;

                        default:
                          foodModels.addAll(foodController.popular);
                      }
                      return Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05089,
                            right: MediaQuery.of(context).size.width * 0.05089,
                          ),
                          child: GetBuilder<FoodController>(
                            builder: (allFoods) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  // reverse: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: foodModels.length,
                                  itemBuilder: (context, index) {
                                    FoodModel foodModel = foodModels[index];
                                    // bool isIcart=foodController.cart.isInCart(foodModel);
                                    return Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          0.25445,
                                      margin: EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  RouteHelper.getDetailPage(
                                                      foodModel.id ?? 0));
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      10.0375,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4.909090,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              AppConstants
                                                                      .BASE_URL +
                                                                  (foodModel
                                                                          .image ??
                                                                      "")),
                                                          fit: BoxFit.cover)),
                                                  //color: Colors.yellow,
                                                ),
                                                //  SizedBox(
                                                //   width: MediaQuery.of(context).size.width *0.05089
                                                // ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      10.0375,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.34351,
                                                  //color: Colors.blue,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(foodModel.title!),
                                                      Wrap(
                                                        children: List.generate(
                                                            5,
                                                            (index) =>
                                                                const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .orange,
                                                                  size: 15,
                                                                )),
                                                      ),
                                                      const Text(
                                                          "\$25   " "\$18"),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   width:
                                                //       MediaQuery.of(context).size.width /
                                                //           8.727272,
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Obx(() {
                                            return foodController.cart
                                                    .innCart(foodModel)
                                                ? Count(
                                                    foodModel: foodController
                                                            .cart
                                                            .getCartItem(
                                                                foodModel) ??
                                                        CartItem(
                                                            foodModel:
                                                                foodModel,
                                                            quantity: 0.obs),
                                                    productEvent:
                                                        (foodModel, itemEvent) {
                                                      switch (itemEvent) {
                                                        case ItemEvent
                                                              .INCREMENT:
                                                          {
                                                            foodController.cart
                                                                .addItem(
                                                                    foodModel);
                                                          }
                                                          break;
                                                        case ItemEvent
                                                              .DECREMENT:
                                                          {
                                                            foodController.cart
                                                                .reduceQuantity(
                                                                    foodModel);
                                                          }
                                                          break;

                                                        default:
                                                      }

                                                      print(
                                                          "this food ${foodModel.title} as being ${itemEvent.name} by 1");
                                                    },
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      foodController.cart
                                                          .addItem(foodModel);
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              16.7291667,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8.181818,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        color: Colors.orange,
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          left: 60),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  );
                                          }),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ));
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                        _listViewController.animateTo(
                          index * (60.0),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    },
                    controller: _pageController,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
