class ExamTimeTableResponse {
  List<ExamTimeTableData>? data;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  ExamTimeTableResponse({this.data, this.success, this.statusCode, this.message});

  ExamTimeTableResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExamTimeTableData>[];
      json['data'].forEach((v) { data!.add(new ExamTimeTableData.fromJson(v)); });
    }
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class ExamTimeTableData {
  dynamic sId;
  Exam? exam;
  dynamic instructions;
  Subject? subject;
  Exam? classes;
  dynamic schoolStaff;
  dynamic schoolStaffUser;
  dynamic date;
  dynamic startTime;
  dynamic endTime;
  dynamic startDateTimeStamp;
  dynamic endDateTimeStamp;
  dynamic status;
  CreatedBy? createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic classRoomNo;

  ExamTimeTableData({this.sId, this.exam, this.instructions, this.subject, this.classes, this.schoolStaff, this.schoolStaffUser, this.date, this.startTime, this.endTime, this.startDateTimeStamp, this.endDateTimeStamp, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV});

  ExamTimeTableData.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
  instructions = json['instructions'];
  subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  classes = json['class'] != null ? new Exam.fromJson(json['class']) : null;
  schoolStaff = json['schoolStaff'];
  schoolStaffUser = json['schoolStaffUser'];
  date = json['date'];
  classRoomNo = json['classRoomNo'];
  startTime = json['startTime'];
  endTime = json['endTime'];
  startDateTimeStamp = json['startDateTimeStamp'];
  endDateTimeStamp = json['endDateTimeStamp'];
  status = json['status'];
  createdBy = json['createdBy'] != null ? new CreatedBy.fromJson(json['createdBy']) : null;
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  if (this.exam != null) {
  data['exam'] = this.exam!.toJson();
  }
  data['classRoomNo'] = this.classRoomNo;
  data['instructions'] = this.instructions;
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  data['schoolStaff'] = this.schoolStaff;
  data['schoolStaffUser'] = this.schoolStaffUser;
  data['date'] = this.date;
  data['startTime'] = this.startTime;
  data['endTime'] = this.endTime;
  data['startDateTimeStamp'] = this.startDateTimeStamp;
  data['endDateTimeStamp'] = this.endDateTimeStamp;
  data['status'] = this.status;
  if (this.createdBy != null) {
  data['createdBy'] = this.createdBy!.toJson();
  }
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
  return data;
  }
}

class Exam {
  dynamic sId;
  dynamic name;
  dynamic school;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  Exam({this.sId, this.name, this.school, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  Exam.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    school = json['school'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['school'] = this.school;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Subject {
  dynamic sId;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  Subject({this.sId, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV});

  Subject.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CreatedBy {
  dynamic sId;
  dynamic gender;
  dynamic isMobileVerified;
  dynamic idDocument;
  dynamic parentId;
  dynamic name;
  dynamic email;
  dynamic role;
  dynamic password;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;
  dynamic profilePic;

  CreatedBy({this.sId, this.gender, this.isMobileVerified, this.idDocument, this.parentId, this.name, this.email, this.role, this.password, this.createdAt, this.updatedAt, this.iV, this.updatedBy, this.profilePic});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    gender = json['gender'];
    isMobileVerified = json['isMobileVerified'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['gender'] = this.gender;
    data['isMobileVerified'] = this.isMobileVerified;
    if (this.idDocument != null) {
      data['idDocument'] = this.idDocument!.map((v) => v.toJson()).toList();
    }
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    data['profilePic'] = this.profilePic;
    return data;
  }
}