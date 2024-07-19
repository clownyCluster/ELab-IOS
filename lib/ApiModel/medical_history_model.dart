class MedicalHistoryModel {
  int? status;
  String? message;
  List<Data>? data;

  MedicalHistoryModel({this.status, this.message, this.data});

  MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? reportName;
  String? billNo;
  String? date;
  String? slug;

  Data({this.reportName, this.billNo, this.date, this.slug});

  Data.fromJson(Map<String, dynamic> json) {
    reportName = json['report_name'];
    billNo = json['bill_no'];
    date = json['date'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['report_name'] = this.reportName;
    data['bill_no'] = this.billNo;
    data['date'] = this.date;
    data['slug'] = this.slug;
    return data;
  }
}
