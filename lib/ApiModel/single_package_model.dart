class SinglePackageModel {
  int? status;
  String? message;
  Data? data;

  SinglePackageModel({this.status, this.message, this.data});

  SinglePackageModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? slug;
  int? display;
  String? icon;
  String? pdf;
  String? pdfThumb;
  String? price;
  String? packageDetails;
  String? discountedPrice;
  String? reportDelivery;
  String? preTestInformation;
  String? whoShouldBook;
  int? packageCategoryId;
  String? createdAt;
  String? updatedAt;
  List<TestsAndParameters>? testsAndParameters;
  List<Tests>? tests;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.display,
      this.icon,
      this.pdf,
      this.pdfThumb,
      this.price,
      this.packageDetails,
      this.discountedPrice,
      this.reportDelivery,
      this.preTestInformation,
      this.whoShouldBook,
      this.packageCategoryId,
      this.createdAt,
      this.updatedAt,
      this.testsAndParameters,
      this.tests});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    display = json['display'];
    icon = json['icon'];
    pdf = json['pdf'];
    pdfThumb = json['pdf_thumb'];
    price = json['price'];
    packageDetails = json['package_details'];
    discountedPrice = json['discounted_price'];
    reportDelivery = json['report_delivery'];
    preTestInformation = json['pre_test_information'];
    whoShouldBook = json['who_should_book'];
    packageCategoryId = json['package_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tests_and_parameters'] != null) {
      testsAndParameters = <TestsAndParameters>[];
      json['tests_and_parameters'].forEach((v) {
        testsAndParameters!.add(new TestsAndParameters.fromJson(v));
      });
    }
    if (json['tests'] != null) {
      tests = <Tests>[];
      json['tests'].forEach((v) {
        tests!.add(new Tests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['display'] = this.display;
    data['icon'] = this.icon;
    data['pdf'] = this.pdf;
    data['pdf_thumb'] = this.pdfThumb;
    data['price'] = this.price;
    data['package_details'] = this.packageDetails;
    data['discounted_price'] = this.discountedPrice;
    data['report_delivery'] = this.reportDelivery;
    data['pre_test_information'] = this.preTestInformation;
    data['who_should_book'] = this.whoShouldBook;
    data['package_category_id'] = this.packageCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.testsAndParameters != null) {
      data['tests_and_parameters'] =
          this.testsAndParameters!.map((v) => v.toJson()).toList();
    }
    if (this.tests != null) {
      data['tests'] = this.tests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TestsAndParameters {
  String? test;
  List<String>? parmeters;

  TestsAndParameters({this.test, this.parmeters});

  TestsAndParameters.fromJson(Map<String, dynamic> json) {
    test = json['test'];
    parmeters = json['parmeters'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['test'] = this.test;
    data['parmeters'] = this.parmeters;
    return data;
  }
}

class Tests {
  int? id;
  String? type;
  // String? parentId;
  String? name;
  int? display;
  String? slug;
  String? price;
  String? thumbnail;
  String? discountedPrice;
  String? shortContent;
  String? testDetails;
  String? preTestInformation;
  String? reportDelivery;
  String? moreInformation;
  String? faqs;
  String? interpretation;
  int? conditionId;
  int? specializedId;
  int? lifestyleDisorderId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tests(
      {this.id,
      this.type,
      // this.parentId,
      this.name,
      this.display,
      this.slug,
      this.price,
      this.thumbnail,
      this.discountedPrice,
      this.shortContent,
      this.testDetails,
      this.preTestInformation,
      this.reportDelivery,
      this.moreInformation,
      this.faqs,
      this.interpretation,
      this.conditionId,
      this.specializedId,
      this.lifestyleDisorderId,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    // parentId = json['parent_id'];
    name = json['name'];
    display = json['display'];
    slug = json['slug'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    discountedPrice = json['discounted_price'];
    shortContent = json['short_content'];
    testDetails = json['test_details'];
    preTestInformation = json['pre_test_information'];
    reportDelivery = json['report_delivery'];
    moreInformation = json['more_information'];
    faqs = json['faqs'];
    interpretation = json['interpretation'];
    conditionId = json['condition_id'];
    specializedId = json['specialized_id'];
    lifestyleDisorderId = json['lifestyle_disorder_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    // data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['display'] = this.display;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['thumbnail'] = this.thumbnail;
    data['discounted_price'] = this.discountedPrice;
    data['short_content'] = this.shortContent;
    data['test_details'] = this.testDetails;
    data['pre_test_information'] = this.preTestInformation;
    data['report_delivery'] = this.reportDelivery;
    data['more_information'] = this.moreInformation;
    data['faqs'] = this.faqs;
    data['interpretation'] = this.interpretation;
    data['condition_id'] = this.conditionId;
    data['specialized_id'] = this.specializedId;
    data['lifestyle_disorder_id'] = this.lifestyleDisorderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? packageId;
  int? testId;

  Pivot({this.packageId, this.testId});

  Pivot.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    testId = json['test_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['test_id'] = this.testId;
    return data;
  }
}
