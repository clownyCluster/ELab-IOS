class CovideModel {
  int? status;
  String? message;
  Data? data;

  CovideModel({this.status, this.message, this.data});

  CovideModel.fromJson(Map<String, dynamic> json) {
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
  String? content;
  String? documentsRequired;
  List<Faqs>? faqs;
  List<Specialities>? specialities;
  String? otherContent;
  String? createdAt;

  Data(
      {this.id,
      this.name,
      this.content,
      this.documentsRequired,
      this.faqs,
      this.specialities,
      this.otherContent,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    documentsRequired = json['documents_required'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
    if (json['specialities'] != null) {
      specialities = <Specialities>[];
      json['specialities'].forEach((v) {
        specialities!.add(new Specialities.fromJson(v));
      });
    }
    otherContent = json['other_content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['documents_required'] = this.documentsRequired;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    if (this.specialities != null) {
      data['specialities'] = this.specialities!.map((v) => v.toJson()).toList();
    }
    data['other_content'] = this.otherContent;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Faqs {
  String? questions;
  String? answers;

  Faqs({this.questions, this.answers});

  Faqs.fromJson(Map<String, dynamic> json) {
    questions = json['questions'];
    answers = json['answers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questions'] = this.questions;
    data['answers'] = this.answers;
    return data;
  }
}

class Specialities {
  String? title;
  String? content;

  Specialities({this.title, this.content});

  Specialities.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
