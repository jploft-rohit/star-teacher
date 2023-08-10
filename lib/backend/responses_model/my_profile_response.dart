class MyProfileResponse {
  dynamic statusCode;
  dynamic message;
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
  dynamic sId;
  String? isSendActivationRequest;
  dynamic isMobileVerified;
  dynamic email;
  dynamic state;
  dynamic maritalStatus;
  dynamic country;
  dynamic bloodType;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic name;
  dynamic currentStatus;
  dynamic mobile;
  dynamic dob;
  dynamic address;
  dynamic nationality;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic profilePic;
  dynamic role;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic placesOfClass;
  dynamic iV;
  dynamic designation;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  DeactivateData? deactivateData;
  List<SchoolStaff>? schoolStaff;
  dynamic alternativeMobile;
  dynamic profileCompletePercentage;
  dynamic profileCompleteDate;
  dynamic barcode;
  SchoolStaff? jobDetails;
  Statistics? statistics;
  List<FamilyMembers>? familyMembers;

  Data({this.country, this.state, this.email, this.bloodType, this.isSendActivationRequest,this.placesOfClass,this.designation,this.sId, this.deactivateData, this.currentStatus, this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.iV, this.otp, this.deviceToken, this.deviceVoip, this.schoolStaff, this.familyMembers, this.alternativeMobile, this.profileCompletePercentage, this.profileCompleteDate, this.barcode, this.jobDetails, this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    maritalStatus = json['maritalStatus'];
    address = json['address'];
    country = json['country'];
    email = json['email'];
    bloodType = json['bloodType'];
    designation = json['designation'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    currentStatus = json['currentStatus'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    isSendActivationRequest = json['isSendActivationRequest'];
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
    deactivateData = json['deactivateData'] != null ? new DeactivateData.fromJson(json['deactivateData']) : null;
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    if (json['schoolStaff'] != null) {
      schoolStaff = <SchoolStaff>[];
      json['schoolStaff'].forEach((v) { schoolStaff!.add(new SchoolStaff.fromJson(v)); });
    }
    if (json['familyMembers'] != null) {
      familyMembers = <FamilyMembers>[];
      json['familyMembers'].forEach((v) { familyMembers!.add(FamilyMembers.fromJson(v)); });
    }
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
    if (this.deactivateData != null) {
      data['deactivateData'] = this.deactivateData!.toJson();
    }
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['country'] = this.country;
    data['email'] = this.email;
    data['maritalStatus'] = this.maritalStatus;
    data['bloodType'] = this.bloodType;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['idDocument'] = this.idDocument;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['currentStatus'] = this.currentStatus;
    data['mobile'] = this.mobile;
    data['state'] = this.state;
    data['designation'] = this.designation;
    data['dob'] = this.dob;
    if (this.familyMembers != null) {
      data['familyMembers'] = this.familyMembers!.map((v) => v.toJson()).toList();
    }
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
  dynamic sId;
  dynamic isDeleted;
  dynamic user;
  School? school;
  dynamic role;
  dynamic dateOfEmployment;
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

  SchoolStaff({this.sId, this.isDeleted, this.user, this.school, this.role, this.dateOfEmployment, this.designation, this.classPerWeek, this.employeeId, this.employmentCertificate, this.jobCertificate, this.jobGrade, this.jobTitle, this.salaryCertificate, this.slotNumber, this.slotType, this.studentGender, this.titleGrade, this.weekDays, this.createdAt, this.updatedAt, this.iV});

  SchoolStaff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    user = json['user'];
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
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
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['user'] = this.user;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['role'] = this.role;
    data['dateOfEmployment'] = this.dateOfEmployment;
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

class School {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  SchoolCategory? schoolCategory;
  SchoolSector? schoolSector;
  SchoolSector? schoolArea;
  SchoolType? schoolType;
  dynamic address;
  dynamic language;
  dynamic schoolId;
  dynamic status;
  dynamic helplineNo;
  dynamic email;
  User? user;
  dynamic secondoryEmail;
  dynamic website;
  dynamic mobile;
  dynamic parentSchool;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;
  Staffsubjects? staffsubjects;
  Location? location;

  School({this.sId, this.isDeleted, this.name, this.schoolCategory, this.schoolSector, this.schoolArea, this.address, this.language, this.schoolId, this.status, this.helplineNo, this.email, this.secondoryEmail, this.website, this.mobile, this.parentSchool, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy, this.staffsubjects, this.location, this.schoolType});

  School.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    schoolCategory = json['schoolCategory'] != null ? new SchoolCategory.fromJson(json['schoolCategory']) : null;
    schoolSector = json['schoolSector'] != null ? new SchoolSector.fromJson(json['schoolSector']) : null;
    schoolArea = json['schoolArea'] != null ? new SchoolSector.fromJson(json['schoolArea']) : null;
    address = json['address'];
    language = json['language'];
    schoolId = json['schoolId'];
    schoolType = json['schoolType'] != null ? new SchoolType.fromJson(json['schoolType']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.schoolCategory != null) {
      data['schoolCategory'] = this.schoolCategory!.toJson();
    }
    if (this.schoolSector != null) {
      data['schoolSector'] = this.schoolSector!.toJson();
    }
    if (this.schoolArea != null) {
      data['schoolArea'] = this.schoolArea!.toJson();
    }
    if (this.schoolType != null) {
      data['schoolType'] = this.schoolType!.toJson();
    }
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
  dynamic sId;
  dynamic school;
  dynamic schoolStaff;
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

class ClassSection {
  dynamic sId;
  dynamic school;
  dynamic classes;
  dynamic name;
  dynamic roomNo;
  dynamic status;

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

class Statistics {
  dynamic pendingTask;
  dynamic unclosedComplaint;
  dynamic starsEvaluationPending;
  dynamic assignmentToReview;
  dynamic attendanceRecord;
  dynamic performance;
  dynamic linkedStars;
  dynamic allocatedSchools;
  dynamic totalClassesAttendedThisWeek;
  dynamic avgOfInteractingWithChatting;

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

class FamilyMembers {
  dynamic sId;
  dynamic isDeleted;
  dynamic fullName;
  dynamic mobile;
  dynamic profession;
  dynamic dob;
  dynamic nationality;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic locationType;
  dynamic relation;
  dynamic villaNumber;
  dynamic address;
  dynamic firstName;
  dynamic user;
  dynamic gender;
  Location? location;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  FamilyMembers({this.sId, this.isDeleted, this.fullName, this.mobile, this.profession, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.locationType, this.relation, this.villaNumber, this.address, this.firstName, this.user, this.gender, this.location, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.iV});

  FamilyMembers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    fullName = json['fullName'];
    mobile = json['mobile'];
    profession = json['profession'];
    dob = json['dob'];
    nationality = json['nationality'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    locationType = json['locationType'];
    relation = json['relation'];
    villaNumber = json['villaNumber'];
    address = json['address'];
    firstName = json['firstName'];
    user = json['user'];
    gender = json['gender'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['fullName'] = this.fullName;
    data['mobile'] = this.mobile;
    data['profession'] = this.profession;
    data['dob'] = this.dob;
    data['nationality'] = this.nationality;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['locationType'] = this.locationType;
    data['relation'] = this.relation;
    data['villaNumber'] = this.villaNumber;
    data['address'] = this.address;
    data['firstName'] = this.firstName;
    data['user'] = this.user;
    data['gender'] = this.gender;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SchoolCategory {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  SchoolCategory({this.sId, this.isDeleted, this.name, this.status, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  SchoolCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class SchoolSector {
  dynamic sId;
  dynamic isDeleted;
  dynamic name;
  Location? location;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  SchoolSector({this.sId, this.isDeleted, this.name, this.location, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV});

  SchoolSector.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SchoolType {
  dynamic sId;
  dynamic name;
  dynamic status;

  SchoolType({this.sId, this.name, this.status});

  SchoolType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
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
  dynamic address;
  dynamic locationType;
  Location? location;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  User({this.sId, this.isMobileVerified, this.gender, this.idDocument, this.parentId, this.isDeleted, this.name, this.email, this.mobile, this.role, this.dob, this.address, this.locationType, this.location, this.emirateId, this.emirateIdExpire, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.iV});

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
    address = json['address'];
    locationType = json['locationType'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['parentId'] = this.parentId;
    data['idDocument'] = this.idDocument;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['locationType'] = this.locationType;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class DeactivateData {
  dynamic status;
  dynamic isDeleted;
  dynamic sId;
  DeactivatedUser? deactivatedUser;
  dynamic dueDate;
  dynamic deactivationReason;
  dynamic requiredEvidance;
  DeactivatedUser? deactivatedBy;
  DeactivatedUser? createdBy;
  DeactivatedUser? updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  DeactivateData({this.status, this.isDeleted, this.sId, this.deactivatedUser, this.dueDate, this.deactivationReason, this.requiredEvidance, this.deactivatedBy, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt});

  DeactivateData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    deactivatedUser = json['deactivatedUser'] != null ? new DeactivatedUser.fromJson(json['deactivatedUser']) : null;
    dueDate = json['dueDate'];
    deactivationReason = json['deactivationReason'];
    requiredEvidance = json['requiredEvidance'];
    deactivatedBy = json['deactivatedBy'] != null ? new DeactivatedUser.fromJson(json['deactivatedBy']) : null;
    createdBy = json['createdBy'] != null ? new DeactivatedUser.fromJson(json['createdBy']) : null;
    updatedBy = json['updatedBy'] != null ? new DeactivatedUser.fromJson(json['updatedBy']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.deactivatedUser != null) {
      data['deactivatedUser'] = this.deactivatedUser!.toJson();
    }
    data['dueDate'] = this.dueDate;
    data['deactivationReason'] = this.deactivationReason;
    data['requiredEvidance'] = this.requiredEvidance;
    if (this.deactivatedBy != null) {
      data['deactivatedBy'] = this.deactivatedBy!.toJson();
    }
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class DeactivatedUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
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
  RoleData? role;
  dynamic createdAt;
  dynamic updatedAt;
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
  dynamic uniqueId;

  DeactivatedUser({this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.currentStatus, this.isSendActivationRequest, this.isFirstVerifyActivationRequest, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.otp, this.deviceToken, this.deviceVoip, this.address, this.country, this.email, this.status, this.state, this.alternativeMobile, this.sector, this.maritalStatus, this.uniqueId});

  DeactivatedUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
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
    role = json['role'] != null ? new RoleData.fromJson(json['role']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] = this.isFirstVerifyActivationRequest;
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
    data['uniqueId'] = this.uniqueId;
    return data;
  }
}

class RoleData {
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

  RoleData({this.isDeleted, this.sId, this.name, this.type, this.status, this.createdBy, this.createdAt, this.updatedAt, this.filterType, this.displayName});

  RoleData.fromJson(Map<String, dynamic> json) {
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
