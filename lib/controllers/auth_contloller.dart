// import 'dart:html';

// import 'dart:js_interop';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/data/api/repository/auth_repo.dart';
import 'package:online_order_app/models/user_models.dart';
import 'package:online_order_app/utils/app_constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:online_order_app/utils/app_constants.dart';

import '../models/login_model.dart';
import '../models/registration_model.dart';
import '../utils/show_custom_snackbar.dart';

class AuthController  extends GetxController implements GetxService{
  AuthRepo authRepo= AuthRepo(apiClient: Get.find());
   
  bool _isLoading = false;
  bool get isloading => _isLoading;
 
  
  Future<UserModel?>registration(RegisterUser registerUser)async{
    UserModel? userModel=null;
    _isLoading=true;
    Response response= await authRepo.registration(registerUser);
    print(response.statusCode);
    if(response.statusCode==200){
     
      userModel= UserModel.fromJson(jsonDecode(response.bodyString??"{}"));
      // authRepo.saveUserToken(response.body["payload"]["token"]["access_token"]);
      // authRepo.saveUserToken(userModel.payload.token.accessToken);
      
      authRepo.saveUser(response.bodyString??"{}");

    }else{
      var res=jsonDecode(response.bodyString??"{}");
      print(res);
      // userModel=jsonDecode(response.bodyString!);
      // print(userModel);

    }
    _isLoading=false;
    update();
  //  var sharedPreferences = await SharedPreferences.getInstance();
  //  sharedPreferences.setString('token',response.body['token']);
  print(userModel);
    return userModel;
  }

  Future<UserModel?>login(UserLogin userLogin)async{
    UserModel? userModel;
    _isLoading=true;
    print(userLogin.username);
    Response response= await authRepo.login(userLogin);
    print(response.statusCode);
    if(response.statusCode==200){
       
      userModel= UserModel.fromJson(jsonDecode(response.bodyString??"{}"));
      print(response.bodyString);
      // authRepo.saveUserToken(response.body["payload"]["token"]["access_token"]);
      // authRepo.saveUserToken(userModel.payload.token.accessToken);
      // if()
      authRepo.saveUser(response.bodyString??"{}");
      showCustomSnackBar("We missed you ${userModel.payload.user.username}!",
      title: "Welcome", backgroundColor: Colors.orange );
      print("my token is "+AppConstants.TOKEN);
      
    }else{
      var res=jsonDecode(response.bodyString??"{}");
      print("resss $res");

    }
    _isLoading=false;
    update();
  //  var sharedPreferences = await SharedPreferences.getInstance();
  //  sharedPreferences.setString('token',response.body['token']);
  print("my token is "+AppConstants.TOKEN);

    return userModel;
  }
}