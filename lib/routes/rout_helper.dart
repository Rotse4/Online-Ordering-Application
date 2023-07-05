import 'package:get/get.dart';

import '../details/details_page.dart';
import '../widgets/home.dart';
import '../widgets/login_page.dart';


class RouteHelper{
  static const String initial ="/";
  static const String homeScreen="/home-screen";
  static const String detailPage="/detail-page";

  // RouteHelper(int index);

  static String getDetailPage(int pageId)=>'$detailPage?pageId=$pageId';
  

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>LoginPage()),
    GetPage(name: homeScreen, page: ()=>Home()),
       
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