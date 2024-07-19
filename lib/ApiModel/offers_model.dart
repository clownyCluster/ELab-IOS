class OfferModel {
  int? status;
  String? message;
  List<Data>? data;

  OfferModel({this.status, this.message, this.data});

  OfferModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? slug;
  String? thumbnail;
  String? discountedPrice;
  String? price;
  String? discountRate;
  String? description;

  Data(
      {this.name,
      this.slug,
      this.thumbnail,
      this.discountedPrice,
      this.price,
      this.discountRate,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    discountedPrice = json['discounted_price'];
    price = json['price'];
    discountRate = json['discount_rate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['thumbnail'] = this.thumbnail;
    data['discounted_price'] = this.discountedPrice;
    data['price'] = this.price;
    data['discount_rate'] = this.discountRate;
    data['description'] = this.description;
    return data;
  }
}
