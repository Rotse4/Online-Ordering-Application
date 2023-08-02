import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/data/api/repository/auth_repo.dart';
import 'package:online_order_app/models/user_models.dart';

import '../routes/rout_helper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 235, 218),
      body: FutureBuilder<UserModel?>(
        future: AuthRepo.getUserInstance(),
        builder: (context, snap){
          if(snap.hasData){
            return Container(

            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.047, left: MediaQuery.of(context).size.width*0.0509, right: MediaQuery.of(context).size.width*0.0509),
            child: Column(
            children: [
            Container(
              height: MediaQuery.of(context).size.height*0.2174,
              width: double.maxFinite,
              // color: Colors.grey,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1527,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 197, 164),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 10),
                            // color: Colors.blue,
                           )
                        ],
                      ),
                    )),
                    Positioned(
                      top: MediaQuery.of(context).size.height*0.08813,
                      left: MediaQuery.of(context).size.width*0.3206,
                      right: MediaQuery.of(context).size.width*0.3206,
                      
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1175,
                      width: MediaQuery.of(context).size.width*0.2545,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: const CircleAvatar(backgroundColor: Colors.orange,
                    backgroundImage: AssetImage("assets/images/avatar.png"),),
                    )
                    )
                ],
              ),
            ),
            Text("Hello ${snap.data?.payload.user.username}!", style: TextStyle(
              fontSize: 18
            ),),
            SizedBox(height: MediaQuery.of(context).size.height*0.0235,),
            Text("${snap.data?.payload.user.email}"),
            SizedBox(height: MediaQuery.of(context).size.height*0.0235,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => AuthRepo.deleteUserInstance().then((value) => Get.toNamed(RouteHelper.initial)),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.047,
                      width: MediaQuery.of(context).size.width*0.3308,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text("Log Out")),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.047,
                    width: MediaQuery.of(context).size.width*0.3308,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text("Notifications")),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.0355,),
            Container(
              height: MediaQuery.of(context).size.height*0.49,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
            )
          ],
        ),
      );
          }
          return Text("null");
        },
      )
      
    );
  }
}