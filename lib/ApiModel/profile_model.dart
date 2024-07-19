class ProfileModel {
  int? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? contact;
  String? dob;
  String? gender;
  String? homeAddress;
  String? workAddress;
  String? profilePic;

  Data(
      {this.name,
      this.email,
      this.contact,
      this.dob,
      this.gender,
      this.homeAddress,
      this.workAddress,
      this.profilePic});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    dob = json['dob'];
    gender = json['gender'];
    homeAddress = json['home_address'];
    workAddress = json['work_address'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['home_address'] = this.homeAddress;
    data['work_address'] = this.workAddress;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}
