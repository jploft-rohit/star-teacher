class AssignmentResponse {
  dynamic statusCode;
  dynamic message;
  List<AssignmentData>? data;
  Pagination? pagination;

  AssignmentResponse({this.statusCode, this.message, this.data, this.pagination});

  AssignmentResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AssignmentData>[];
      json['data'].forEach((v) { data!.add(new AssignmentData.fromJson(v)); });
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

class AssignmentData {
  dynamic isPost;
  List<String>? saveList;
  dynamic isDeleted;
  dynamic sId;
  dynamic category;
  dynamic title;
  Subject? subject;
  Class? classes;
  dynamic term;
  User? user;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic assignmentNo;
  dynamic deleteReason;

  AssignmentData({this.isPost, this.saveList, this.isDeleted, this.sId, this.category, this.title, this.subject, this.classes, this.term, this.user, this.status, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.assignmentNo, this.deleteReason});

  AssignmentData.fromJson(Map<String, dynamic> json) {
  isPost = json['isPost'];
  saveList = json['saveList'].cast<String>();
  isDeleted = json['isDeleted'];
  sId = json['_id'];
  category = json['category'];
  title = json['title'];
  subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  classes = json['class'] != null ? new Class.fromJson(json['class']) : null;
  term = json['term'];
  user = json['user'] != null ? new User.fromJson(json['user']) : null;
  status = json['status'];
  createdBy = json['createdBy'];
  updatedBy = json['updatedBy'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  assignmentNo = json['assignmentNo'];
  deleteReason = json['deleteReason'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['isPost'] = this.isPost;
  data['saveList'] = this.saveList;
  data['isDeleted'] = this.isDeleted;
  data['_id'] = this.sId;
  data['category'] = this.category;
  data['title'] = this.title;
  if (this.subject != null) {
  data['subject'] = this.subject!.toJson();
  }
  if (this.classes != null) {
  data['class'] = this.classes!.toJson();
  }
  data['term'] = this.term;
  if (this.user != null) {
  data['user'] = this.user!.toJson();
  }
  data['status'] = this.status;
  data['createdBy'] = this.createdBy;
  data['updatedBy'] = this.updatedBy;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['assignmentNo'] = this.assignmentNo;
  data['deleteReason'] = this.deleteReason;
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
  dynamic updatedBy;

  Subject({this.isDeleted, this.sId, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.updatedBy});

  Subject.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
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
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
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

class User {
  Location? location;
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
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic address;
  dynamic country;
  dynamic maritalStatus;
  dynamic sector;
  dynamic email;
  dynamic locationType;
  dynamic slotNo;

  User({this.location, this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.otp, this.deviceToken, this.deviceVoip, this.address, this.country, this.maritalStatus, this.sector, this.email, this.locationType, this.slotNo});

  User.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
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
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    address = json['address'];
    country = json['country'];
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    email = json['email'];
    locationType = json['locationType'];
    slotNo = json['slotNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
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
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['address'] = this.address;
    data['country'] = this.country;
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
    data['email'] = this.email;
    data['locationType'] = this.locationType;
    data['slotNo'] = this.slotNo;
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