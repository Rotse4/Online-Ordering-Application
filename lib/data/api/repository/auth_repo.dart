import 'dart:convert';

import 'package:online_order_app/data/api/api_client.dart';
import 'package:online_order_app/models/registration_model.dart';
import 'package:online_order_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../../models/login_model.dart';
import '../../../models/user_models.dart';

class AuthRepo{
  final ApiClient apiClient;
  AuthRepo({
    required this.apiClient,
  });

  Future<Response> registration(RegisterUser registerUser) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, registerUser.toJson());
  }

  Future<Response> login(UserLogin userLogin) async {
     print("called on login");
     print(userLogin.toJson());
    return await apiClient.postData(AppConstants.LOGIN_URI, userLogin.toJson());
  }
  Future<bool>saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    // print(AppConstants.TOKEN);
    return  sharedPreferences.setString(AppConstants.TOKEN, token); 

  }
    Future<bool>saveUser(String user) async {
   
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    // print(AppConstants.TOKEN);
    return  sharedPreferences.setString('user', user); 

  }
    Future<bool>saveUserModel(UserModel user) async {
   
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    // print(AppConstants.TOKEN);
    return  sharedPreferences.setString('user', jsonEncode(user.toJson())); 

  }
  Future<UserModel?> getUser() async{
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var stringUser=  sharedPreferences.getString('user'); 
    // print(stringUser);
           if(stringUser==null){
            print("user is null, printing from auth repo");
            return null;
           }
     return UserModel.fromJson(jsonDecode(stringUser));
  }
  static Future<UserModel?> getUserInstance() async{
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var stringUser=  sharedPreferences.getString('user'); 
 if(stringUser==null){
            return null;
           }
     return UserModel.fromJson(jsonDecode(stringUser));
  }
  static Future<bool?> deleteUserInstance() async{
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.remove('user'); 

  }
  
}