import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:online_order_app/data/api/repository/auth_repo.dart';
import 'package:online_order_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;
  late AuthRepo authRepo;
  ApiClient({ required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout =  Duration(minutes: 3);
    token=AppConstants.TOKEN;
   
    authRepo=AuthRepo(apiClient: this);

    httpClient.addRequestModifier<dynamic>((request) async{
       var noAuth=request.url.path.contains("/api/account/log") || request.url.path.contains("/api/account/register") ;
      // print("${request.url.path.contains("/api/account/log")}");
      var gUser=await authRepo.getUser();
      print(gUser?.toJson());
      request.headers["Content-type"]= 'application/json; charset=UTF-8';
      if(gUser!=null && !noAuth){
        print(("Add Auth Headers"));
        request.headers["Authorization"]='Bearer ${gUser.payload.token.accessToken}';
      //   Get.toNamed(RouteHelper.homeScreen);
       }else{
       }
      // print("Headerss ${request.headers}");
      return request;

    });

  }
  

  // TODO: implement initialized
  void updateHeader(String token){
    _mainHeaders={
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response?> getData(String uri,) async{
    try{
      Response response =await get("/api");
      //print(response.bodyString);
      print("Got all products");
      return response;
    }catch(e){
      print("error trying to get foods");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

    Future<Response> postData(String uri, dynamic body) async {
    try {
      // var sharedpref=await SharedPreferences.getInstance();
    //  var token= sharedpref.getString('token');
    //  _mainHeaders["Authorization": "token];
      Response response= await post(uri, body,);
      // print(response.body);
      return response;
    } catch (e) {
      print("Error trying to post data: $e");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}