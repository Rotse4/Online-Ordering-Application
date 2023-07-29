import 'package:flutter/material.dart';

import '../../widgets/cart_page.dart';
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
    Container(child: Center(child: Text("Next page"),),),
    CartPage(),
    OrderHistory()
    
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 247, 235, 218),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 228, 225, 221),
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
            icon: Icon(Icons.shopping_cart_rounded,),
            label: "Cart"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.menu,),
            label: "Menu"
            ),
            
        ]),
    );
  }
}