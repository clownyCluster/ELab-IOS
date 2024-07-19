class OffersDetailsModel {
  int? status;
  String? message;
  Data? data;

  OffersDetailsModel({this.status, this.message, this.data});

  OffersDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? slug;
  String? thumbnail;
  String? price;
  String? discountedPrice;
  String? description;
  List<Tests>? tests;

  Data(
      {this.title,
      this.slug,
      this.thumbnail,
      this.price,
      this.discountedPrice,
      this.description,
      this.tests});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    description = json['description'];
    if (json['tests'] != null) {
      tests = <Tests>[];
      json['tests'].forEach((v) {
        tests!.add(new Tests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['description'] = this.description;
    if (this.tests != null) {
      data['tests'] = this.tests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tests {
  String? name;
  String? slug;
  String? type;
  int? price;
  String? thumbnail;
  int? discountedPrice;
  String? shortContent;

  Tests(
      {this.name,
      this.slug,
      this.type,
      this.price,
      this.thumbnail,
      this.discountedPrice,
      this.shortContent});

  Tests.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    discountedPrice = json['discounted_price'];
    shortContent = json['short_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['price'] = this.price;
    data['thumbnail'] = this.thumbnail;
    data['discounted_price'] = this.discountedPrice;
    data['short_content'] = this.shortContent;
    return data;
  }
}
