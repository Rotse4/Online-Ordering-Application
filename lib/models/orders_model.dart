class Order{
    late List<OrderModel> _orders;
    List<OrderModel> get orders=> _orders;

    Order({required orders}){
      this._orders = orders;
    }
    
    Order.fromJson(Map<String, dynamic> json){
      if (json['orders'] != null) {
      _orders = <OrderModel>[];
      json['orders'].forEach((v) {
        _orders!.add(OrderModel.fromJson(v));
      });
    }
    }
    
}


class OrderModel{
  int? id;
  int? account;
  String? orderDate;
  String? paymentNumber;
  String? total;
  bool? confirmed;

  OrderModel({this.id, 
  this.account,
  this.orderDate,
  this.paymentNumber,
  this.total,
  this.confirmed
  });


  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    orderDate = json['order_date'];
    paymentNumber = json['payment_number'];
    total = json['total'];
    confirmed = json['confirmed'];
  }
  @override
  String toString() {
    // TODO: implement toString
    return "Order Id ${this.id} Condirmed ? ${confirmed}";
  }

}