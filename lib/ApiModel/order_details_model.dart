class OrderDetailsModel {
  int? status;
  String? message;
  Data? data;

  OrderDetailsModel({this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? orderId;
  String? bookedFor;
  String? bookedDate;
  String? bookedTime;
  int? orderStatus;
  String? paymentMethod;
  int? paymentStatus;
  int? userId;
  Order? order;

  Data(
      {this.id,
      this.orderId,
      this.bookedFor,
      this.bookedDate,
      this.bookedTime,
      this.orderStatus,
      this.paymentMethod,
      this.paymentStatus,
      this.userId,
      this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    bookedFor = json['booked_for'];
    bookedDate = json['booked_date'];
    bookedTime = json['booked_time'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    userId = json['user_id'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['booked_for'] = this.bookedFor;
    data['booked_date'] = this.bookedDate;
    data['booked_time'] = this.bookedTime;
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['user_id'] = this.userId;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  List<String>? id;
  List<String>? name;
  List<int>? quantity;
  List<int>? price;
  List<String>? category;

  Order({this.id, this.name, this.quantity, this.price, this.category});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'].cast<String>();
    name = json['name'].cast<String>();
    quantity = json['quantity'].cast<int>();
    price = json['price'].cast<int>();
    category = json['category'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['category'] = this.category;
    return data;
  }
}