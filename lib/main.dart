import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:online_order_app/controllers/food_controller.dart';

import 'details/details_page.dart';
import 'featured.dart';
import 'widgets/food_menu_widget.dart';
import 'widgets/home_page.dart';
import 'helper/dependancies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const OnlineOrderingApp());
}

class OnlineOrderingApp extends StatefulWidget {

  const OnlineOrderingApp({super.key});

  @override
  State<OnlineOrderingApp> createState() => _OnlineOrderingAppState();
}

class _OnlineOrderingAppState extends State<OnlineOrderingApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
          Get.find<FoodController>().getFoodList();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

