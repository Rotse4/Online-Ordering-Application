import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/utils/app_constants.dart';

import '../models/Food_models.dart';

// import 'details/details_page.dart';


class ListPage extends StatefulWidget {
  ListPage({super.key});


  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> _categories = [
    'FEATURED',
    'COMBOS',
    'FAVORITES',
    'RECOMMENDED',
  ];
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  final ScrollController _listViewController = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1850,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              //color: Colors.cyan,
              height: MediaQuery.of(context).size.height/40.15,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          //color: Colors.amberAccent,
                          margin: const EdgeInsets.only(left: 20, right: 10),
                             child: Text(
                                _categories[index],
                                style: TextStyle(
                                  fontSize: _selectedIndex == index ? 15 : 12,
                                  fontWeight:
                                  _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                                ),
                              )
                        ),
                      ],
                    ),
                  );
                },
                controller: _listViewController,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/144.7143),
            Expanded(
              // height: 700,
              child: PageView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height/10.0375,
                    //color: Colors.blueGrey,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 700,
                      child: GetBuilder<FoodController>(builder: (allFoods){
                        return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: allFoods.foodList.length,
                      itemBuilder: (context, index){
                        FoodModel foodModel =allFoods.foodList[index];
                        return GestureDetector(
                          onTap: (){
                                  Get.toNamed(RouteHelper.getDetailPage(foodModel.id??0));
                                },
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height/10.0375,
                                width: MediaQuery.of(context).size.width/4.909090,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    image:  DecorationImage(
                                        image: NetworkImage(
                                          AppConstants.BASE_URL+(foodModel.image??"")
                                          ),
                                        fit: BoxFit.cover
                                    )
                                ),
                                //color: Colors.yellow,
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                margin: const EdgeInsets.only(left: 0),
                                height: MediaQuery.of(context).size.height/10.0375,
                                width: MediaQuery.of(context).size.width/2.53372,
                                //color: Colors.blue,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text("${foodModel.title!}"),
                                            Wrap(
                                              children:
                                              List.generate(5, (index) => const Icon(Icons.star, color: Colors.yellow,size: 10,)),
                                            ),
                                    const Text("\$25   ""\$18"),
                                  ],
                                ),
                              ),
                               SizedBox(width: MediaQuery.of(context).size.width/8.727272,),
                              Container(
                                height: MediaQuery.of(context).size.height/16.7291667,
                                width: MediaQuery.of(context).size.width/8.181818,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.orange,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: const Icon(Icons.add, color: Colors.white,),
                              ),
                            ],
                          ),
                          ),
                        );
                      });
                      },)
                    )
                  );
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
              ),
            ),
          ],
        ),
    );
  }
}

