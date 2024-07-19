class BlogsModel {
  int? status;
  String? message;
  List<Data>? data;

  BlogsModel({this.status, this.message, this.data});

  BlogsModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? slug;
  String? image;
  String? content;
  String? createdBy;
  String? createdAt;

  Data(
      {this.title,
      this.slug,
      this.image,
      this.content,
      this.createdBy,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    content = json['content'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['content'] = this.content;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    return data;
  }
}