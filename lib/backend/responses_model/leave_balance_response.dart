class LeaveBalanceResponse {
  int? statusCode;
  String? message;
  List<LeaveBalanceData>? data;

  LeaveBalanceResponse({this.statusCode, this.message, this.data});

  LeaveBalanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaveBalanceData>[];
      json['data'].forEach((v) {
        data!.add(new LeaveBalanceData.fromJson(v));
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

class LeaveBalanceData {
  bool? isDeleted;
  String? sId;
  String? user;
  LeaveType? leaveType;
  String? allocated;
  String? remaining;
  String? updatedAt;

  LeaveBalanceData(
      {this.isDeleted,
        this.sId,
        this.user,
        this.leaveType,
        this.allocated,
        this.remaining,
        this.updatedAt});

  LeaveBalanceData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    user = json['user'];
    leaveType = json['leaveType'] != null
        ? new LeaveType.fromJson(json['leaveType'])
        : null;
    allocated = json['allocated'];
    remaining = json['remaining'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.leaveType != null) {
      data['leaveType'] = this.leaveType!.toJson();
    }
    data['allocated'] = this.allocated;
    data['remaining'] = this.remaining;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class LeaveType {
  bool? isDeleted;
  String? sId;
  String? language;
  String? name;
  String? description;

  LeaveType(
      {this.isDeleted, this.sId, this.language, this.name, this.description});

  LeaveType.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
