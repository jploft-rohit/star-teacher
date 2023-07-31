class AllComplainReportResponse {
  dynamic statusCode;
  dynamic message;
  List<Data>? data;

  AllComplainReportResponse({this.statusCode, this.message, this.data});

  AllComplainReportResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic forEnquery;
  dynamic inProgress;
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  ComplaintUser? complaintUser;
  ComplaintType? complaintType;
  dynamic title;
  dynamic description;
  dynamic document;
  dynamic createdBy;
  dynamic updatedBy;
  Status? status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic resolverComment;
  dynamic selfComment;
  List<ComplaintStatus>? complaintStatus;
  User? user;
  dynamic student;

  Data(
      {this.forEnquery,
        this.inProgress,
        this.isDeleted,
        this.sId,
        this.school,
        this.complaintUser,
        this.complaintType,
        this.title,
        this.description,
        this.document,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.resolverComment,
        this.selfComment,
        this.complaintStatus,
        this.user,
        this.student});

  Data.fromJson(Map<String, dynamic> json) {
    forEnquery = json['forEnquery'];
    inProgress = json['inProgress'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    complaintUser = json['complaintUser'] != null
        ? new ComplaintUser.fromJson(json['complaintUser'])
        : null;
    complaintType = json['complaintType'] != null
        ? new ComplaintType.fromJson(json['complaintType'])
        : null;
    title = json['title'];
    description = json['description'];
    document = json['document'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    resolverComment = json['resolverComment'];
    selfComment = json['selfComment'];
    if (json['complaintStatus'] != null) {
      complaintStatus = <ComplaintStatus>[];
      json['complaintStatus'].forEach((v) {
        complaintStatus!.add(new ComplaintStatus.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forEnquery'] = this.forEnquery;
    data['inProgress'] = this.inProgress;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    if (this.complaintUser != null) {
      data['complaintUser'] = this.complaintUser!.toJson();
    }
    if (this.complaintType != null) {
      data['complaintType'] = this.complaintType!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['document'] = this.document;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['resolverComment'] = this.resolverComment;
    data['selfComment'] = this.selfComment;
    if (this.complaintStatus != null) {
      data['complaintStatus'] =
          this.complaintStatus!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['student'] = this.student;
    return data;
  }
}

class ComplaintUser {
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
  dynamic address;
  dynamic country;
  dynamic email;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  Location? location;
  dynamic maritalStatus;
  dynamic sector;
  dynamic locationType;
  dynamic slotNo;

  ComplaintUser(
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
        this.iV,
        this.address,
        this.country,
        this.email,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.location,
        this.maritalStatus,
        this.sector,
        this.locationType,
        this.slotNo});

  ComplaintUser.fromJson(Map<String, dynamic> json) {
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
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    address = json['address'];
    country = json['country'];
    email = json['email'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    locationType = json['locationType'];
    slotNo = json['slotNo'];
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
    data['address'] = this.address;
    data['country'] = this.country;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
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

class ComplaintType {
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic name;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  ComplaintType(
      {this.isDeleted,
        this.sId,
        this.school,
        this.name,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ComplaintType.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['name'] = this.name;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
        this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    if (this.idDocument != null) {
      data['idDocument'] = this.idDocument!.map((v) => v.toJson()).toList();
    }
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
  dynamic displayName;

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.displayName,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    displayName = json['displayName'];
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
    data['displayName'] = this.displayName;
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