class AllFeedbackHelpResponse {
  dynamic statusCode;
  dynamic message;
  List<Data>? data;
  Pagination? pagination;

  AllFeedbackHelpResponse(
      {this.statusCode, this.message, this.data, this.pagination});

  AllFeedbackHelpResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  dynamic forEnquery;
  dynamic inProgress;
  dynamic isDeleted;
  dynamic sId;
  dynamic title;
  dynamic description;
  dynamic school;
  User? user;
  Person? person;
  dynamic document;
  dynamic createdBy;
  dynamic updatedBy;
  Status? status;
  dynamic student;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic selfReply;
  List<ComplaintStatus>? complaintStatus;
  dynamic reply;

  Data(
      {this.forEnquery,
        this.inProgress,
        this.isDeleted,
        this.sId,
        this.title,
        this.description,
        this.school,
        this.user,
        this.person,
        this.document,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.student,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.selfReply,
        this.complaintStatus,
        this.reply});

  Data.fromJson(Map<String, dynamic> json) {
    forEnquery = json['forEnquery'];
    inProgress = json['inProgress'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    school = json['school'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
    document = json['document'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    student = json['student'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    selfReply = json['selfReply'];
    if (json['complaintStatus'] != null) {
      complaintStatus = <ComplaintStatus>[];
      json['complaintStatus'].forEach((v) {
        complaintStatus!.add(new ComplaintStatus.fromJson(v));
      });
    }
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forEnquery'] = this.forEnquery;
    data['inProgress'] = this.inProgress;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['school'] = this.school;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    data['document'] = this.document;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['student'] = this.student;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['selfReply'] = this.selfReply;
    if (this.complaintStatus != null) {
      data['complaintStatus'] =
          this.complaintStatus!.map((v) => v.toJson()).toList();
    }
    data['reply'] = this.reply;
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
  Role? role;
  dynamic dob;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic profilePic;
  dynamic barcode;
  dynamic location;
  dynamic password;
  dynamic otp;
  dynamic address;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic nationality;

  User(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
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
        this.iV,
        this.profilePic,
        this.barcode,
        this.location,
        this.password,
        this.otp,
        this.address,
        this.deviceToken,
        this.deviceVoip,
        this.nationality});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
    isDeleted = json['isDeleted'];
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
    iV = json['__v'];
    profilePic = json['profilePic'];
    barcode = json['barcode'];
    location = json['location'];
    password = json['password'];
    otp = json['otp'];
    address = json['address'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
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
    data['__v'] = this.iV;
    data['profilePic'] = this.profilePic;
    data['barcode'] = this.barcode;
    data['location'] = this.location;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['address'] = this.address;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
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
  dynamic iV;

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
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
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Person {
  dynamic location;
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
  dynamic locationType;
  dynamic slotNo;

  Person(
      {this.location,
        this.isMobileVerified,
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
        this.iV,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.address,
        this.country,
        this.maritalStatus,
        this.sector,
        this.email,
        this.locationType,
        this.slotNo});

  Person.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
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
    data['locationType'] = this.locationType;
    data['slotNo'] = this.slotNo;
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

  Status(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
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
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ComplaintStatus {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic time;

  ComplaintStatus(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.time});

  ComplaintStatus.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdBy = json['createdBy'];
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
    data['createdBy'] = this.createdBy;
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