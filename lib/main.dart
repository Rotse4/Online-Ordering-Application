import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'package:online_order_app/models/user_models.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'data/api/repository/auth_repo.dart';
import 'helper/dependancies.dart' as dep;
import 'helper/dependancies.dart';

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
    return FutureBuilder<UserModel?>(
      future:AuthRepo.getUserInstance() ,
      builder: (context,snap) {
        if(snap.hasData){

          return GetMaterialApp(
                      // initialBinding: InitilBindings(),

          debugShowCheckedModeBanner: false,
          title: 'Online Ordering App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          // home: LoginPage(),
          // home: HomePage(),
          // home: Home(),
          initialRoute: RouteHelper.initial,
          getPages: RouteHelper.routes,
          // home: RegisterPage(),
        );
        }
        return GetMaterialApp(
          // initialBinding: InitilBindings(),
          debugShowCheckedModeBanner: false,
          title: 'Online Ordering App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          // home: LoginPage(),
          // home: LoginPage(),
          // home: Home(),
          initialRoute: RouteHelper.homeScreen,
          // initialRoute: RouteHelper.userProfile,
          getPages: RouteHelper.routes,
          // home: RegisterPage(),
        );
        
      }
    );
  }
}

