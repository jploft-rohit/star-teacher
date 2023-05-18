class NoteBookListResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;
  Pagination? pagination;

  NoteBookListResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  NoteBookListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  StarData? starData;
  List<NotebookList>? notebookList;

  Data({this.starData, this.notebookList});

  Data.fromJson(Map<String, dynamic> json) {
    starData = json['starData'] != null
        ? new StarData.fromJson(json['starData'])
        : null;
    if (json['notebookList'] != null) {
      notebookList = <NotebookList>[];
      json['notebookList'].forEach((v) {
        notebookList!.add(new NotebookList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.starData != null) {
      data['starData'] = this.starData!.toJson();
    }
    if (this.notebookList != null) {
      data['notebookList'] = this.notebookList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StarData {
  dynamic sId;
  dynamic language;
  dynamic school;
  Class? classes;
  dynamic section;
  dynamic batch;
  dynamic studentId;
  dynamic isDeleted;
  User? user;
  Classsection? classsection;
  dynamic barcode;

  StarData(
      {this.sId,
      this.language,
      this.school,
      this.classes,
      this.section,
      this.batch,
      this.studentId,
      this.isDeleted,
      this.user,
      this.classsection,
      this.barcode});

  StarData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    school = json['school'];
    classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
    section = json['section'];
    batch = json['batch'];
    studentId = json['studentId'];
    isDeleted = json['isDeleted'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    classsection = json['classsection'] != null
        ? new Classsection.fromJson(json['classsection'])
        : null;
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['school'] = this.school;
    if (this.classes != null) {
      data['class'] = this.classes!.toJson();
    }
    data['section'] = this.section;
    data['batch'] = this.batch;
    data['studentId'] = this.studentId;
    data['isDeleted'] = this.isDeleted;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.classsection != null) {
      data['classsection'] = this.classsection!.toJson();
    }
    data['barcode'] = this.barcode;
    return data;
  }
}

class Class {
  dynamic sId;
  dynamic school;
  dynamic name;

  Class({this.sId, this.school, this.name});

  Class.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['name'] = this.name;
    return data;
  }
}

class User {
  dynamic sId;
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic parentId;
  dynamic isDeleted;
  dynamic name;
  dynamic email;
  dynamic mobile;
  dynamic role;
  dynamic dob;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic profilePic;

  User(
      {this.sId,
      this.isMobileVerified,
      this.gender,
      this.idDocument,
      this.parentId,
      this.isDeleted,
      this.name,
      this.email,
      this.mobile,
      this.role,
      this.dob,
      this.emirateId,
      this.emirateIdExpire,
      this.createdBy,
      this.updatedBy,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
    dob = json['dob'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['dob'] = this.dob;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['profilePic'] = this.profilePic;
    return data;
  }
}

class Classsection {
  dynamic sId;
  dynamic school;
  dynamic classes;
  dynamic name;
  dynamic roomNo;
  dynamic status;

  Classsection(
      {this.sId,
      this.school,
      this.classes,
      this.name,
      this.roomNo,
      this.status});

  Classsection.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school = json['school'];
    classes = json['class'];
    name = json['name'];
    roomNo = json['roomNo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['class'] = this.classes;
    data['name'] = this.name;
    data['roomNo'] = this.roomNo;
    data['status'] = this.status;
    return data;
  }
}

class NotebookList {
  dynamic sId;
  dynamic type;
  dynamic title;
  Class? classes;
  dynamic date;
  dynamic description;
  dynamic teacher;
  Subject? subject;
  dynamic comment;
  dynamic recommandation;
  dynamic status;
  dynamic isDeleted;
  User? user;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  NotebookList(
      {this.sId,
      this.type,
      this.title,
      this.classes,
      this.date,
      this.description,
      this.teacher,
      this.subject,
      this.comment,
      this.recommandation,
      this.status,
      this.isDeleted,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NotebookList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    title = json['title'];
    classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
    date = json['date'];
    description = json['description'];
    teacher = json['teacher'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    comment = json['comment'];
    recommandation = json['recommandation'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['title'] = this.title;
    if (this.classes != null) {
      data['class'] = this.classes!.toJson();
    }
    data['date'] = this.date;
    data['description'] = this.description;
    data['teacher'] = this.teacher;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    data['comment'] = this.comment;
    data['recommandation'] = this.recommandation;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Subject {
  dynamic sId;
  dynamic language;
  dynamic name;
  dynamic status;

  Subject({this.sId, this.language, this.name, this.status});

  Subject.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}

class Pagination {
  dynamic totalCount;
  dynamic totalPages;
  dynamic currentPage;
  dynamic nextPage;
  dynamic prevPage;

  Pagination(
      {this.totalCount,
      this.totalPages,
      this.currentPage,
      this.nextPage,
      this.prevPage});

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
