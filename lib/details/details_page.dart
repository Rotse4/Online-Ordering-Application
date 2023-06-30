import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';

import '../utils/app_constants.dart';
import '../utils/counter.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  int pageId;
  DetailPage({Key? key, required this.pageId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FoodController foodController=Get.find();
  @override
  Widget build(BuildContext context) {
    var foodModel=foodController.getFoodById(widget.pageId);
    // var product = Get.find<FoodController>().foodList[pageId];
    return Scaffold(
      body: SizedBox(
        //color: Colors.blue,
        //margin: EdgeInsets.only(left: 30, right: 30, top: 40),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30,right: 30, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  Container(
                    height: MediaQuery.of(context).size.height/20.075,
                    width: MediaQuery.of(context).size.width/9.818181,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),
                    child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40.15,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Text("${foodModel?.title??""}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40.15,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30,),
              height: MediaQuery.of(context).size.height/3.491304,
              width: double.infinity,
              //color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height/5.735714,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.cyan,
                      image:  DecorationImage(
                        image: NetworkImage(
                          AppConstants.BASE_URL+(foodModel.image??"")
                        ),
                        fit: BoxFit.cover,
                      )
                    ),
                    /*child: Image.asset(
                      'assets/images/hamburg.jpg',
                      fit: BoxFit.cover,
                        ),*/
                    width: MediaQuery.of(context).size.width*0.45,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: MediaQuery.of(context).size.height/5.01875,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/20.075,
                          width: MediaQuery.of(context).size.width/9.8181818,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.favorite_outline, color: Colors.orange,),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/20.075,
                          width: MediaQuery.of(context).size.width/9.8181818,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.directions_outlined, color: Colors.orange,),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30,),
              height: MediaQuery.of(context).size.height/16.06,
              //color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("Ksh ${foodModel.price??""}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                  Count(foodModel: foodModel,productEvent: (foodModel, itemEvent) {
                    print("this food ${foodModel.title} as being ${itemEvent.name} by 1");
                  },)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height/10.0375,
                    //color: Colors.blueGrey,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/10.0375,
                              width: MediaQuery.of(context).size.width/4.909090,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/hotdog.jpg",),
                                      fit: BoxFit.cover
                                  )
                              ),
                              //color: Colors.yellow,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width/19.636363,),
                            Container(
                              margin: const EdgeInsets.only(left: 0),
                              height: MediaQuery.of(context).size.height/10.0375,
                              width: MediaQuery.of(context).size.width/2.53372434,
                              //color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Delicious hot dog", ),
                                  Wrap(
                                    children:
                                    List.generate(5, (index) => const Icon(Icons.star, color: Colors.yellow,size: 10,)),
                                  ),
                                  const Text("\$25   ""\$18"),
                                ],
                              ),
                            ),
                            //SizedBox(width: 45,),
                           /* Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.green,
                              ),
                              child: Icon(Icons.add, color: Colors.white,),
                              padding: EdgeInsets.all(10),
                            ),*/
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/10.0375,
                              width: MediaQuery.of(context).size.width/4.909090,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/pizza.jpg",),
                                      fit: BoxFit.cover
                                  )
                                //color: Colors.yellow,
                              ),
                              /*child: Image.asset(
                              "assets/images/hotdog.jpg",
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                                ),*/
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width/19.636363,),
                            Container(
                              margin: const EdgeInsets.only(left: 0),
                              height: MediaQuery.of(context).size.height/10.0375,
                              width: MediaQuery.of(context).size.width/2.53372434,
                              //color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Cheese pizza", ),
                                  Wrap(
                                    children:
                                    List.generate(5, (index) => const Icon(Icons.star, color: Colors.yellow,size: 10,)),
                                  ),
                                  const Text("\$25   ""\$18"),
                                ],
                              ),
                            ),
                            //SizedBox(width: 45,),
                           /* Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.green,
                              ),
                              child: Icon(Icons.add, color: Colors.white,),
                              padding: EdgeInsets.all(10),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



