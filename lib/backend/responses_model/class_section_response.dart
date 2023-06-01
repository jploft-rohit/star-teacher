class ClassSectionResponse {
  Data? data;
  dynamic success;
  dynamic statusCode;
  dynamic message;

  ClassSectionResponse({this.data, this.success, this.statusCode, this.message});

  ClassSectionResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<ClassSectionData>? data;
  Pagination? pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClassSectionData>[];
      json['data'].forEach((v) { data!.add(new ClassSectionData.fromJson(v)); });
    }
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class ClassSectionData {
  dynamic sId;
  School? school;
  School? classes;
  dynamic name;
  dynamic roomNo;
  School? status;
  School? createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  List<Trans>? trans;

  ClassSectionData({this.sId, this.school, this.classes, this.name, this.roomNo, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.trans});

  ClassSectionData.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  school = json['school'] != null ? new School.fromJson(json['school']) : null;
  classes = json['class'] != null ? new School.fromJson(json['class']) : null;
  name = json['name'];
  roomNo = json['roomNo'];
  status = json['status'] != null ? new School.fromJson(json['status']) : null;
  createdBy = json['createdBy'] != null ? new School.fromJson(json['createdBy']) : null;
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  if (json['trans'] != null) {
  trans = <Trans>[];
  json['trans'].forEach((v) { trans!.add(new Trans.fromJson(v)); });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  if (this.school != null) {
  data['school'] = this.school!.toJson();
  }
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  data['name'] = this.name;
  data['roomNo'] = this.roomNo;
  if (this.status != null) {
  data['status'] = this.status!.toJson();
  }
  if (this.createdBy != null) {
  data['createdBy'] = this.createdBy!.toJson();
  }
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
  if (this.trans != null) {
  data['trans'] = this.trans!.map((v) => v.toJson()).toList();
  }
  return data;
  }
}

class School {
  dynamic sId;
  dynamic name;

  School({this.sId, this.name});

  School.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Trans {
  dynamic sId;
  dynamic name;
  dynamic language;
  dynamic school;
  dynamic classes;
  dynamic roomNo;
  dynamic classSection;
  dynamic iV;

  Trans({this.sId, this.name, this.language, this.school, this.classes, this.roomNo, this.classSection, this.iV});

  Trans.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  name = json['name'];
  language = json['language'];
  school = json['school'];
  classes = json['class'];
  roomNo = json['roomNo'];
  classSection = json['classSection'];
  iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  data['name'] = this.name;
  data['language'] = this.language;
  data['school'] = this.school;
  data['class'] = this.classes;
  data['roomNo'] = this.roomNo;
  data['classSection'] = this.classSection;
  data['__v'] = this.iV;
  return data;
  }
}

class Pagination {
  dynamic totalCount;
  dynamic totalPages;
  dynamic currentPage;
  dynamic nextPage;
  dynamic prevPage;

  Pagination({this.totalCount, this.totalPages, this.currentPage, this.nextPage, this.prevPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}