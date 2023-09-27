class HomeResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;

  HomeResponse({this.statusCode, this.message, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic performance;
  dynamic totalClassTaken;
  dynamic notificationCount;
  List<TodaySchedule>? todaySchedule;

  Data({this.notificationCount, this.performance, this.totalClassTaken, this.todaySchedule});

  Data.fromJson(Map<String, dynamic> json) {
    performance = json['performance'];
    totalClassTaken = json['totalClassTaken'];
    notificationCount = json['notificationCount'];
    if (json['todaySchedule'] != null) {
      todaySchedule = <TodaySchedule>[];
      json['todaySchedule'].forEach((v) { todaySchedule!.add(new TodaySchedule.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['performance'] = this.performance;
    data['totalClassTaken'] = this.totalClassTaken;
    data['notificationCount'] = this.notificationCount;
    if (this.todaySchedule != null) {
      data['todaySchedule'] = this.todaySchedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodaySchedule {
  List<String>? topics;
  dynamic isDeleted;
  dynamic sId;
  dynamic classType;
  School? school;
  Subject? subject;
  Batch? batch;
  Batch? classes;
  Section? section;
  SchoolStaff? schoolStaff;
  SchoolStaffUser? schoolStaffUser;
  dynamic date;
  dynamic startTime;
  dynamic startIn;
  dynamic endTime;
  dynamic startDateTimeStamp;
  dynamic endDateTimeStamp;
  dynamic day;
  dynamic status;
  dynamic completeDateTime;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic slot;

  TodaySchedule({this.startIn, this.topics, this.isDeleted, this.sId, this.classType, this.school, this.subject, this.batch, this.classes, this.section, this.schoolStaff, this.schoolStaffUser, this.date, this.startTime, this.endTime, this.startDateTimeStamp, this.endDateTimeStamp, this.day, this.status, this.completeDateTime, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.iV, this.slot});

  TodaySchedule.fromJson(Map<String, dynamic> json) {
  topics = json['topics'].cast<String>();
  isDeleted = json['isDeleted'];
  sId = json['_id'];
  startIn = json['startIn'];
  classType = json['classType'];
  school = json['school'] != null ? new School.fromJson(json['school']) : null;
  subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  batch = json['batch'] != null ? new Batch.fromJson(json['batch']) : null;
  classes = json['class'] != null ? new Batch.fromJson(json['class']) : null;
  section = json['section'] != null ? new Section.fromJson(json['section']) : null;
  schoolStaff = json['schoolStaff'] != null ? new SchoolStaff.fromJson(json['schoolStaff']) : null;
  schoolStaffUser = json['schoolStaffUser'] != null ? new SchoolStaffUser.fromJson(json['schoolStaffUser']) : null;
  date = json['date'];
  startTime = json['startTime'];
  endTime = json['endTime'];
  startDateTimeStamp = json['startDateTimeStamp'];
  endDateTimeStamp = json['endDateTimeStamp'];
  day = json['day'];
  status = json['status'];
  completeDateTime = json['completeDateTime'];
  createdBy = json['createdBy'];
  updatedBy = json['updatedBy'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['topics'] = this.topics;
  data['isDeleted'] = this.isDeleted;
  data['_id'] = this.sId;
  data['startIn'] = this.startIn;
  data['classType'] = this.classType;
  if (this.school != null) {
  data['school'] = this.school!.toJson();
  }
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  if (this.batch != null) {
  data['batch'] = this.batch!.toJson();
  }
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  if (this.section != null) {
  data['section'] = this.section!.toJson();
  }
  if (this.schoolStaff != null) {
  data['schoolStaff'] = this.schoolStaff!.toJson();
  }
  if (this.schoolStaffUser != null) {
  data['schoolStaffUser'] = this.schoolStaffUser!.toJson();
  }
  data['date'] = this.date;
  data['startTime'] = this.startTime;
  data['endTime'] = this.endTime;
  data['startDateTimeStamp'] = this.startDateTimeStamp;
  data['endDateTimeStamp'] = this.endDateTimeStamp;
  data['day'] = this.day;
  data['status'] = this.status;
  data['completeDateTime'] = this.completeDateTime;
  data['createdBy'] = this.createdBy;
  data['updatedBy'] = this.updatedBy;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
  data['slot'] = this.slot;
  return data;
  }
}

class School {
  Location? location;
  dynamic brouchure;
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
  dynamic user;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;
  dynamic rating;

  School({this.location, this.brouchure, this.isDeleted, this.sId, this.name, this.schoolCategory, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.schoolType, this.user, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy, this.rating});

  School.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    brouchure = json['brouchure'];
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
    user = json['user'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['brouchure'] = this.brouchure;
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
    data['user'] = this.user;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    data['rating'] = this.rating;
    return data;
  }
}

class Location {
  dynamic type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Subject {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  Subject({this.isDeleted, this.sId, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV});

  Subject.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
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
    data['isDeleted'] = this.isDeleted;
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

class Batch {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic school;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  Batch({this.isDeleted, this.sId, this.name, this.school, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  Batch.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
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
    data['isDeleted'] = this.isDeleted;
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

class Section {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic classes;
  dynamic school;
  dynamic roomNo;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  Section({this.isDeleted, this.sId, this.name, this.classes, this.school, this.roomNo, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  Section.fromJson(Map<String, dynamic> json) {
  isDeleted = json['isDeleted'];
  sId = json['_id'];
  name = json['name'];
  classes = json['class'];
  school = json['school'];
  roomNo = json['roomNo'];
  status = json['status'];
  createdBy = json['createdBy'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['isDeleted'] = this.isDeleted;
  data['_id'] = this.sId;
  data['name'] = this.name;
  data['class'] = this.classes;
  data['school'] = this.school;
  data['roomNo'] = this.roomNo;
  data['status'] = this.status;
  data['createdBy'] = this.createdBy;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
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
  dynamic iV;

  SchoolStaff({this.isDeleted, this.sId, this.user, this.school, this.role, this.dateOfEmployment, this.createdBy, this.updatedBy, this.designation, this.classPerWeek, this.employeeId, this.employmentCertificate, this.jobCertificate, this.jobGrade, this.jobTitle, this.salaryCertificate, this.slotNumber, this.slotType, this.studentGender, this.titleGrade, this.weekDays, this.createdAt, this.updatedAt, this.iV});

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
    iV = json['__v'];
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
    data['__v'] = this.iV;
    return data;
  }
}

class SchoolStaffUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic mobile;
  dynamic dob;
  dynamic nationality;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic profilePic;
  Role? role;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic address;
  dynamic country;
  dynamic email;
  dynamic status;
  dynamic state;
  dynamic alternativeMobile;
  dynamic sector;
  dynamic maritalStatus;

  SchoolStaffUser({this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.iV, this.otp, this.deviceToken, this.deviceVoip, this.address, this.country, this.email, this.status, this.state, this.alternativeMobile, this.sector, this.maritalStatus});

  SchoolStaffUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    dob = json['dob'];
    nationality = json['nationality'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    profilePic = json['profilePic'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    address = json['address'];
    country = json['country'];
    email = json['email'];
    status = json['status'];
    state = json['state'];
    alternativeMobile = json['alternativeMobile'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
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
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['nationality'] = this.nationality;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['profilePic'] = this.profilePic;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['address'] = this.address;
    data['country'] = this.country;
    data['email'] = this.email;
    data['status'] = this.status;
    data['state'] = this.state;
    data['alternativeMobile'] = this.alternativeMobile;
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
    return data;
  }
}

class Role {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic filterType;
  dynamic displayName;

  Role({this.isDeleted, this.sId, this.name, this.type, this.status, this.createdBy, this.createdAt, this.updatedAt, this.filterType, this.displayName});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    filterType = json['filterType'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['filterType'] = this.filterType;
    data['displayName'] = this.displayName;
    return data;
  }
}