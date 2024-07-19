// class CustomerDetails {
//   int? status;
//   String? message;
//   List<Data>? data;

//   CustomerDetails({this.status, this.message, this.data});

//   CustomerDetails.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? contact;
//   String? dob;
//   String? gender;
//   String? homeAddress;
//   String? workAddress;
//   int? userId;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.contact,
//       this.dob,
//       this.gender,
//       this.homeAddress,
//       this.workAddress,
//       this.userId,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     contact = json['contact'];
//     dob = json['dob'];
//     gender = json['gender'];
//     homeAddress = json['home_address'];
//     workAddress = json['work_address'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['contact'] = this.contact;
//     data['dob'] = this.dob;
//     data['gender'] = this.gender;
//     data['home_address'] = this.homeAddress;
//     data['work_address'] = this.workAddress;
//     data['user_id'] = this.userId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }