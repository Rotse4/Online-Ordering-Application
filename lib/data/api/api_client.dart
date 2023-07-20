import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:online_order_app/data/api/repository/auth_repo.dart';
import 'package:online_order_app/models/user_models.dart';
import 'package:online_order_app/utils/app_constants.dart';

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
            // // print("wewe");
            // print(request.bodyBytes);
            // print("ffff");

       var noAuth=request.url.path.contains("/api/account/log") 
       || request.url.path.contains("/api/account/register") 
       ||request.url.path.contains("/api/account/refresh") ;
       
       
      // print("${request.url.path.contains("/api/account/log")}");
      var gUser;
      try {
      gUser=await authRepo.getUser();
      } catch (e) {
        // print(e.toString()); 
      }
      // print(gUser?.toJson());
      //request.headers["Content-type"]= 'application/json; charset=UTF-8';
      if(gUser!=null && !noAuth){
        // print(("Add Auth Headers"));
        request.headers["Authorization"]='Bearer ${gUser.payload.token.accessToken}';
      //   Get.toNamed(RouteHelper.homeScreen);
       }else{
        print("user  found");
       }
      // print("Headerss ${request.headers}");
      return request;

    });
    httpClient.addResponseModifier((request, res) async{

      if(res.statusCode==HttpStatus.unauthorized){
        print("ca;led");
            var gUser=await authRepo.getUser();
            // print("guser ${gUser!.payload}");
            var response= await httpClient.get(AppConstants.TOKENREFRESH,query: {"refresh_token":gUser?.payload.token.refreshToken});
              gUser?.payload.token.accessToken=response.body["token"];
              // print("response bod  ${response.body["token"]}");
              // authRepo.saveUser(response.bodyString??"{}");
          // await authRepo.saveUser(gUser?.payload.toString()??"");
          await authRepo.saveUserModel(gUser??UserModel.fromJson({}));
          // print("new user ${gUser!.payload}");
          // print("request was ${request.headers["Authorization"]}");
          // request.headers["Authorization"]="Bearer ${request.headers}";
          request.headers.removeWhere((key, value) => key.toLowerCase()!="content-type");
          var header= request.headers;
          header["Authorization"]="Bearer "+ response.body["token"];
                  print(header);

          // var res2=  await httpClient.request(request.url.path,request.method,
          // query: request.url.queryParameters,
          // decoder: request.decoder,
          // body: await request.bodyBytes.toBytes(),
          // headers: header,contentType: header["Content-Type"],);
          // print(res2.statusText);
          // return res2; 
      }
    return res;
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
      Response response =await get(uri);
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