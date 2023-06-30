// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError=true, String title="Error", Color backgroundColor = Colors.redAccent}){
  Get.snackbar(title, message, titleText: Text(title),messageText: Text(message, style: const TextStyle (
    color: Colors.white
  ),),
  colorText: Colors.white,
  snackPosition: SnackPosition.TOP,
  backgroundColor: backgroundColor
  // backgroundColor:Colors.redAccent
  );
}