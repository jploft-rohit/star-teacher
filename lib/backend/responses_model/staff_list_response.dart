class StaffListResponse {
  dynamic statusCode;
  dynamic message;
  List<StaffListData>? data;

  StaffListResponse({this.statusCode, this.message, this.data});

  StaffListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StaffListData>[];
      json['data'].forEach((v) {
        data!.add(new StaffListData.fromJson(v));
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

class StaffListData {
  dynamic isMobileVerified;
  dynamic isSelected;
  dynamic gender;
  dynamic idDocument;
  dynamic docDate;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic profileCompletePercent;
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
  dynamic createdBy;
  dynamic updatedBy;
  dynamic uniqueId;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic alternativeMobile;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic address;
  dynamic bloodType;
  dynamic country;
  dynamic email;
  dynamic maritalStatus;
  dynamic state;
  dynamic profileCompleteDate;

  StaffListData(
      {this.isMobileVerified,
        this.gender,
        this.isSelected,
        this.idDocument,
        this.docDate,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.profileCompletePercent,
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
        this.createdBy,
        this.updatedBy,
        this.uniqueId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.alternativeMobile,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.address,
        this.bloodType,
        this.country,
        this.email,
        this.maritalStatus,
        this.state,
        this.profileCompleteDate});

  StaffListData.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    docDate = json['docDate'];
    isSelected = json['isSelected'];
    deviceType = json['deviceType'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    profileCompletePercent = json['profileCompletePercent'];
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
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    uniqueId = json['uniqueId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    alternativeMobile = json['alternativeMobile'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    address = json['address'];
    bloodType = json['bloodType'];
    country = json['country'];
    email = json['email'];
    maritalStatus = json['maritalStatus'];
    state = json['state'];
    profileCompleteDate = json['profileCompleteDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['docDate'] = this.docDate;
    data['isSelected'] = this.isSelected;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
    data['profileCompletePercent'] = this.profileCompletePercent;
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
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['uniqueId'] = this.uniqueId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['alternativeMobile'] = this.alternativeMobile;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['address'] = this.address;
    data['bloodType'] = this.bloodType;
    data['country'] = this.country;
    data['email'] = this.email;
    data['maritalStatus'] = this.maritalStatus;
    data['state'] = this.state;
    data['profileCompleteDate'] = this.profileCompleteDate;
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