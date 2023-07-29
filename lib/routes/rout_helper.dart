import 'package:get/get.dart';
import 'package:online_order_app/widgets/cart_page.dart';
import 'package:online_order_app/widgets/checkout_page.dart';
import 'package:online_order_app/widgets/order_history.dart';
import 'package:online_order_app/widgets/search_page.dart';

import '../details/details_page.dart';
import '../widgets/home.dart';
import '../widgets/login_page.dart';
import 'navpages/main_home_page.dart';


class RouteHelper{
  static const String initial ="/";
  static const String homeScreen="/home-screen";
  static const String detailPage="/detail-page";
  static const String orderHistory="/order-history";
  static const String cartPage="/cart-page";
  static const String checkOutPage="/checkout-page";
  static const String searchPage ="/search-page";
  
  // RouteHelper(int index);

  static String getDetailPage(int pageId)=>'$detailPage?pageId=$pageId';
  

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>LoginPage()),
    GetPage(name: homeScreen, page: ()=>MainHomePage()),
    GetPage(name: orderHistory, page: ()=>OrderHistory()),
    GetPage(name: cartPage, page: ()=>CartPage()),
    GetPage(name: checkOutPage, page: ()=>CheckOutPage()),
    GetPage(name: searchPage, page: ()=>SearchPage()),
    
       
    GetPage(name: detailPage, page: (){
      var pageId =int.tryParse(Get.parameters['pageId']??"0");
      print(pageId);
      if(pageId==null){
            return DetailPage( pageId: pageId??0,);
      }
      return DetailPage( pageId: pageId,);
      
    },
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 60)
    ),
  ];
}