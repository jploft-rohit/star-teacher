class UpdateComplaintReportsResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;

  UpdateComplaintReportsResponse({this.statusCode, this.message, this.data});

  UpdateComplaintReportsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic forEnquery;
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic complaintUser;
  dynamic complaintType;
  dynamic title;
  dynamic description;
  dynamic document;
  dynamic user;
  dynamic student;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.forEnquery,
        this.isDeleted,
        this.sId,
        this.school,
        this.complaintUser,
        this.complaintType,
        this.title,
        this.description,
        this.document,
        this.user,
        this.student,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    forEnquery = json['forEnquery'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    complaintUser = json['complaintUser'];
    complaintType = json['complaintType'];
    title = json['title'];
    description = json['description'];
    document = json['document'];
    user = json['user'];
    student = json['student'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forEnquery'] = this.forEnquery;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['complaintUser'] = this.complaintUser;
    data['complaintType'] = this.complaintType;
    data['title'] = this.title;
    data['description'] = this.description;
    data['document'] = this.document;
    data['user'] = this.user;
    data['student'] = this.student;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}