class AssignedAssignmentListResponse {
  dynamic statusCode;
  dynamic message;
  List<AssignedAssignmentData>? data;
  Pagination? pagination;

  AssignedAssignmentListResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  AssignedAssignmentListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AssignedAssignmentData>[];
      json['data'].forEach((v) {
        data!.add(new AssignedAssignmentData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
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

class AssignedAssignmentData {
  dynamic isDeleted;
  dynamic sId;
  School? school;
  dynamic assignmentNo;
  dynamic type;
  AssignTo? assignTo;
  dynamic postDate;
  dynamic postTime;
  dynamic submitDate;
  dynamic submitTime;
  dynamic dueDate;
  dynamic link;
  dynamic assignment;
  dynamic supportDoc;
  User? user;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  AssignedAssignmentData(
      {this.isDeleted,
        this.sId,
        this.school,
        this.assignmentNo,
        this.type,
        this.assignTo,
        this.postDate,
        this.postTime,
        this.submitDate,
        this.submitTime,
        this.dueDate,
        this.link,
        this.assignment,
        this.supportDoc,
        this.user,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  AssignedAssignmentData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
    assignmentNo = json['assignmentNo'];
    type = json['type'];
    assignTo = json['assignTo'] != null
        ? new AssignTo.fromJson(json['assignTo'])
        : null;
    postDate = json['postDate'];
    postTime = json['postTime'];
    submitDate = json['submitDate'];
    submitTime = json['submitTime'];
    dueDate = json['dueDate'];
    link = json['link'];
    assignment = json['assignment'];
    supportDoc = json['supportDoc'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['assignmentNo'] = this.assignmentNo;
    data['type'] = this.type;
    if (this.assignTo != null) {
      data['assignTo'] = this.assignTo!.toJson();
    }
    data['postDate'] = this.postDate;
    data['postTime'] = this.postTime;
    data['submitDate'] = this.submitDate;
    data['submitTime'] = this.submitTime;
    data['dueDate'] = this.dueDate;
    data['link'] = this.link;
    data['assignment'] = this.assignment;
    data['supportDoc'] = this.supportDoc;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
  dynamic parentSchool;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic updatedBy;

  School(
      {this.location,
        this.brouchure,
        this.isDeleted,
        this.sId,
        this.name,
        this.schoolCategory,
        this.schoolSector,
        this.schoolArea,
        this.address,
        this.language,
        this.schoolId,
        this.helplineNo,
        this.email,
        this.secondoryEmail,
        this.website,
        this.mobile,
        this.schoolType,
        this.parentSchool,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.updatedBy});

  School.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
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
    parentSchool = json['parentSchool'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
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
    data['parentSchool'] = this.parentSchool;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
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

class AssignTo {
  dynamic isMobileVerified;
  dynamic gender;
  List<String>? idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic mobile;
  Role? role;
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
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic uniqueId;
  dynamic religion;
  dynamic nationality;

  AssignTo(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.currentStatus,
        this.sId,
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
        this.profilePic,
        this.barcode,
        this.bloodType,
        this.dailyLimit,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.uniqueId,
        this.religion,
        this.nationality});

  AssignTo.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
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
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    uniqueId = json['uniqueId'];
    religion = json['religion'];
    nationality = json['nationality'];
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
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
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
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['uniqueId'] = this.uniqueId;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
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
  dynamic displayName;
  dynamic filterType;

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.displayName,
        this.filterType});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    displayName = json['displayName'];
    filterType = json['filterType'];
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
    data['displayName'] = this.displayName;
    data['filterType'] = this.filterType;
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
  dynamic uniqueId;

  User(
      {this.location,
        this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.currentStatus,
        this.sId,
        this.name,
        this.mobile,
        this.dob,
        this.nationality,
        this.emirateId,
        this.emirateIdExpire,
        this.nativeLanguage,
        this.religion,
        this.profilePic,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.address,
        this.country,
        this.maritalStatus,
        this.sector,
        this.email,
        this.locationType,
        this.slotNo,
        this.uniqueId});

  User.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
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
    uniqueId = json['uniqueId'];
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
    data['uniqueId'] = this.uniqueId;
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
