import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/widgets/search_page.dart';
import '../controllers/food_controller.dart';
import '../details/list_page.dart';
import '../models/Food_models.dart';
import '../routes/rout_helper.dart';
import 'food_menu_widget.dart';

class HomeContent extends StatefulWidget {
  HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: const Text(
                  'SEARCH FOR \nRECIPES',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/40.15),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.searchPage);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: double.maxFinite,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined
                      ),
                      SizedBox(width: 20,),
                      Text("Search Foods", style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 100, 100, 100)
                      ),)
                    ],
                  ),
                  // child: TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.grey[300],
                  //     hintText: 'Search',
                  //     prefixIcon: const Icon(Icons.search, color: Colors.black54,),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/35.15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Recommended',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/40.15),
              Container(
                child: GetBuilder<FoodController>(builder: (allFoods){
                return allFoods.isLoaded?Container(
                  // padding: EdgeInsets.only(right: 20),
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
                          Get.toNamed(RouteHelper.getDetailPage(foodModel.id??0));
                        },
                        child: FoodMenuWidget(itemColor: itemColor,foodModel: foodModel,),
                      );
                    },
                  ),
                ),
              ):Container(
                height: MediaQuery.of(context).size.height/3.824,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CupertinoActivityIndicator(color: Colors.blue,radius: 20,)],
                ),
              );
              // CircularProgressIndicator(
              //   color: Colors.blue. withOpacity(0.5),
              
              }),

              ),
               SizedBox(height: MediaQuery.of(context).size.height/26.766667),
              Container(
                // height: MediaQuery.of(context).size.height,
                child: ListPage())
        ],
      );
  
  }
}