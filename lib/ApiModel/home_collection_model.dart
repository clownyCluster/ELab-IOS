class HomeCollection {
  int? status;
  String? message;
  List<Tests>? tests;
  List<Packages>? packages;

  HomeCollection({this.status, this.message, this.tests, this.packages});

  HomeCollection.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['tests'] != null) {
      tests = <Tests>[];
      json['tests'].forEach((v) {
        tests!.add(new Tests.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.tests != null) {
      data['tests'] = this.tests!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
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

class Packages {
  String? name;
  String? slug;
  String? type;
  String? icon;
  int? price;
  int? discountedPrice;
  int? packageCategoryId;

  Packages(
      {this.name,
      this.slug,
      this.type,
      this.icon,
      this.price,
      this.discountedPrice,
      this.packageCategoryId});

  Packages.fromJson(Map<String, dynamic> json) {
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