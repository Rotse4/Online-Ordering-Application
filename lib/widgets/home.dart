import 'package:flutter/material.dart';
import 'package:online_order_app/widgets/home_content.dart';
import 'package:online_order_app/widgets/user_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
              height: MediaQuery.of(context).size.height/20.075,

              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      // Get.to(LoginPage());
                    },
                    child: const Icon(Icons.menu),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder:(ctx)=> DialogExample());
                      // Get.to(()=>DialogExample());
                    },
                    child: Container(
                    height: MediaQuery.of(context).size.height/22.3,
                    width: MediaQuery.of(context).size.width/11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.orange.withOpacity(0.6),
                    ),

                    child: const CircleAvatar(backgroundColor: Colors.orange,
                    backgroundImage: AssetImage("assets/images/avatar.png"),)
                  ),
                  ),                 
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: HomeContent(),
            ))
        ],
      ),
    );
  }
}