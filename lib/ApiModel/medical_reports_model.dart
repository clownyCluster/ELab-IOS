class MedicalReportsModel {
  int? status;
  String? message;
  String? reportName;
  String? billNo;
  String? referredBy;
  String? date;
  List<Parameters>? parameters;

  MedicalReportsModel(
      {this.status,
      this.message,
      this.reportName,
      this.billNo,
      this.referredBy,
      this.date,
      this.parameters});

  MedicalReportsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    reportName = json['report_name'];
    billNo = json['bill_no'];
    referredBy = json['referred_by'];
    date = json['date'];
    if (json['parameters'] != null) {
      parameters = <Parameters>[];
      json['parameters'].forEach((v) {
        parameters!.add(new Parameters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['report_name'] = this.reportName;
    data['bill_no'] = this.billNo;
    data['referred_by'] = this.referredBy;
    data['date'] = this.date;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? parameterName;
  List<Children>? children;

  Parameters({this.parameterName, this.children});

  Parameters.fromJson(Map<String, dynamic> json) {
    parameterName = json['parameter_name'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parameter_name'] = this.parameterName;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  String? parameterName;
  String? parameterUnit;
  String? parameterRange;
  String? value;
  List<Childrens>? childrens;

  Children(
      {this.parameterName,
      this.parameterUnit,
      this.parameterRange,
      this.value,
      this.childrens});

  Children.fromJson(Map<String, dynamic> json) {
    parameterName = json['parameter_name'];
    parameterUnit = json['parameter_unit'];
    parameterRange = json['parameter_range'];
    value = json['value'];
    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(new Childrens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parameter_name'] = this.parameterName;
    data['parameter_unit'] = this.parameterUnit;
    data['parameter_range'] = this.parameterRange;
    data['value'] = this.value;
    if (this.childrens != null) {
      data['childrens'] = this.childrens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childrens {
  String? parameterName;
  String? parameterUnit;
  String? parameterRange;
  String? value;

  Childrens(
      {this.parameterName,
      this.parameterUnit,
      this.parameterRange,
      this.value});

  Childrens.fromJson(Map<String, dynamic> json) {
    parameterName = json['parameter_name'];
    parameterUnit = json['parameter_unit'];
    parameterRange = json['parameter_range'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parameter_name'] = this.parameterName;
    data['parameter_unit'] = this.parameterUnit;
    data['parameter_range'] = this.parameterRange;
    data['value'] = this.value;
    return data;
  }
}
