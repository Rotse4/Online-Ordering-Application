// class Order {
//   List<Ordes>? ordes;

//   Order({this.ordes});

//   Order.fromJson(Map<String, dynamic> json) {
//     if (json['Ordes'] != null) {
//       ordes = <Ordes>[];
//       json['Ordes'].forEach((v) {
//         ordes!.add(new Ordes.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.ordes != null) {
//       data['Ordes'] = this.ordes!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Ordes {
//   int? id;
//   int? account;
//   String? orderDate;
//   String? paymentNumber;
//   String? total;
//   bool? confirmed;

//   Ordes(
//       {this.id,
//       this.account,
//       this.orderDate,
//       this.paymentNumber,
//       this.total,
//       this.confirmed});

//   Ordes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     account = json['account'];
//     orderDate = json['order_date'];
//     paymentNumber = json['payment_number'];
//     total = json['total'];
//     confirmed = json['confirmed'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['account'] = this.account;
//     data['order_date'] = this.orderDate;
//     data['payment_number'] = this.paymentNumber;
//     data['total'] = this.total;
//     data['confirmed'] = this.confirmed;
//     return data;
//   }
// }
