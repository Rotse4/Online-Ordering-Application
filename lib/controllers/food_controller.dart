import 'package:get/get.dart';
import 'package:online_order_app/models/Food_models.dart';
import 'package:online_order_app/utils/show_custom_snackbar.dart';
import '../data/api/repository/food_repo.dart';

class Cart {
  RxList<CartItem> foodListModel = List<CartItem>.empty(growable: true).obs;
  CartItem? getCartItem(FoodModel foodModel) {
    return foodListModel
        .firstWhereOrNull((element) => foodModel.id == element.foodModel.id);
  }

  bool get isCartEmpty => foodListModel.isEmpty ? true : false;
  RxBool inCart = false.obs;
  addItem(FoodModel foodModel) {
    var existingFoodModel = foodListModel
        .firstWhereOrNull((element) => foodModel.id == element.foodModel.id);
    if (existingFoodModel != null) {
      existingFoodModel.incrementByOne();
      print("You cart is worth ${bill}");

      return;
    }
    var cartItem = CartItem(foodModel: foodModel);
    cartItem.incrementByOne();
    foodListModel.add(cartItem);
    print("You cart is worth ${bill}");
  }

  deleteItem(FoodModel foodModel) {
    var existingFoodModel = foodListModel
        .firstWhereOrNull((element) => foodModel.id == element.foodModel.id);
    if (existingFoodModel != null) {
      foodListModel
          .removeWhere((element) => element.foodModel.id == foodModel.id);
      print("You cart is worth ${bill}");

      return;
    }
    print("You cart is worth ${bill}");

    return;
  }

  get bill => foodListModel.fold(0, (current, next) {
        // print("the qunatity ${next.quantity.value}");
        return (current + (next.foodModel.price ?? 0) * next.quantity.value);
      });

  reduceQuantity(FoodModel foodModel) {
    var existingFoodModel = foodListModel
        .firstWhereOrNull((element) => foodModel.id == element.foodModel.id);
    if (existingFoodModel != null) {
      existingFoodModel.decementByOne();
      if (existingFoodModel.quantity.value == 0) {
        foodListModel.remove(existingFoodModel);
      }
      return;
    }
    return;
  }

  bool isInCart(FoodModel foodModel) {
    var existingFoodModel = foodListModel
        .firstWhereOrNull((element) => foodModel.id == element.foodModel.id);
    if (existingFoodModel != null) {
      return true;
    }
    return false;
  }

  bool innCart(FoodModel foodModel){
    var existingFoodModel = foodListModel
        .firstWhereOrNull((element) => foodModel.id == element.foodModel.id);
    if(existingFoodModel!=null){
      inCart =true.obs;
      return true;
    }
    return false;
  }
}

class CartItem {
  late FoodModel foodModel;

  RxInt quantity = 0.obs;

  // CartItem({this.quantity = 1.obs, required this.foodModel});
  CartItem({RxInt? quantity, required this.foodModel});

  incrementByOne() {
    print("I was called");
    quantity(quantity.value + 1);
    print(quantity);
  }

  decementByOne() {
    if (quantity > 0) {
      quantity(quantity.value - 1);
    }
  }

  get subTatal => this.quantity * (foodModel.price ?? 0);
}

class FoodController extends GetxController {
  final FoodRepo foodRepo;
  
  var isprocessing=RxBool(false);
  FoodController({required this.foodRepo});
  List<FoodModel> _foodList = [];
  List<FoodModel> get foodList => _foodList;
  List<FoodModel> _featuredList =[];
  List<FoodModel> get fraturedList => _featuredList;
  Cart cart = Cart();
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _setNum = 4;
  int get setNum => _setNum;
  addToCart(FoodModel foodModel) {
    cart.addItem(foodModel);
    update();
  }
   
  Future<void> getFoodList() async {
    Response? response = await foodRepo.getFoodList();
    if (response?.statusCode == 200) {
      // FoodModel.fromJson(response.body);
      _foodList = [];
      _foodList.addAll(Food.fromJson(response?.body).foods);
      print(_foodList);
      _isLoaded = true;
      update();
    } else {
      print("foods not found");
    }
  }

  FoodModel getFoodById(int id) {
    return foodList.firstWhere((element) => element.id == id);
  }

  orderNow() async{
    if (isprocessing.value){
      return;
    }
    if(payment_number.value.length<9){
          showCustomSnackBar("Enter a valid number");
return;
    }
    isprocessing.value=true;
    var items = cart.foodListModel.map((element) =>
        {"id": element.foodModel.id, "quantity": element.quantity.value});
    var order = {"payment_number": "254"+payment_number.value, "items": items.toList()};
 
     await foodRepo.orderNow(order);
      isprocessing.value=false;
  }

  RxString payment_number="".obs;

  Future<void> getCategory() async {
  Response? response = await foodRepo.getCategory();
    if (response?.statusCode == 200) {
      _featuredList = [];
      _featuredList.addAll(Food.fromJson(response?.body).foods);
      // print(_foodList);
      print("list featured $_featuredList");
       print("list featured ${_featuredList.length}");
      print("imefika hapa");
      _isLoaded = true;
      update();
    } else {
      print("foods not found");
    }
  }
List<FoodModel> get recommended => this._featuredList.where((element) => element.category=="recommended").toList();
List<FoodModel>  get popular => this._featuredList.where((element) => element.category=="popular").toList();
List<FoodModel>  get featured => this._featuredList.where((element) => element.category=="featured").toList();

}
