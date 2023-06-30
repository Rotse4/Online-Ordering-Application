import 'package:flutter/material.dart';
import 'package:online_order_app/models/Food_models.dart';
enum ItemEvent{
  INCREMENT,
  DECREMENT
}
 typedef ProductEvent =Function(FoodModel foodModel,ItemEvent itemEvent);
class Count extends StatelessWidget {
  
   Count({
    super.key,
    this.productEvent,
    required this.foodModel
  });
  ProductEvent? productEvent;
late FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 40,
                width: 90,
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if(productEvent!=null){
                          productEvent!(foodModel,ItemEvent.DECREMENT);
                        }
                      },
                      child: Icon(Icons.remove, color: Colors.orange, size: 20,)),
                    Text("3"),
                    InkWell(
                      onTap: () {
                          if(productEvent!=null){
                          productEvent!(foodModel,ItemEvent.INCREMENT);
                        }
                      },
                      child: Icon(Icons.add, color: Colors.orange, size: 20)),
                  ],
                ),
              ),
               Container(
                margin: EdgeInsets.only(right: 15),
                child: Text("Add to cart", style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w800
                ),))
            ],
          ),

         
        ],
      ),
    );
  }
}