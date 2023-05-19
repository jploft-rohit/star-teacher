class AllLostFoundResponse {
  dynamic statusCode;
  dynamic message;
  List<Data>? data;

  AllLostFoundResponse({this.statusCode, this.message, this.data});

  AllLostFoundResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
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
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic type;
  dynamic isDeleted;
  dynamic sId;
  dynamic title;
  dynamic date;
  dynamic location;
  dynamic school;
  dynamic document;
  dynamic user;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.type,
        this.isDeleted,
        this.sId,
        this.title,
        this.date,
        this.location,
        this.school,
        this.document,
        this.user,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    title = json['title'];
    date = json['date'];
    location = json['location'];
    school = json['school'];
    document = json['document'];
    user = json['user'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['date'] = this.date;
    data['location'] = this.location;
    data['school'] = this.school;
    data['document'] = this.document;
    data['user'] = this.user;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
