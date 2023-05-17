class RewardHistoryResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;
  Pagination? pagination;

  RewardHistoryResponse({this.statusCode, this.message, this.data, this.pagination});

  RewardHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  List<Reward>? reward;
  User? user;

  Data({this.reward, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reward'] != null) {
      reward = <Reward>[];
      json['reward'].forEach((v) { reward!.add(new Reward.fromJson(v)); });
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

class Reward {
  dynamic sId;
  User? user;
  RewardedBy? rewardedBy;
  InternalRewards? reward;
  dynamic points;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic student;
  dynamic createdAt;
  dynamic updatedAt;

  Reward({this.sId, this.user, this.rewardedBy, this.reward, this.points, this.createdBy, this.updatedBy, this.student, this.createdAt, this.updatedAt});

  Reward.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rewardedBy = json['rewardedBy'] != null ? new RewardedBy.fromJson(json['rewardedBy']) : null;
    reward = json['reward'] != null ? new InternalRewards.fromJson(json['reward']) : null;
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
  dynamic deviceType;
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic mobile;
  dynamic role;
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

  User({this.isMobileVerified, this.gender, this.deviceType, this.isDeleted, this.sId, this.name, this.email, this.mobile, this.role, this.dob, this.emirateId, this.emirateIdExpire, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.profilePic, this.barcode, this.bloodType, this.dailyLimit});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['deviceType'] = this.deviceType;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
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
    return data;
  }
}

class RewardedBy {
  Location? location;
  dynamic isMobileVerified;
  dynamic gender;
  dynamic deviceType;
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
  dynamic role;
  dynamic nationality;
  dynamic isEmailVerified;
  dynamic profilePic;
  dynamic country;
  dynamic sector;
  dynamic maritalStatus;

  RewardedBy({this.location, this.isMobileVerified, this.gender, this.deviceType, this.isDeleted, this.sId, this.name, this.email, this.mobile, this.password, this.dob, this.createdAt, this.updatedAt, this.otp, this.address, this.emirateId, this.emirateIdExpire, this.deviceToken, this.deviceVoip, this.role, this.nationality, this.isEmailVerified, this.profilePic, this.country, this.sector, this.maritalStatus});

  RewardedBy.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    deviceType = json['deviceType'];
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
    role = json['role'];
    nationality = json['nationality'];
    isEmailVerified = json['isEmailVerified'];
    profilePic = json['profilePic'];
    country = json['country'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['deviceType'] = this.deviceType;
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
    data['role'] = this.role;
    data['nationality'] = this.nationality;
    data['isEmailVerified'] = this.isEmailVerified;
    data['profilePic'] = this.profilePic;
    data['country'] = this.country;
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
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

class InternalRewards {
  dynamic isDeleted;
  dynamic sId;
  dynamic school;
  dynamic language;
  dynamic title;
  dynamic points;
  dynamic image;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;

  InternalRewards({this.isDeleted, this.sId, this.school, this.language, this.title, this.points, this.image, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.status});

  InternalRewards.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    language = json['language'];
    title = json['title'];
    points = json['points'];
    image = json['image'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['language'] = this.language;
    data['title'] = this.title;
    data['points'] = this.points;
    data['image'] = this.image;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['status'] = this.status;
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