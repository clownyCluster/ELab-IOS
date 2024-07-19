class AboutUsModel {
  int? status;
  String? message;
  Data? data;

  AboutUsModel({this.status, this.message, this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
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
  String? contentTitle;
  String? content;
  String? topImage1;
  String? topImage2;
  String? bottomImage;
  int? experience;
  String? extraTopic;
  String? extraContent;
  String? extraImage;
  String? missionTopic;
  String? missionContent;
  String? missionSubTopic;
  String? missionImage1;
  String? missionImage2;
  String? visionTopic;
  String? visionContent;
  String? visionSubTopic;
  String? visionImage1;
  String? visionImage2;
  String? valueTopic;
  String? valueContent;
  String? valueSubTopic;
  String? valueImage1;
  String? valueImage2;

  Data(
      {this.contentTitle,
      this.content,
      this.topImage1,
      this.topImage2,
      this.bottomImage,
      this.experience,
      this.extraTopic,
      this.extraContent,
      this.extraImage,
      this.missionTopic,
      this.missionContent,
      this.missionSubTopic,
      this.missionImage1,
      this.missionImage2,
      this.visionTopic,
      this.visionContent,
      this.visionSubTopic,
      this.visionImage1,
      this.visionImage2,
      this.valueTopic,
      this.valueContent,
      this.valueSubTopic,
      this.valueImage1,
      this.valueImage2});

  Data.fromJson(Map<String, dynamic> json) {
    contentTitle = json['content_title'];
    content = json['content'];
    topImage1 = json['top_image1'];
    topImage2 = json['top_image2'];
    bottomImage = json['bottom_image'];
    experience = json['experience'];
    extraTopic = json['extra_topic'];
    extraContent = json['extra_content'];
    extraImage = json['extra_image'];
    missionTopic = json['mission_topic'];
    missionContent = json['mission_content'];
    missionSubTopic = json['mission_subTopic'];
    missionImage1 = json['mission_image1'];
    missionImage2 = json['mission_image2'];
    visionTopic = json['vision_topic'];
    visionContent = json['vision_content'];
    visionSubTopic = json['vision_subTopic'];
    visionImage1 = json['vision_image1'];
    visionImage2 = json['vision_image2'];
    valueTopic = json['value_topic'];
    valueContent = json['value_content'];
    valueSubTopic = json['value_subTopic'];
    valueImage1 = json['value_image1'];
    valueImage2 = json['value_image2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_title'] = this.contentTitle;
    data['content'] = this.content;
    data['top_image1'] = this.topImage1;
    data['top_image2'] = this.topImage2;
    data['bottom_image'] = this.bottomImage;
    data['experience'] = this.experience;
    data['extra_topic'] = this.extraTopic;
    data['extra_content'] = this.extraContent;
    data['extra_image'] = this.extraImage;
    data['mission_topic'] = this.missionTopic;
    data['mission_content'] = this.missionContent;
    data['mission_subTopic'] = this.missionSubTopic;
    data['mission_image1'] = this.missionImage1;
    data['mission_image2'] = this.missionImage2;
    data['vision_topic'] = this.visionTopic;
    data['vision_content'] = this.visionContent;
    data['vision_subTopic'] = this.visionSubTopic;
    data['vision_image1'] = this.visionImage1;
    data['vision_image2'] = this.visionImage2;
    data['value_topic'] = this.valueTopic;
    data['value_content'] = this.valueContent;
    data['value_subTopic'] = this.valueSubTopic;
    data['value_image1'] = this.valueImage1;
    data['value_image2'] = this.valueImage2;
    return data;
  }
}