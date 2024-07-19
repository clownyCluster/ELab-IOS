class ExtraInfo {
  int? status;
  String? message;
  Data? data;

  ExtraInfo({this.status, this.message, this.data});

  ExtraInfo.fromJson(Map<String, dynamic> json) {
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
  String? logo;
  String? email;
  String? facebookUrl;
  String? twitterUrl;
  String? instagramUrl;
  String? linkedInUrl;
  String? phone;
  String? mobile;
  String? whatsApp;
  String? viber;
  String? address;
  String? googlemap;
  String? timeSchedule;

  Data(
      {this.logo,
      this.email,
      this.facebookUrl,
      this.twitterUrl,
      this.instagramUrl,
      this.linkedInUrl,
      this.phone,
      this.mobile,
      this.whatsApp,
      this.viber,
      this.address,
      this.googlemap,
      this.timeSchedule});

  Data.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    email = json['email'];
    facebookUrl = json['facebook_url'];
    twitterUrl = json['twitter_url'];
    instagramUrl = json['instagram_url'];
    linkedInUrl = json['linkedIn_url'];
    phone = json['phone'];
    mobile = json['mobile'];
    whatsApp = json['whatsApp'];
    viber = json['viber'];
    address = json['address'];
    googlemap = json['googlemap'];
    timeSchedule = json['time_schedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['email'] = this.email;
    data['facebook_url'] = this.facebookUrl;
    data['twitter_url'] = this.twitterUrl;
    data['instagram_url'] = this.instagramUrl;
    data['linkedIn_url'] = this.linkedInUrl;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['whatsApp'] = this.whatsApp;
    data['viber'] = this.viber;
    data['address'] = this.address;
    data['googlemap'] = this.googlemap;
    data['time_schedule'] = this.timeSchedule;
    return data;
  }
}
