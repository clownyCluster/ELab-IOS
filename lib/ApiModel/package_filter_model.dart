class PackageFilterModel {
  int? status;
  String? message;
  List<Data>? data;

  PackageFilterModel({this.status, this.message, this.data});

  PackageFilterModel.fromJson(Map<String, dynamic> json) {
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
  String? icon;
  String? price;
  String? discountedPrice;
  Null? packageCategoryId;

  Data(
      {this.name,
      this.slug,
      this.type,
      this.icon,
      this.price,
      this.discountedPrice,
      this.packageCategoryId});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    icon = json['icon'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    packageCategoryId = json['package_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['icon'] = this.icon;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['package_category_id'] = this.packageCategoryId;
    return data;
  }
}
