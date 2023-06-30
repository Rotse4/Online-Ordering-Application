import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/routes/rout_helper.dart';

import 'details/details_page.dart';


class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  _FeaturedPageState createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  final List<String> _categories = [
    'FEATURED',
    'COMBOS',
    'FAVORITES',
    'RECOMMENDED'
  ];
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  final ScrollController _listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  child: Container(
                    //color: Colors.amberAccent,
                    margin: const EdgeInsets.only(left: 20, right: 10),
                       child: Text(
                          _categories[index],
                          style: TextStyle(
                            fontSize: _selectedIndex == index ? 16 : 12,
                            fontWeight:
                            _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                          ),
                        )
                  ),
                );
              },
              controller: _listViewController,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/144.7143),
          Expanded(
            child: PageView.builder(
              itemCount: _categories.length,
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
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.detailPage);
                            },
                            child: Container(
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
                                const Text("Delicious hot dog", ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(
                                RouteHelper.detailPage
                              );
                            },
                            child: Container(
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
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/19.636363,),
                          Container(
                            margin: const EdgeInsets.only(left: 0),
                            height: MediaQuery.of(context).size.height/10.0375,
                            width: MediaQuery.of(context).size.width/2.53372,
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
                          SizedBox(width: MediaQuery.of(context).size.width/8.727272,),
                          Container(
                            height: MediaQuery.of(context).size.height/16.7291667,
                            width: MediaQuery.of(context).size.width/8.18181,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.orange,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(Icons.add, color: Colors.white,),
                          ),
                        ],
                      ),
                    ],
                  ),
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
      );
  }
}

