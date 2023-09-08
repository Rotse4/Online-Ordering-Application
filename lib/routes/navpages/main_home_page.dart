import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_order_app/widgets/user_profile.dart';
import '../../widgets/home.dart';
import '../../widgets/order_history.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex=0;
  List pages =[
    Home(),
    UserProfile(),
    Container(child: Center(child: Text("Development in process"),),),
    OrderHistory()
    
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        exit(0);
      },
      child:  Scaffold(
      backgroundColor:  const Color.fromARGB(255, 247, 235, 218),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:  Color.fromARGB(255, 247, 235, 218),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange.withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "Home"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,),
            label: "Account"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.notifications,),
            label: "Notifcations"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.menu,),
            label: "Menu"
            ),
            
        ]),
    ),
       );
  }
}