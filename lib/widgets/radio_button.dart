import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/food_controller.dart';
import 'drop_down.dart';

enum SelectValues {StationPick, deliver}

class RadioSelect extends StatefulWidget {
   const RadioSelect({super.key});
  

  @override
  State<RadioSelect> createState() => _RadioSelectState();
}

class _RadioSelectState extends State<RadioSelect> {
  // Map <String, dynamic> pickupMap ={};
  FoodController foodController =Get.find();
  SelectValues? _character=SelectValues.StationPick;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodController.deliverMap["pickup"]=true;
    // print(foodController.deliverMap);
  }
  

  @override
  Widget build(BuildContext context) {
    // print("from h ${foodController.deliverMap}");
    return Container(
              height: MediaQuery.of(context).size.height*0.3760,
              padding: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(minHeight: 251),
              child: Card(
                shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("     Shipping  Method", style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.0235
                    , fontWeight: FontWeight.bold),),
                     RadioListTile(
                        title: Text("Pick from our Food Caffee", style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.0188,
                        ),),
                        subtitle: Text("Zimmerm Hub",),
                        value: SelectValues.StationPick, groupValue: _character, onChanged: (value){
                          setState(() {
                            foodController.deliverMap["pickup"]=true;
                            foodController.deliverMap.remove("region");
                            foodController.deliverMap.remove("exactLocation");
                   
  
                            // print(foodController.deliverMap);
                            _character=value;
                          });
              
                      }),
                        RadioListTile(              
                        title: Text("Deliver To", style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.0188,
                        )),
                        subtitle: Text("Areas around Kasarani"),
                        value: SelectValues.deliver, groupValue: _character, onChanged: (value){
                          setState(() {
                            foodController.deliverMap["pickup"]=false;
                            // print(foodController.deliverMap);
                            _character=value;
            
                          });
              
                      }),
                      _character==SelectValues.deliver?Dropdown():Container(),
                  ],
                ),
              ),
            );
  }
}