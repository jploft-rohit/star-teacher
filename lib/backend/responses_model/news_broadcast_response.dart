class NewsBroadCastListData {
  dynamic statusCode;
  dynamic message;
  List<NewsBroadCastData>? data;
  Pagination? pagination;

  NewsBroadCastListData(
      {this.statusCode, this.message, this.data, this.pagination});

  NewsBroadCastListData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NewsBroadCastData>[];
      json['data'].forEach((v) {
        data!.add(new NewsBroadCastData.fromJson(v));
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

class NewsBroadCastData {
  dynamic sId;
  School? school;
  dynamic title;
  dynamic message;
  Sender? sender;
  dynamic isRead;
  dynamic status;
  dynamic isDeleted;
  dynamic updatedAt;
  dynamic updatedBy;
  dynamic role;
  dynamic type;
  User? user;

  NewsBroadCastData(
      {this.sId,
        this.school,
        this.title,
        this.message,
        this.sender,
        this.isRead,
        this.status,
        this.isDeleted,
        this.updatedAt,
        this.updatedBy,
        this.role,
        this.type,
        this.user});

  NewsBroadCastData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    title = json['title'];
    message = json['message'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    isRead = json['isRead'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    role = json['role'];
    type = json['type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['isRead'] = this.isRead;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    data['role'] = this.role;
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class School {
  dynamic sId;
  dynamic isDeleted;
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
  dynamic location;
  dynamic updatedBy;
  dynamic rating;
  dynamic parentSchool;

  School(
      {this.sId,
        this.isDeleted,
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
        this.user,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.location,
        this.updatedBy,
        this.rating,
        this.parentSchool});

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
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    updatedBy = json['updatedBy'];
    rating = json['rating'];
    parentSchool = json['parentSchool'];
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
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['updatedBy'] = this.updatedBy;
    data['rating'] = this.rating;
    data['parentSchool'] = this.parentSchool;
    return data;
  }
}

class Location {
  dynamic type;
  dynamic coordinates;

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

class Sender {
  dynamic sId;
  dynamic mobile;
  dynamic iV;
  dynamic address;
  dynamic createdAt;
  dynamic dob;
  dynamic email;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic idDocument;
  dynamic isEmailVerified;
  dynamic isMobileVerified;
  dynamic name;
  dynamic nationality;
  dynamic otp;
  dynamic profilePic;
  dynamic role;
  dynamic updatedAt;
  dynamic deviceToken;
  dynamic deviceType;
  dynamic deviceVoip;
  dynamic isDeleted;
  dynamic country;
  dynamic sector;
  dynamic maritalStatus;

  Sender(
      {this.sId,
        this.mobile,
        this.iV,
        this.address,
        this.createdAt,
        this.dob,
        this.email,
        this.emirateId,
        this.emirateIdExpire,
        this.idDocument,
        this.isEmailVerified,
        this.isMobileVerified,
        this.name,
        this.nationality,
        this.otp,
        this.profilePic,
        this.role,
        this.updatedAt,
        this.deviceToken,
        this.deviceType,
        this.deviceVoip,
        this.isDeleted,
        this.country,
        this.sector,
        this.maritalStatus});

  Sender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    iV = json['__v'];
    address = json['address'];
    createdAt = json['createdAt'];
    dob = json['dob'];
    email = json['email'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    idDocument = json['idDocument'];
    isEmailVerified = json['isEmailVerified'];
    isMobileVerified = json['isMobileVerified'];
    name = json['name'];
    nationality = json['nationality'];
    otp = json['otp'];
    profilePic = json['profilePic'];
    role = json['role'];
    updatedAt = json['updatedAt'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    deviceVoip = json['deviceVoip'];
    isDeleted = json['isDeleted'];
    country = json['country'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    data['__v'] = this.iV;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['idDocument'] = this.idDocument;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isMobileVerified'] = this.isMobileVerified;
    data['name'] = this.name;
    data['nationality'] = this.nationality;
    data['otp'] = this.otp;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['updatedAt'] = this.updatedAt;
    data['deviceToken'] = this.deviceToken;
    data['deviceType'] = this.deviceType;
    data['deviceVoip'] = this.deviceVoip;
    data['isDeleted'] = this.isDeleted;
    data['country'] = this.country;
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
    return data;
  }
}

class User {
  dynamic sId;
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic name;
  dynamic mobile;
  dynamic dob;
  dynamic nationality;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic profilePic;
  dynamic role;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic address;
  dynamic country;
  dynamic maritalStatus;
  dynamic sector;
  dynamic email;
  dynamic location;
  dynamic locationType;
  dynamic slotNo;

  User(
      {this.sId,
        this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
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
        this.iV,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.address,
        this.country,
        this.maritalStatus,
        this.sector,
        this.email,
        this.location,
        this.locationType,
        this.slotNo});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
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
    address = json['address'];
    country = json['country'];
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    email = json['email'];
    location = json['location'];
    locationType = json['locationType'];
    slotNo = json['slotNo'];
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
    data['address'] = this.address;
    data['country'] = this.country;
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
    data['email'] = this.email;
    data['location'] = this.location;
    data['locationType'] = this.locationType;
    data['slotNo'] = this.slotNo;
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
