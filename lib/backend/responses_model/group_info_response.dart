class GroupInfoResponse {
  int? statusCode;
  String? message;
  Data? data;

  GroupInfoResponse({this.statusCode, this.message, this.data});

  GroupInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  List<String>? groupUsers;
  bool? isDeleted;
  String? sId;
  String? roomId;
  String? title;
  String? createdBy;
  School? school;
  String? groupProfile;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<GroupDataList>? groupDataList;

  Data(
      {this.type,
        this.groupUsers,
        this.isDeleted,
        this.sId,
        this.roomId,
        this.title,
        this.createdBy,
        this.school,
        this.groupProfile,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.groupDataList});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    groupUsers = json['groupUsers'].cast<String>();
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    roomId = json['roomId'];
    title = json['title'];
    createdBy = json['createdBy'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    groupProfile = json['groupProfile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['groupUserData'] != null) {
      groupDataList = <GroupDataList>[];
      json['groupUserData'].forEach((v) {
        groupDataList!.add(new GroupDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['groupUsers'] = this.groupUsers;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['roomId'] = this.roomId;
    data['title'] = this.title;
    data['createdBy'] = this.createdBy;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['groupProfile'] = this.groupProfile;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.groupDataList != null) {
      data['groupUserData'] =
          this.groupDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class School {
  Location? location;
  String? brouchure;
  bool? isDeleted;
  String? sId;
  String? name;
  String? schoolCategory;
  String? schoolSector;
  String? schoolArea;
  String? address;
  String? language;
  String? schoolId;
  int? helplineNo;
  String? email;
  String? secondoryEmail;
  String? website;
  String? mobile;
  String? schoolType;
  String? user;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? updatedBy;
  double? rating;

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

class Location {
  String? type;
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

class GroupDataList {
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? docDate;
  String? deviceType;
  bool? isDeleted;
  String? currentStatus;
  String? isSendActivationRequest;
  String? isFirstVerifyActivationRequest;
  String? sId;
  String? name;
  String? mobile;
  String? dob;
  String? nationality;
  String? emirateId;
  String? emirateIdExpire;
  String? nativeLanguage;
  String? religion;
  String? profilePic;
  Role? role;
  String? createdAt;
  String? updatedAt;
  String? otp;
  String? deviceToken;
  String? deviceVoip;
  String? address;
  String? country;
  String? email;
  String? status;
  String? state;
  String? alternativeMobile;
  String? sector;
  String? maritalStatus;
  String? uniqueId;
  String? bloodType;
  bool? isEmailVerified;
  String? createdBy;
  String? updatedBy;

  GroupDataList(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.docDate,
        this.deviceType,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
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
        this.maritalStatus,
        this.uniqueId,
        this.bloodType,
        this.isEmailVerified,
        this.createdBy,
        this.updatedBy});

  GroupDataList.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
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
    bloodType = json['bloodType'];
    isEmailVerified = json['isEmailVerified'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
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
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
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
    data['bloodType'] = this.bloodType;
    data['isEmailVerified'] = this.isEmailVerified;
    data['updated_at'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Role {
  bool? isDeleted;
  String? sId;
  String? name;
  String? type;
  String? status;
  dynamic createdBy;
  String? createdAt;
  String? updatedAt;
  String? filterType;
  String? displayName;

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
