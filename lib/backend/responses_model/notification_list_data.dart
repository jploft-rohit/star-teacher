class NotificationListData {
  dynamic statusCode;
  dynamic message;
  List<Data>? data;
  Pagination? pagination;

  NotificationListData(
      {this.statusCode, this.message, this.data, this.pagination});

  NotificationListData.fromJson(Map<String, dynamic> json) {
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
  dynamic sId;
  Sender? sender;
  Receiver? receiver;
  dynamic type;
  dynamic message;
  dynamic isRead;
  dynamic isDeleted;

  Data(
      {this.sId,
        this.sender,
        this.receiver,
        this.type,
        this.message,
        this.isRead,
        this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    type = json['type'];
    message = json['message'];
    isRead = json['isRead'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    data['type'] = this.type;
    data['message'] = this.message;
    data['isRead'] = this.isRead;
    data['isDeleted'] = this.isDeleted;
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

class Receiver {
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

  Receiver(
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
        this.deviceVoip});

  Receiver.fromJson(Map<String, dynamic> json) {
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