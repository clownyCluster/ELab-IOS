

// class ReportModel {
//   int? status;
//   String? message;
//   List<Data>? data;

//   ReportModel({this.status, this.message, this.data});

//   ReportModel.fromJson(Map<String, dynamic> json) {
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
//   String? id;
//   String? orderDate;
//   List<String>? packageName;
//   String? status;
//   String? report;

//   Data({this.id, this.orderDate, this.packageName, this.status, this.report});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     orderDate = json['order_date'];
//     packageName = json['package_name'].cast<String>();
//     status = json['status'];
//     report = json['report'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['order_date'] = this.orderDate;
//     data['package_name'] = this.packageName;
//     data['status'] = this.status;
//     data['report'] = this.report;
//     return data;
//   }
// }



class ReportModel {
  int? status;
  String? message;
  List<Data>? data;

  ReportModel({this.status, this.message, this.data});

  ReportModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? orderDate;
  List<String>? packageName;
  String? status;
  String? report;

  Data({this.id, this.orderDate, this.packageName, this.status, this.report});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['order_date'];
    packageName = json['package_name'].cast<String>();
    status = json['status'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_date'] = this.orderDate;
    data['package_name'] = this.packageName;
    data['status'] = this.status;
    data['report'] = this.report;
    return data;
  }
}
