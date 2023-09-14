class ChatHistoryResponse {
  dynamic statusCode;
  dynamic message;
  List<ChatHistoryData>? data;

  ChatHistoryResponse({this.statusCode, this.message, this.data});

  ChatHistoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ChatHistoryData>[];
      json['data'].forEach((v) {
        data!.add(ChatHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatHistoryData {
  Location? location;
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic docDate;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic groupUserData;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic mobile;
  dynamic password;
  dynamic dob;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
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
  dynamic dailyLimit;
  dynamic country;
  dynamic maritalStatus;
  dynamic sector;
  dynamic state;
  dynamic uniqueId;
  dynamic roomId;
  Message? message;
  dynamic unreadCount;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic alternativeMobile;
  dynamic isEmailVerified;
  dynamic bloodType;
  dynamic type;
  dynamic groupUsers;
  dynamic title;
  dynamic createdBy;
  School? school;
  dynamic groupProfile;
  dynamic groupMessage;

  ChatHistoryData(
      {this.location,
        this.isMobileVerified,
        this.groupMessage,
        this.gender,
        this.idDocument,
        this.docDate,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.sId,
        this.name,
        this.groupUserData,
        this.email,
        this.mobile,
        this.password,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.iV,
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
        this.dailyLimit,
        this.country,
        this.maritalStatus,
        this.sector,
        this.state,
        this.uniqueId,
        this.roomId,
        this.message,
        this.unreadCount,
        this.nativeLanguage,
        this.religion,
        this.alternativeMobile,
        this.isEmailVerified,
        this.bloodType,
        //
        this.title,
        this.createdBy,
        this.type,
        this.school,
        this.groupProfile,
        this.groupUsers,
      });

  ChatHistoryData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    groupUsers = json['groupUsers'];
    groupMessage = json['message'];
    groupProfile = json['groupProfile'];
    school = json['school'] != null ? School.fromJson(json['school']) : null;
    type = json['type'];
    createdBy = json['createdBy'];
    groupUserData = json['groupUserData'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    docDate = json['docDate'];
    if (json['groupUserData'] != null) {
      groupUserData = <GroupUserData>[];
      json['groupUserData'].forEach((v) {
        groupUserData!.add(new GroupUserData.fromJson(v));
      });
    }
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    dob = json['dob'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    address = json['address'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    nationality = json['nationality'];
    locationType = json['locationType'];
    status = json['status'];
    profilePic = json['profilePic'];
    barcode = json['barcode'];
    updatedAt = json['updated_at'];
    dailyLimit = json['dailyLimit'];
    country = json['country'];
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    state = json['state'];
    uniqueId = json['uniqueId'];
    roomId = json['roomId'];
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
    unreadCount = json['unreadCount'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    alternativeMobile = json['alternativeMobile'];
    isEmailVerified = json['isEmailVerified'];
    bloodType = json['bloodType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.groupUserData != null) {
      data['groupUserData'] =
          this.groupUserData!.map((v) => v.toJson()).toList();
    }
    data['groupUsers'] = this.groupUsers;
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
    data['_id'] = this.sId;

    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    data['dailyLimit'] = this.dailyLimit;
    data['country'] = this.country;
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
    data['state'] = this.state;
    data['uniqueId'] = this.uniqueId;
    data['roomId'] = this.roomId;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['unreadCount'] = this.unreadCount;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['alternativeMobile'] = this.alternativeMobile;
    data['isEmailVerified'] = this.isEmailVerified;
    data['bloodType'] = this.bloodType;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class GroupUserData {
  dynamic isMobileVerified;
  dynamic gender;
  List<String>? idDocument;
  dynamic docDate;
  dynamic deviceType;
  List<String>? parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
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
  dynamic address;
  dynamic alternativeMobile;
  dynamic country;
  dynamic maritalStatus;
  dynamic sector;
  dynamic starToBecome;
  dynamic nativeLanguage;
  dynamic state;
  dynamic isEmailVerified;
  Location? location;
  dynamic password;
  dynamic locationType;

  GroupUserData(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.docDate,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
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
        this.profilePic,
        this.barcode,
        this.bloodType,
        this.dailyLimit,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.uniqueId,
        this.religion,
        this.nationality,
        this.address,
        this.alternativeMobile,
        this.country,
        this.maritalStatus,
        this.sector,
        this.starToBecome,
        this.nativeLanguage,
        this.state,
        this.isEmailVerified,
        this.updatedAt,
        this.location,
        this.password,
        this.locationType});

  GroupUserData.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
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
    address = json['address'];
    alternativeMobile = json['alternativeMobile'];
    country = json['country'];
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    starToBecome = json['starToBecome'];
    nativeLanguage = json['nativeLanguage'];
    state = json['state'];
    isEmailVerified = json['isEmailVerified'];
    updatedAt = json['updated_at'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    password = json['password'];
    locationType = json['locationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
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
    data['address'] = this.address;
    data['alternativeMobile'] = this.alternativeMobile;
    data['country'] = this.country;
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
    data['starToBecome'] = this.starToBecome;
    data['nativeLanguage'] = this.nativeLanguage;
    data['state'] = this.state;
    data['isEmailVerified'] = this.isEmailVerified;
    data['updated_at'] = this.updatedAt;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['password'] = this.password;
    data['locationType'] = this.locationType;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class Message {
  dynamic type;
  dynamic isRead;
  dynamic readTime;
  dynamic isDeleted;
  dynamic sId;
  dynamic senderId;
  dynamic receiverId;
  dynamic message;
  dynamic roomId;
  dynamic createdAt;
  dynamic updatedAt;

  Message(
      {this.type,
        this.isRead,
        this.readTime,
        this.isDeleted,
        this.sId,
        this.senderId,
        this.receiverId,
        this.message,
        this.roomId,
        this.createdAt,
        this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    isRead = json['isRead'];
    readTime = json['readTime'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    message = json['message'];
    roomId = json['roomId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['isRead'] = this.isRead;
    data['readTime'] = this.readTime;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['message'] = this.message;
    data['roomId'] = this.roomId;
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
  dynamic user;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;
  dynamic rating;

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
        this.user,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.updatedBy,
        this.rating});

  School.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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