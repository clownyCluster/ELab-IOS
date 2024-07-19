class TestModel {
  int? status;
  String? message;
  Data? data;

  TestModel({this.status, this.message, this.data});

  TestModel.fromJson(Map<String, dynamic> json) {
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
  String? type;
  Null parentId;
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
  Faqs? faqs;
  String? interpretation;
  int? conditionId;
  int? specializedId;
  int? lifestyleDisorderId;
  String? createdAt;
  String? updatedAt;
  List<String>? params;
  List<Parameters>? parameters;

  Data(
      {this.id,
      this.type,
      this.parentId,
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
      this.params,
      this.parameters});

  Data.fromJson(Map<String, dynamic> json) {
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
    faqs = json['faqs'] != null ? new Faqs.fromJson(json['faqs']) : null;
    interpretation = json['interpretation'];
    conditionId = json['condition_id'];
    specializedId = json['specialized_id'];
    lifestyleDisorderId = json['lifestyle_disorder_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    params = json['params'].cast<String>();
    if (json['parameters'] != null) {
      parameters = <Parameters>[];
      json['parameters'].forEach((v) {
        parameters!.add(new Parameters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['parent_id'] = this.parentId;
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
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.toJson();
    }
    data['interpretation'] = this.interpretation;
    data['condition_id'] = this.conditionId;
    data['specialized_id'] = this.specializedId;
    data['lifestyle_disorder_id'] = this.lifestyleDisorderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['params'] = this.params;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faqs {
  List<String>? questions;
  List<String>? answers;

  Faqs({this.questions, this.answers});

  Faqs.fromJson(Map<String, dynamic> json) {
    questions = json['questions']?.cast<String>();
    answers = json['answers']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questions'] = this.questions;
    data['answers'] = this.answers;
    return data;
  }
}

class Parameters {
  int? id;
  String? type;
  int? parentId;
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
  Null? interpretation;
  int? conditionId;
  int? specializedId;
  int? lifestyleDisorderId;
  String? createdAt;
  String? updatedAt;

  Parameters(
      {this.id,
      this.type,
      this.parentId,
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
      this.updatedAt});

  Parameters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    parentId = json['parent_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['parent_id'] = this.parentId;
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
    return data;
  }
}
