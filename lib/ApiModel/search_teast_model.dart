class SearchTestModel {
  int? status;
  String? message;
  List<Data>? data;

  SearchTestModel({this.status, this.message, this.data});

  SearchTestModel.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? price;
  String? thumbnail;
  String? discountedPrice;
  String? shortContent;

  Data(
      {this.name,
      this.slug,
      this.type,
      this.price,
      this.thumbnail,
      this.discountedPrice,
      this.shortContent});

  Data.fromJson(Map<String, dynamic> json) {
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
