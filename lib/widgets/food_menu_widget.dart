import 'package:flutter/material.dart';
import 'package:online_order_app/models/Food_models.dart';
import 'package:online_order_app/utils/app_constants.dart';

class FoodMenuWidget extends StatelessWidget {
  const FoodMenuWidget({
    super.key,
    required this.itemColor,
    required this.foodModel,
  });

  final Color itemColor;
  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3.021,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: itemColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height/10.0375,
            width: MediaQuery.of(context).size.width/4.9091,
            margin: const EdgeInsets.only(left: 20, right: 20, ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                image:  DecorationImage(
                    image: NetworkImage(
                      AppConstants.BASE_URL+(foodModel.image??"")
                    ),
                    fit: BoxFit.cover
                )
            ),
          ),
          Text('${foodModel.title!}\n Ksh${foodModel.price}' ,style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),)
        ],
      )
    );
  }
}
