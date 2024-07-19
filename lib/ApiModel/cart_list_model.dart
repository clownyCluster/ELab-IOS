class CartListModel {
  int? status;
  String? message;
  List<Data>? data;
  int? couponPrice;
  int? totalPrice;

  CartListModel(
      {this.status,
      this.message,
      this.data,
      this.couponPrice,
      this.totalPrice});

  CartListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    couponPrice = json['coupon_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['coupon_price'] = this.couponPrice;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  int? quantity;
  int? originalPrice;
  int? price;
  int? itemSubtotal;
  String? image;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.quantity,
      this.originalPrice,
      this.price,
      this.itemSubtotal,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    quantity = json['quantity'];
    originalPrice = json['original_price'];
    price = json['price'];
    itemSubtotal = json['item_subtotal'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['quantity'] = this.quantity;
    data['original_price'] = this.originalPrice;
    data['price'] = this.price;
    data['item_subtotal'] = this.itemSubtotal;
    data['image'] = this.image;
    return data;
  }
}