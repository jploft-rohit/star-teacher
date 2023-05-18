class StarAttendanceListResponse {
  dynamic statusCode;
  dynamic message;
  List<StarAttendanceData>? data;
  Pagination? pagination;

  StarAttendanceListResponse({this.statusCode, this.message, this.data, this.pagination});

  StarAttendanceListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StarAttendanceData>[];
      json['data'].forEach((v) { data!.add(new StarAttendanceData.fromJson(v)); });
    }
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class StarAttendanceData {
  dynamic type;
  dynamic attendanceType;
  dynamic present;
  dynamic sId;
  School? school;
  dynamic batch;
  Class? classes;
  dynamic section;
  SchoolStaff? schoolStaff;
  Student? student;
  dynamic date;
  dynamic time;
  dynamic document;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic reason;

  StarAttendanceData({this.type, this.attendanceType, this.present, this.sId, this.school, this.batch, this.classes, this.section, this.schoolStaff, this.student, this.date, this.time, this.document, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.reason});

  StarAttendanceData.fromJson(Map<String, dynamic> json) {
  type = json['type'];
  attendanceType = json['attendanceType'];
  present = json['present'];
  sId = json['_id'];
  school = json['school'] != null ? new School.fromJson(json['school']) : null;
  batch = json['batch'];
  classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
  section = json['section'];
  schoolStaff = json['schoolStaff'] != null ? new SchoolStaff.fromJson(json['schoolStaff']) : null;
  student = json['student'] != null ? new Student.fromJson(json['student']) : null;
  date = json['date'];
  time = json['time'];
  document = json['document'];
  createdBy = json['createdBy'];
  updatedBy = json['updatedBy'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['type'] = this.type;
  data['attendanceType'] = this.attendanceType;
  data['present'] = this.present;
  data['_id'] = this.sId;
  if (this.school != null) {
  data['school'] = this.school!.toJson();
  }
  data['batch'] = this.batch;
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  data['section'] = this.section;
  if (this.schoolStaff != null) {
  data['schoolStaff'] = this.schoolStaff!.toJson();
  }
  if (this.student != null) {
  data['student'] = this.student!.toJson();
  }
  data['date'] = this.date;
  data['time'] = this.time;
  data['document'] = this.document;
  data['createdBy'] = this.createdBy;
  data['updatedBy'] = this.updatedBy;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['reason'] = this.reason;
  return data;
  }
}

class School {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic schoolCategory;
  dynamic schoolSector;
  dynamic schoolArea;
  dynamic address;
  dynamic language;
  dynamic schoolId;
  dynamic helplineNo;
  dynamic email;
  dynamic secondoryEmail;
  dynamic website;
  dynamic mobile;
  dynamic schoolType;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  Location? location;
  dynamic user;
  dynamic updatedBy;
  dynamic rating;

  School({this.isDeleted, this.sId, this.name, this.schoolCategory, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.schoolType, this.status, this.createdBy, this.createdAt, this.updatedAt, this.location, this.user, this.updatedBy, this.rating});

  School.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    schoolCategory = json['schoolCategory'];
    schoolSector = json['schoolSector'];
    schoolArea = json['schoolArea'];
    address = json['address'];
    language = json['language'];
    schoolId = json['schoolId'];
    helplineNo = json['helplineNo'];
    email = json['email'];
    secondoryEmail = json['secondoryEmail'];
    website = json['website'];
    mobile = json['mobile'];
    schoolType = json['schoolType'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    user = json['user'];
    updatedBy = json['updatedBy'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['schoolCategory'] = this.schoolCategory;
    data['schoolSector'] = this.schoolSector;
    data['schoolArea'] = this.schoolArea;
    data['address'] = this.address;
    data['language'] = this.language;
    data['schoolId'] = this.schoolId;
    data['helplineNo'] = this.helplineNo;
    data['email'] = this.email;
    data['secondoryEmail'] = this.secondoryEmail;
    data['website'] = this.website;
    data['mobile'] = this.mobile;
    data['schoolType'] = this.schoolType;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['user'] = this.user;
    data['updatedBy'] = this.updatedBy;
    data['rating'] = this.rating;
    return data;
  }
}

class Location {
  dynamic type;
  dynamic coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Class {
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic updatedBy;

  Class({this.isDeleted, this.sId, this.school, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.updatedBy});

  Class.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class SchoolStaff {
  dynamic isDeleted;
  dynamic sId;
  dynamic user;
  dynamic school;
  dynamic role;
  dynamic dateOfEmployment;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic designation;
  dynamic classPerWeek;
  dynamic employeeId;
  dynamic employmentCertificate;
  dynamic jobCertificate;
  dynamic jobGrade;
  dynamic jobTitle;
  dynamic salaryCertificate;
  dynamic slotNumber;
  dynamic slotType;
  dynamic studentGender;
  dynamic titleGrade;
  dynamic weekDays;
  dynamic createdAt;
  dynamic updatedAt;

  SchoolStaff({this.isDeleted, this.sId, this.user, this.school, this.role, this.dateOfEmployment, this.createdBy, this.updatedBy, this.designation, this.classPerWeek, this.employeeId, this.employmentCertificate, this.jobCertificate, this.jobGrade, this.jobTitle, this.salaryCertificate, this.slotNumber, this.slotType, this.studentGender, this.titleGrade, this.weekDays, this.createdAt, this.updatedAt});

  SchoolStaff.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    user = json['user'];
    school = json['school'];
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    designation = json['designation'];
    classPerWeek = json['classPerWeek'];
    employeeId = json['employeeId'];
    employmentCertificate = json['employmentCertificate'];
    jobCertificate = json['jobCertificate'];
    jobGrade = json['jobGrade'];
    jobTitle = json['jobTitle'];
    salaryCertificate = json['salaryCertificate'];
    slotNumber = json['slotNumber'];
    slotType = json['slotType'];
    studentGender = json['studentGender'];
    titleGrade = json['titleGrade'];
    weekDays = json['weekDays'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['school'] = this.school;
    data['role'] = this.role;
    data['dateOfEmployment'] = this.dateOfEmployment;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['designation'] = this.designation;
    data['classPerWeek'] = this.classPerWeek;
    data['employeeId'] = this.employeeId;
    data['employmentCertificate'] = this.employmentCertificate;
    data['jobCertificate'] = this.jobCertificate;
    data['jobGrade'] = this.jobGrade;
    data['jobTitle'] = this.jobTitle;
    data['salaryCertificate'] = this.salaryCertificate;
    data['slotNumber'] = this.slotNumber;
    data['slotType'] = this.slotType;
    data['studentGender'] = this.studentGender;
    data['titleGrade'] = this.titleGrade;
    data['weekDays'] = this.weekDays;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Student {
  dynamic isDeleted;
  dynamic sId;
  dynamic language;
  User? user;
  dynamic school;
  dynamic classes;
  dynamic section;
  dynamic batch;
  dynamic studentId;
  dynamic updatedAt;
  dynamic updatedBy;

  Student({this.isDeleted, this.sId, this.language, this.user, this.school, this.classes, this.section, this.batch, this.studentId, this.updatedAt, this.updatedBy});

  Student.fromJson(Map<String, dynamic> json) {
  isDeleted = json['isDeleted'];
  sId = json['_id'];
  language = json['language'];
  user = json['user'] != null ? new User.fromJson(json['user']) : null;
  school = json['school'];
  classes = json['class'];
  section = json['section'];
  batch = json['batch'];
  studentId = json['studentId'];
  updatedAt = json['updatedAt'];
  updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['isDeleted'] = this.isDeleted;
  data['_id'] = this.sId;
  data['language'] = this.language;
  if (this.user != null) {
  data['user'] = this.user!.toJson();
  }
  data['school'] = this.school;
  data['class'] = this.classes;
  data['section'] = this.section;
  data['batch'] = this.batch;
  data['studentId'] = this.studentId;
  data['updatedAt'] = this.updatedAt;
  data['updatedBy'] = this.updatedBy;
  return data;
  }
}

class User {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic sId;
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
  dynamic profilePic;
  dynamic barcode;
  dynamic bloodType;
  dynamic dailyLimit;

  User({this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.sId, this.name, this.email, this.mobile, this.role, this.dob, this.emirateId, this.emirateIdExpire, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.profilePic, this.barcode, this.bloodType, this.dailyLimit});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
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
    profilePic = json['profilePic'];
    barcode = json['barcode'];
    bloodType = json['bloodType'];
    dailyLimit = json['dailyLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
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
    data['profilePic'] = this.profilePic;
    data['barcode'] = this.barcode;
    data['bloodType'] = this.bloodType;
    data['dailyLimit'] = this.dailyLimit;
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