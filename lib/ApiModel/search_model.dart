class SearchModel {
  int? status;
  String? mesasge;
  List<Data>? data;

  SearchModel({this.status, this.mesasge, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mesasge = json['mesasge'];
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
    data['mesasge'] = this.mesasge;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  String? thumbnail;
  String? discountedPrice;
  String? price;
  String? shortContent;
  int? packageId;
  int? conditionId;
  int? specializedId;
  int? lifestyleDisorderId;
  String? type;
  String? icon;
  String? typtype;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.thumbnail,
      this.discountedPrice,
      this.price,
      this.shortContent,
      this.packageId,
      this.conditionId,
      this.specializedId,
      this.lifestyleDisorderId,
      this.type,
      this.icon,
      this.typtype});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    discountedPrice = json['discounted_price'];
    price = json['price'];
    shortContent = json['short_content'];
    packageId = json['package_id'];
    conditionId = json['condition_id'];
    specializedId = json['specialized_id'];
    lifestyleDisorderId = json['lifestyle_disorder_id'];
    type = json['type'];
    icon = json['icon'];
    typtype = json['typtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['thumbnail'] = this.thumbnail;
    data['discounted_price'] = this.discountedPrice;
    data['price'] = this.price;
    data['short_content'] = this.shortContent;
    data['package_id'] = this.packageId;
    data['condition_id'] = this.conditionId;
    data['specialized_id'] = this.specializedId;
    data['lifestyle_disorder_id'] = this.lifestyleDisorderId;
    data['type'] = this.type;
    data['icon'] = this.icon;
    data['typtype'] = this.typtype;
    return data;
  }
}
