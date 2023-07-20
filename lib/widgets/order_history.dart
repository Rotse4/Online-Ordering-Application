import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/models/orders_model.dart';

import '../controllers/order_controller.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  // FoodController foodController= Get.find<FoodController>();
  OrderController orderController = Get.find<OrderController>();
  final PageController _pageController = PageController();
  final List<String> _categories = [
    'OPEN ORDERS',
    'CLOSED ORDERS',
  ];
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
    orderController.getUserOrders();
  }

  void _onPageChanged() {
    setState(() {
      _selectedIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 235, 218),
      body: Column(
        children: [
          Container(
            // color: Color.fromARGB(255, 238, 170, 67),
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            padding: EdgeInsets.only(top: 50, bottom: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                Text(
                  "Orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.shopping_cart)
              ],
            ),
          ),
          Container(
            height: 50,
            // padding: EdgeInsets.symmetric(horizontal: 20),
            // color: Color.fromARGB(255, 204, 183, 152),

            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromARGB(255, 226, 200, 161))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: _categories.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
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
                      child: Container(
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                          category,
                          style: TextStyle(
                              fontSize: _selectedIndex == index ? 15 : 12,
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: Colors.orange),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Container(
            height: 710,
            // color: Colors.orange,
            child: PageView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                    // margin: EdgeInsets.symmetric(vertical: 20),
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    // height: 200,
                    // color: Colors.white,
                    child: Container(
                  height: 708,
                  child: GetBuilder<OrderController>(builder: (allOrders) {
                    return ListView.builder(
                        itemCount: allOrders.orderList.length,
                        itemBuilder: (context, index) {
                          OrderModel orderModel = allOrders.orderList[index];

                          return Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: 100,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue,
                                  ),
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/hamburg.jpg"),
                                    fit: BoxFit.cover,
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
                                          "Mukimo dd fnfnfnf fmfkfkkd f4fffffrr",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        Text("Mukimo"),
                                        Text("status ${orderModel.confirmed}"),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }),
                ));
              },
              controller: _pageController,
            ),
          )
        ],
      ),
    );
  }
}
