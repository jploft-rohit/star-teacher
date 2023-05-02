class MyProfileResponse {
  int? statusCode;
  String? message;
  Data? data;

  MyProfileResponse({this.statusCode, this.message, this.data});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  List<String>? parentId;
  bool? isDeleted;
  String? name;
  String? mobile;
  String? dob;
  String? nationality;
  String? emirateId;
  String? emirateIdExpire;
  String? nativeLanguage;
  String? religion;
  String? profilePic;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  String? deviceToken;
  String? deviceVoip;
  List<SchoolStaff>? schoolStaff;
  List<String>? familyMembers;
  String? alternativeMobile;
  int? profileCompletePercentage;
  String? profileCompleteDate;
  String? barcode;
  SchoolStaff? jobDetails;
  Statistics? statistics;

  Data({this.sId, this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.iV, this.otp, this.deviceToken, this.deviceVoip, this.schoolStaff, this.familyMembers, this.alternativeMobile, this.profileCompletePercentage, this.profileCompleteDate, this.barcode, this.jobDetails, this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
    isDeleted = json['isDeleted'];
    name = json['name'];
    mobile = json['mobile'];
    dob = json['dob'];
    nationality = json['nationality'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    profilePic = json['profilePic'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    if (json['schoolStaff'] != null) {
      schoolStaff = <SchoolStaff>[];
      json['schoolStaff'].forEach((v) { schoolStaff!.add(new SchoolStaff.fromJson(v)); });
    }
    familyMembers = json['familyMembers'].cast<String>();
    alternativeMobile = json['alternativeMobile'];
    profileCompletePercentage = json['profileCompletePercentage'];
    profileCompleteDate = json['profileCompleteDate'];
    barcode = json['barcode'];
    jobDetails = json['jobDetails'] != null ? new SchoolStaff.fromJson(json['jobDetails']) : null;
    statistics = json['statistics'] != null ? new Statistics.fromJson(json['statistics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['nationality'] = this.nationality;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    if (this.schoolStaff != null) {
      data['schoolStaff'] = this.schoolStaff!.map((v) => v.toJson()).toList();
    }
    data['familyMembers'] = this.familyMembers;
    data['alternativeMobile'] = this.alternativeMobile;
    data['profileCompletePercentage'] = this.profileCompletePercentage;
    data['profileCompleteDate'] = this.profileCompleteDate;
    data['barcode'] = this.barcode;
    if (this.jobDetails != null) {
      data['jobDetails'] = this.jobDetails!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class SchoolStaff {
  String? sId;
  bool? isDeleted;
  String? user;
  School? school;
  String? role;
  String? dateOfEmployment;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SchoolStaff({this.sId, this.isDeleted, this.user, this.school, this.role, this.dateOfEmployment, this.createdAt, this.updatedAt, this.iV});

  SchoolStaff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['role'] = this.role;
    data['dateOfEmployment'] = this.dateOfEmployment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class School {
  String? sId;
  bool? isDeleted;
  String? name;
  String? schoolCategory;
  String? schoolSector;
  String? schoolArea;
  String? address;
  String? language;
  String? schoolId;
  String? status;
  int? helplineNo;
  String? email;
  String? secondoryEmail;
  String? website;
  int? mobile;
  String? parentSchool;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;
  Staffsubjects? staffsubjects;
  Location? location;

  School({this.sId, this.isDeleted, this.name, this.schoolCategory, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.status, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.parentSchool, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy, this.staffsubjects, this.location});

  School.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    schoolCategory = json['schoolCategory'];
    schoolSector = json['schoolSector'];
    schoolArea = json['schoolArea'];
    address = json['address'];
    language = json['language'];
    schoolId = json['schoolId'];
    status = json['status'];
    helplineNo = json['helplineNo'];
    email = json['email'];
    secondoryEmail = json['secondoryEmail'];
    website = json['website'];
    mobile = json['mobile'];
    parentSchool = json['parentSchool'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
    staffsubjects = json['staffsubjects'] != null ? new Staffsubjects.fromJson(json['staffsubjects']) : null;
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['schoolCategory'] = this.schoolCategory;
    data['schoolSector'] = this.schoolSector;
    data['schoolArea'] = this.schoolArea;
    data['address'] = this.address;
    data['language'] = this.language;
    data['schoolId'] = this.schoolId;
    data['status'] = this.status;
    data['helplineNo'] = this.helplineNo;
    data['email'] = this.email;
    data['secondoryEmail'] = this.secondoryEmail;
    data['website'] = this.website;
    data['mobile'] = this.mobile;
    data['parentSchool'] = this.parentSchool;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    if (this.staffsubjects != null) {
      data['staffsubjects'] = this.staffsubjects!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Staffsubjects {
  String? sId;
  String? school;
  String? schoolStaff;
  List<Class>? classes;
  List<ClassSection>? classSection;
  Subject? subject;

  Staffsubjects({this.sId, this.school, this.schoolStaff, this.classes, this.classSection, this.subject});

  Staffsubjects.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  school = json['school'];
  schoolStaff = json['schoolStaff'];
  if (json['class'] != null) {
  classes = <Class>[];
  json['class'].forEach((v) { classes!.add(new Class.fromJson(v)); });
  }
  if (json['classSection'] != null) {
  classSection = <ClassSection>[];
  json['classSection'].forEach((v) { classSection!.add(new ClassSection.fromJson(v)); });
  }
  subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  data['school'] = this.school;
  data['schoolStaff'] = this.schoolStaff;
  if (this.classes != null) {
  data['class'] = this.classes!.map((v) => v.toJson()).toList();
  }
  if (this.classSection != null) {
  data['classSection'] = this.classSection!.map((v) => v.toJson()).toList();
  }
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  return data;
  }
}

class Class {
  String? sId;
  String? school;
  String? name;

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

class ClassSection {
  String? sId;
  String? school;
  String? classes;
  String? name;
  String? roomNo;
  String? status;

  ClassSection({this.sId, this.school, this.classes, this.name, this.roomNo, this.status});

  ClassSection.fromJson(Map<String, dynamic> json) {
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

class Subject {
  String? sId;
  String? language;
  String? name;
  String? status;

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

class Location {
  String? type;
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

class Statistics {
  String? pendingTask;
  String? unclosedComplaint;
  String? starsEvaluationPending;
  String? assignmentToReview;
  String? attendanceRecord;
  String? performance;
  String? linkedStars;
  String? allocatedSchools;
  String? totalClassesAttendedThisWeek;
  String? avgOfInteractingWithChatting;

  Statistics({this.pendingTask, this.unclosedComplaint, this.starsEvaluationPending, this.assignmentToReview, this.attendanceRecord, this.performance, this.linkedStars, this.allocatedSchools, this.totalClassesAttendedThisWeek, this.avgOfInteractingWithChatting});

  Statistics.fromJson(Map<String, dynamic> json) {
    pendingTask = json['pendingTask'];
    unclosedComplaint = json['unclosedComplaint'];
    starsEvaluationPending = json['starsEvaluationPending'];
    assignmentToReview = json['assignmentToReview'];
    attendanceRecord = json['attendanceRecord'];
    performance = json['performance'];
    linkedStars = json['linkedStars'];
    allocatedSchools = json['allocatedSchools'];
    totalClassesAttendedThisWeek = json['totalClassesAttendedThisWeek'];
    avgOfInteractingWithChatting = json['avgOfInteractingWithChatting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pendingTask'] = this.pendingTask;
    data['unclosedComplaint'] = this.unclosedComplaint;
    data['starsEvaluationPending'] = this.starsEvaluationPending;
    data['assignmentToReview'] = this.assignmentToReview;
    data['attendanceRecord'] = this.attendanceRecord;
    data['performance'] = this.performance;
    data['linkedStars'] = this.linkedStars;
    data['allocatedSchools'] = this.allocatedSchools;
    data['totalClassesAttendedThisWeek'] = this.totalClassesAttendedThisWeek;
    data['avgOfInteractingWithChatting'] = this.avgOfInteractingWithChatting;
    return data;
  }
}
