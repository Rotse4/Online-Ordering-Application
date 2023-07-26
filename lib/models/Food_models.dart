class Food {
   List<FoodModel> _foods=[];
  List<FoodModel> get foods=> _foods;

  Food({required foods}){
    this._foods=foods;
  }

  Food.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      _foods = <FoodModel>[];
      json['foods'].forEach((v) {
        _foods!.add(FoodModel.fromJson(v));
      });
    }else if(json['orders'] != null){
         _foods = <FoodModel>[];
      json['orders'].forEach((v) {
        _foods!.add(FoodModel.fromJson(v));
      });
    }
  }

}

class FoodModel {
  int? id;
  String? title;
  String? description;
  int? price;
  String? image;
  String? created;
  String? updated;
  int? stars;
  String? category;
  int? owner;

  FoodModel(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.image,
      this.created,
      this.updated,
      this.stars,
      this.category,
      this.owner});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    created = json['created'];
    updated = json['updated'];
    stars = json['stars'];
    category = json['category'];
    owner = json['owner'];
  }


}