class RolesDelegationResponse {
  dynamic statusCode;
  dynamic message;
  List<RolesDelegationData>? data;
  Pagination? pagination;

  RolesDelegationResponse({this.statusCode, this.message, this.data, this.pagination});

  RolesDelegationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RolesDelegationData>[];
      json['data'].forEach((v) { data!.add(new RolesDelegationData.fromJson(v)); });
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

class RolesDelegationData {
  dynamic isDeleted;
  dynamic sId;
  School? school;
  AssistingWhom? assistingWhom;
  WhoWillServe? whoWillServe;
  Class? classes;
  Section? section;
  dynamic fromDate;
  dynamic toDate;
  dynamic instructions;
  WhoWillServe? createdBy;
  dynamic updatedBy;
  Status? status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  List<RequestStatus>? requestStatus;

  RolesDelegationData({this.isDeleted, this.sId, this.school, this.assistingWhom, this.whoWillServe, this.classes, this.section, this.fromDate, this.toDate, this.instructions, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.iV, this.requestStatus});

  RolesDelegationData.fromJson(Map<String, dynamic> json) {
  isDeleted = json['isDeleted'];
  sId = json['_id'];
  school = json['school'] != null ? new School.fromJson(json['school']) : null;
  assistingWhom = json['assistingWhom'] != null ? new AssistingWhom.fromJson(json['assistingWhom']) : null;
  whoWillServe = json['whoWillServe'] != null ? new WhoWillServe.fromJson(json['whoWillServe']) : null;
  classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
  section = json['section'] != null ? new Section.fromJson(json['section']) : null;
  fromDate = json['fromDate'];
  toDate = json['toDate'];
  instructions = json['instructions'];
  createdBy = json['createdBy'] != null ? new WhoWillServe.fromJson(json['createdBy']) : null;
  updatedBy = json['updatedBy'];
  status = json['status'] != null ? new Status.fromJson(json['status']) : null;
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  if (json['requestStatus'] != null) {
  requestStatus = <RequestStatus>[];
  json['requestStatus'].forEach((v) { requestStatus!.add(new RequestStatus.fromJson(v)); });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['isDeleted'] = this.isDeleted;
  data['_id'] = this.sId;
  if (this.school != null) {
  data['school'] = this.school!.toJson();
  }
  if (this.assistingWhom != null) {
  data['assistingWhom'] = this.assistingWhom!.toJson();
  }
  if (this.whoWillServe != null) {
  data['whoWillServe'] = this.whoWillServe!.toJson();
  }
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  if (this.section != null) {
  data['section'] = this.section!.toJson();
  }
  data['fromDate'] = this.fromDate;
  data['toDate'] = this.toDate;
  data['instructions'] = this.instructions;
  if (this.createdBy != null) {
  data['createdBy'] = this.createdBy!.toJson();
  }
  data['updatedBy'] = this.updatedBy;
  if (this.status != null) {
  data['status'] = this.status!.toJson();
  }
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
  if (this.requestStatus != null) {
  data['requestStatus'] = this.requestStatus!.map((v) => v.toJson()).toList();
  }
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

class AssistingWhom {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic sId;
  dynamic mobile;
  dynamic iV;
  dynamic address;
  dynamic createdAt;
  dynamic dob;
  dynamic email;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic isEmailVerified;
  dynamic name;
  dynamic nationality;
  dynamic otp;
  dynamic profilePic;
  Role? role;
  dynamic updatedAt;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic country;
  dynamic sector;
  dynamic maritalStatus;
  dynamic alternativeMobile;
  dynamic state;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic uniqueId;

  AssistingWhom({this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.currentStatus, this.sId, this.mobile, this.iV, this.address, this.createdAt, this.dob, this.email, this.emirateId, this.emirateIdExpire, this.isEmailVerified, this.name, this.nationality, this.otp, this.profilePic, this.role, this.updatedAt, this.deviceToken, this.deviceVoip, this.country, this.sector, this.maritalStatus, this.alternativeMobile, this.state, this.nativeLanguage, this.religion, this.uniqueId});

  AssistingWhom.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    sId = json['_id'];
    mobile = json['mobile'];
    iV = json['__v'];
    address = json['address'];
    createdAt = json['createdAt'];
    dob = json['dob'];
    email = json['email'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    isEmailVerified = json['isEmailVerified'];
    name = json['name'];
    nationality = json['nationality'];
    otp = json['otp'];
    profilePic = json['profilePic'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    updatedAt = json['updatedAt'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    country = json['country'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
    alternativeMobile = json['alternativeMobile'];
    state = json['state'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    uniqueId = json['uniqueId'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    data['__v'] = this.iV;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['isEmailVerified'] = this.isEmailVerified;
    data['name'] = this.name;
    data['nationality'] = this.nationality;
    data['otp'] = this.otp;
    data['profilePic'] = this.profilePic;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['updatedAt'] = this.updatedAt;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['country'] = this.country;
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
    data['alternativeMobile'] = this.alternativeMobile;
    data['state'] = this.state;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['uniqueId'] = this.uniqueId;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class WhoWillServe {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
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
  dynamic uniqueId;

  WhoWillServe({this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.currentStatus, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.iV, this.otp, this.deviceToken, this.deviceVoip, this.address, this.country, this.email, this.status, this.state, this.alternativeMobile, this.sector, this.maritalStatus, this.uniqueId});

  WhoWillServe.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
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
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
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
    data['uniqueId'] = this.uniqueId;
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

class Class {
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  Class({this.isDeleted, this.sId, this.school, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  Class.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
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
    data['school'] = this.school;
    data['name'] = this.name;
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

class Status {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic order;

  Status({this.isDeleted, this.sId, this.name, this.type, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.order});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['order'] = this.order;
    return data;
  }
}

class RequestStatus {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic order;
  dynamic time;

  RequestStatus({this.isDeleted, this.sId, this.name, this.type, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.order, this.time});

  RequestStatus.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    order = json['order'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['order'] = this.order;
    data['time'] = this.time;
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