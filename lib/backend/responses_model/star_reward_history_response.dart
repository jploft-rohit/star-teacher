class StarRewardHistoryResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;
  Pagination? pagination;

  StarRewardHistoryResponse({this.statusCode, this.message, this.data, this.pagination});

  StarRewardHistoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null ? new Pagination.fromJson(json['pagination']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  List<StarRewardHistroryData>? reward;
  User? user;

  Data({this.reward, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reward'] != null) {
      reward = <StarRewardHistroryData>[];
      json['reward'].forEach((v) { reward!.add(new StarRewardHistroryData.fromJson(v)); });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reward != null) {
      data['reward'] = this.reward!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class StarRewardHistroryData {
  dynamic sId;
  User? user;
  RewardedBy? rewardedBy;
  Reward? reward;
  dynamic points;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic student;
  dynamic createdAt;
  dynamic updatedAt;

  StarRewardHistroryData({this.sId, this.user, this.rewardedBy, this.reward, this.points, this.createdBy, this.updatedBy, this.student, this.createdAt, this.updatedAt});

  StarRewardHistroryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rewardedBy = json['rewardedBy'] != null ? new RewardedBy.fromJson(json['rewardedBy']) : null;
    reward = json['reward'] != null ? new Reward.fromJson(json['reward']) : null;
    points = json['points'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    student = json['student'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.rewardedBy != null) {
      data['rewardedBy'] = this.rewardedBy!.toJson();
    }
    if (this.reward != null) {
      data['reward'] = this.reward!.toJson();
    }
    data['points'] = this.points;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['student'] = this.student;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class User {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic docDate;
  dynamic deviceType;
  dynamic parentId;
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
  dynamic profilePic;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic language;
  dynamic nationality;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic uniqueId;

  User({this.isMobileVerified, this.gender, this.idDocument, this.docDate, this.deviceType, this.parentId, this.isDeleted, this.currentStatus, this.isSendActivationRequest, this.isFirstVerifyActivationRequest, this.sId, this.name, this.email, this.mobile, this.role, this.dob, this.emirateId, this.emirateIdExpire, this.profilePic, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.language, this.nationality, this.nativeLanguage, this.religion, this.uniqueId});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    docDate = json['docDate'];
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
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    dob = json['dob'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    profilePic = json['profilePic'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    language = json['language'];
    nationality = json['nationality'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    uniqueId = json['uniqueId'];
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
    data['isFirstVerifyActivationRequest'] = this.isFirstVerifyActivationRequest;
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
    data['profilePic'] = this.profilePic;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['language'] = this.language;
    data['nationality'] = this.nationality;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
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
  dynamic displayName;
  dynamic filterType;

  Role({this.isDeleted, this.sId, this.name, this.type, this.status, this.createdBy, this.createdAt, this.updatedAt, this.displayName, this.filterType});

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

class RewardedBy {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic docDate;
  dynamic deviceType;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
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
  dynamic uniqueId;

  RewardedBy({this.isMobileVerified, this.gender, this.idDocument, this.docDate, this.deviceType, this.isDeleted, this.currentStatus, this.isSendActivationRequest, this.isFirstVerifyActivationRequest, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.nativeLanguage, this.religion, this.profilePic, this.role, this.createdAt, this.updatedAt, this.otp, this.deviceToken, this.deviceVoip, this.address, this.country, this.email, this.status, this.state, this.alternativeMobile, this.sector, this.maritalStatus, this.uniqueId});

  RewardedBy.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
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
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] = this.isFirstVerifyActivationRequest;
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

class Reward {
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic title;
  dynamic points;
  dynamic image;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  Reward({this.isDeleted, this.sId, this.school, this.title, this.points, this.image, this.status, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt});

  Reward.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    title = json['title'];
    points = json['points'];
    image = json['image'];
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
    data['school'] = this.school;
    data['title'] = this.title;
    data['points'] = this.points;
    data['image'] = this.image;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}