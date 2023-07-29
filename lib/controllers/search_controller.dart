import 'package:get/get.dart';
import 'package:online_order_app/data/api/repository/search_repo.dart';
import 'package:online_order_app/models/Food_models.dart';


class SerchController extends GetxController {
  final SearchRepo searchRepo;

  var isprocessing = RxBool(false);
  SerchController({required this.searchRepo});
  List<FoodModel> _foods = [];
  List<FoodModel> get foodl => _foods;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> searchFoods(String key) async {
    print(key);
    Response? response = await searchRepo.searchFoods(key);
    print("this is the esponse ${response?.bodyString}");
    if (response?.statusCode == 200) {
      
      // FoodModel.fromJson(response.body);
      _foods = [];
      print(" foods are $_foods");
      _foods.addAll(Food.fromJson(response?.body).foods);
      print(_foods);
      _isLoaded = true;
      update();
    } else {
      print("user orders not found");
    }
  }
}
