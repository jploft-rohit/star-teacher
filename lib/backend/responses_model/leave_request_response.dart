class LeaveRequestResponse {
  dynamic statusCode;
  dynamic message;
  List<LeaveRequestData>? data;
  Pagination? pagination;

  LeaveRequestResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  LeaveRequestResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeaveRequestData>[];
      json['data'].forEach((v) {
        data!.add(new LeaveRequestData.fromJson(v));
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

class LeaveRequestData {
  dynamic date;
  dynamic time;
  dynamic reason;
  dynamic meetingUrl;
  dynamic meetingFeedBackRating;
  dynamic meetingFeedBackDesc;
  dynamic isDeleted;
  dynamic sId;
  dynamic comment;
  School? school;
  dynamic startDate;
  dynamic endDate;
  User? user;
  LeaveType? leaveType;
  dynamic typeOfRequest;
  CreatedBy? createdBy;
  CreatedBy? updatedBy;
  dynamic document;
  dynamic requestId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  List<RequestStatus>? requestStatus;

  LeaveRequestData(
      {this.date,
        this.time,
        this.comment,
        this.reason,
        this.meetingUrl,
        this.meetingFeedBackRating,
        this.meetingFeedBackDesc,
        this.isDeleted,
        this.sId,
        this.school,
        this.startDate,
        this.endDate,
        this.user,
        this.leaveType,
        this.typeOfRequest,
        this.createdBy,
        this.updatedBy,
        this.document,
        this.requestId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.requestStatus});

  LeaveRequestData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    comment = json['comment'];
    reason = json['reason'];
    meetingUrl = json['meetingUrl'];
    meetingFeedBackRating = json['meetingFeedBackRating'];
    meetingFeedBackDesc = json['meetingFeedBackDesc'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    leaveType = json['leaveType'] != null
        ? new LeaveType.fromJson(json['leaveType'])
        : null;
    typeOfRequest = json['typeOfRequest'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    updatedBy = json['updatedBy'] != null
        ? new CreatedBy.fromJson(json['updatedBy'])
        : null;
    document = json['document'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['comment'] = this.comment;
    data['reason'] = this.reason;
    data['meetingUrl'] = this.meetingUrl;
    data['meetingFeedBackRating'] = this.meetingFeedBackRating;
    data['meetingFeedBackDesc'] = this.meetingFeedBackDesc;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.leaveType != null) {
      data['leaveType'] = this.leaveType!.toJson();
    }
    data['typeOfRequest'] = this.typeOfRequest;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    data['document'] = this.document;
    data['requestId'] = this.requestId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.requestStatus != null) {
      data['requestStatus'] =
          this.requestStatus!.map((v) => v.toJson()).toList();
    }
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
        this.updatedAt});

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

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }
}

class LeaveType {
  dynamic isDeleted;
  dynamic sId;
  dynamic language;
  dynamic name;

  LeaveType({this.isDeleted, this.sId, this.language, this.name});

  LeaveType.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    language = json['language'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['name'] = this.name;
    return data;
  }
}

class CreatedBy {
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
  dynamic password;
  dynamic dob;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic otp;
  dynamic address;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic deviceToken;
  dynamic deviceVoip;
  Role? role;
  dynamic nationality;
  dynamic locationType;
  dynamic status;
  dynamic profilePic;
  dynamic barcode;

  CreatedBy(
      {
        this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.sId,
        this.name,
        this.email,
        this.mobile,
        this.password,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.otp,
        this.address,
        this.emirateId,
        this.emirateIdExpire,
        this.deviceToken,
        this.deviceVoip,
        this.role,
        this.nationality,
        this.locationType,
        this.status,
        this.profilePic,
        this.barcode,
        });

  CreatedBy.fromJson(Map<String, dynamic> json) {
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
    password = json['password'];
    dob = json['dob'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    otp = json['otp'];
    address = json['address'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    nationality = json['nationality'];
    locationType = json['locationType'];
    status = json['status'];
    profilePic = json['profilePic'];
    barcode = json['barcode'];
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
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['otp'] = this.otp;
    data['address'] = this.address;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['nationality'] = this.nationality;
    data['locationType'] = this.locationType;
    data['status'] = this.status;
    data['profilePic'] = this.profilePic;
    data['barcode'] = this.barcode;
    data['updated_at'] = this.updatedAt;
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