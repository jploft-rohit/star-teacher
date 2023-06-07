class LeaveTypeResponse {
  dynamic statusCode;
  dynamic message;
  List<LeaveTypeData>? data;

  LeaveTypeResponse({this.statusCode, this.message, this.data});

  LeaveTypeResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaveTypeData>[];
      json['data'].forEach((v) {
        data!.add(new LeaveTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeaveTypeData {
  dynamic isDeleted;
  dynamic sId;
  dynamic language;
  dynamic name;

  LeaveTypeData({this.isDeleted, this.sId, this.language, this.name});

  LeaveTypeData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['name'] = this.name;
    return data;
  }
}
