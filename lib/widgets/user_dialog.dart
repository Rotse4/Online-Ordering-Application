// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/data/api/repository/auth_repo.dart';
import 'package:online_order_app/routes/rout_helper.dart';

import '../models/user_models.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key, });
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          // title: const Text('AlertDialog Title'),
          content: FutureBuilder<UserModel?>(
            future: AuthRepo.getUserInstance(),
            builder: (context,snap) {
             
               if(snap.hasData){
              return Container(
                height: 240,
                child: Column(
                      children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    // Add your content widgets here
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(child: Text("JK", style: TextStyle(
                            color: Colors.white
                          ),)),
                        ),
                        // SizedBox(height: 10,),
                        // Text("Japheth Kasinya"),
                        SizedBox(height: 20,),
                        Container(
                          // height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: const Color.fromARGB(255, 224, 216, 216),
                            //     blurRadius: 20,
                            //     spreadRadius: 10
                            //   )
                            // ]
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Username", style: TextStyle(
                                    color: Colors.black
                                  ),),
                                  SizedBox(width: 7,),
                                  Text("${snap.data?.payload.user.username}", style: TextStyle(
                                    color: Colors.black54
                                  ),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Column(
                                children: [
                                  Text("Email", style: TextStyle(
                                    color: Colors.black
                                  ),),
                                  SizedBox(width: 7,),
                                  Text("${snap.data?.payload.user.email}", style: TextStyle(
                                    color: Colors.black54
                                  ),)
                                ],
                              ),
                              
                            ]),
                        )
                      ],
                    ),
                  ),
                ),
                      ],
                    ),
              );
            }
            return Container(
              height: 240,
            );
            }
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              ))
                            ),
                            onPressed: (){
                                AuthRepo.deleteUserInstance().then((value) => Get.toNamed(RouteHelper.initial));
                            },
                           child: const Text("Logout", style: TextStyle(
                            color: Colors.white
                           ),)),
                           TextButton(
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              ))
                            ),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                           child: const Text("Cancel", style: TextStyle(
                            color: Colors.white
                           ),))
                ],
                
              ),
            )
          ],
          
        );
}
}