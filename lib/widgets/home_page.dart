import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/models/Food_models.dart';

import '../details/details_page.dart';
import '../featured.dart';
import 'food_menu_widget.dart';

class HomePage extends StatelessWidget {
  final List<String> recommendedItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Set this property to false
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/20.075,

              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  const SizedBox(width: 20),
                  Container(
                    height: MediaQuery.of(context).size.height/22.3,
                    width: MediaQuery.of(context).size.width/11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.orange.withOpacity(0.6),
                    ),

                    child: const Icon(Icons.person, color: Colors.blue,),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40.15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'SEARCH FOR \nRECIPES',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40.15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.black54,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40.15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Recommended',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40.15),
            GetBuilder<FoodController>(builder: (allFoods){
              return Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/3.824,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allFoods.foodList.length,
                  itemBuilder: (context, index) {
                    FoodModel foodModel=allFoods.foodList[index];
                    Color itemColor = index % 2 == 0 ? Colors.orange.withOpacity(0.4) : Colors.blue.withOpacity(0.5);
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DetailPage()),
                        );
                      },
                      child: FoodMenuWidget(itemColor: itemColor,foodModel: foodModel,),
                    );
                  },
                ),
              ),
            );
            }),
            SizedBox(height: MediaQuery.of(context).size.height/26.766667),
            SizedBox(
              //color: Colors.cyan,
              height: MediaQuery.of(context).size.height/3.0648,
              child: const FeaturedPage(),
            )
          ],
        ),
      ),
    );
  }
}

