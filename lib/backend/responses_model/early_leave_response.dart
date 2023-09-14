class EarlyLeaveResponse {
  dynamic statusCode;
  dynamic message;
  List<EarlyLeaveData>? data;
  Pagination? pagination;

  EarlyLeaveResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  EarlyLeaveResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EarlyLeaveData>[];
      json['data'].forEach((v) {
        data!.add(new EarlyLeaveData.fromJson(v));
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

class EarlyLeaveData {
  dynamic date;
  dynamic time;
  dynamic comment;
  dynamic outTime;
  dynamic inTime;
  dynamic reason;
  dynamic meetingUrl;
  dynamic meetingFeedBackRating;
  dynamic meetingFeedBackDesc;
  dynamic isLeavePermission;
  dynamic isDeleted;
  dynamic sId;
  School? school;
  User? user;
  dynamic typeOfRequest;
  User? createdBy;
  User? updatedBy;
  dynamic document;
  LeaveType? leaveType;
  dynamic status;
  dynamic requestId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  List<RequestStatus>? requestStatus;
  dynamic statusData;
  dynamic reminderData;

  EarlyLeaveData(
      {this.date,
        this.time,
        this.outTime,
        this.inTime,
        this.reason,
        this.comment,
        this.meetingUrl,
        this.meetingFeedBackRating,
        this.meetingFeedBackDesc,
        this.isLeavePermission,
        this.isDeleted,
        this.sId,
        this.school,
        this.user,
        this.typeOfRequest,
        this.createdBy,
        this.updatedBy,
        this.document,
        this.leaveType,
        this.status,
        this.requestId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.requestStatus,
        this.statusData,
        this.reminderData});

  EarlyLeaveData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    comment = json['comment'];
    time = json['time'];
    outTime = json['outTime'];
    inTime = json['inTime'];
    reason = json['reason'];
    meetingUrl = json['meetingUrl'];
    meetingFeedBackRating = json['meetingFeedBackRating'];
    meetingFeedBackDesc = json['meetingFeedBackDesc'];
    isLeavePermission = json['isLeavePermission'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    typeOfRequest = json['typeOfRequest'];
    createdBy =
    json['createdBy'] != null ? new User.fromJson(json['createdBy']) : null;
    updatedBy =
    json['updatedBy'] != null ? new User.fromJson(json['updatedBy']) : null;
    document = json['document'];
    leaveType = json['leaveType'] != null
        ? new LeaveType.fromJson(json['leaveType'])
        : null;
    status = json['status'];
    requestId = json['requestId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['requestStatus'] != null) {
      requestStatus = <RequestStatus>[];
      json['requestStatus'].forEach((v) {
        requestStatus!.add(new RequestStatus.fromJson(v));
      });
    }
    statusData = json['statusData'];
    reminderData = json['reminderData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['outTime'] = this.outTime;
    data['inTime'] = this.inTime;
    data['comment'] = this.comment;
    data['reason'] = this.reason;
    data['meetingUrl'] = this.meetingUrl;
    data['meetingFeedBackRating'] = this.meetingFeedBackRating;
    data['meetingFeedBackDesc'] = this.meetingFeedBackDesc;
    data['isLeavePermission'] = this.isLeavePermission;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['typeOfRequest'] = this.typeOfRequest;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    data['document'] = this.document;
    if (this.leaveType != null) {
      data['leaveType'] = this.leaveType!.toJson();
    }
    data['status'] = this.status;
    data['requestId'] = this.requestId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.requestStatus != null) {
      data['requestStatus'] =
          this.requestStatus!.map((v) => v.toJson()).toList();
    }
    data['statusData'] = this.statusData;
    data['reminderData'] = this.reminderData;
    return data;
  }
}

class School {
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
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  Location? location;
  dynamic user;
  dynamic updatedBy;
  dynamic rating;
  dynamic parentSchool;

  School(
      {this.brouchure,
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
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.location,
        this.user,
        this.updatedBy,
        this.rating,
        this.parentSchool});

  School.fromJson(Map<String, dynamic> json) {
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
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    user = json['user'];
    updatedBy = json['updatedBy'];
    rating = json['rating'];
    parentSchool = json['parentSchool'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['parentSchool'] = this.parentSchool;
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

class User {
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
  dynamic email;
  dynamic status;
  dynamic state;
  dynamic alternativeMobile;
  dynamic sector;
  dynamic maritalStatus;

  User(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
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
        this.email,
        this.status,
        this.state,
        this.alternativeMobile,
        this.sector,
        this.maritalStatus});

  User.fromJson(Map<String, dynamic> json) {
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

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.filterType,
        this.displayName});

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

class LeaveType {
  dynamic isDeleted;
  dynamic sId;
  dynamic language;
  dynamic name;
  dynamic description;

  LeaveType(
      {this.isDeleted, this.sId, this.language, this.name, this.description});

  LeaveType.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class RequestStatus {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic time;

  RequestStatus(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.time});

  RequestStatus.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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