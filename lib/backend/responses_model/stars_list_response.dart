class StarsListResponse {
  dynamic statusCode;
  dynamic message;
  List<StarsListData>? data;

  StarsListResponse({this.statusCode, this.message, this.data});

  StarsListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StarsListData>[];
      json['data'].forEach((v) { data!.add(StarsListData.fromJson(v)); });
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

class StarsListData {
  dynamic sId;
  bool? isSelected;
  dynamic language;
  User? user;
  dynamic school;
  dynamic classes;
  dynamic section;
  dynamic batch;
  dynamic studentId;
  dynamic isDeleted;
  dynamic updatedAt;
  dynamic updatedBy;
  ClassObj? classObj;
  SectionObj? sectionObj;
  dynamic lastcommentdate;
  dynamic totalnotes;
  dynamic createdBy;
  dynamic createdAt;
  dynamic iV;

  StarsListData({this.isSelected, this.sId, this.language, this.user, this.school, this.classes, this.section, this.batch, this.studentId, this.isDeleted, this.updatedAt, this.updatedBy, this.classObj, this.sectionObj, this.lastcommentdate, this.totalnotes, this.createdBy, this.createdAt, this.iV});

  StarsListData.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  isSelected = json['isSelected'];
  language = json['language'];
  user = json['user'] != null ? User.fromJson(json['user']) : null;
  school = json['school'];
  classes = json['class'];
  section = json['section'];
  batch = json['batch'];
  studentId = json['studentId'];
  isDeleted = json['isDeleted'];
  updatedAt = json['updatedAt'];
  updatedBy = json['updatedBy'];
  classObj = json['classObj'] != null ? ClassObj.fromJson(json['classObj']) : null;
  sectionObj = json['sectionObj'] != null ? SectionObj.fromJson(json['sectionObj']) : null;
  lastcommentdate = json['lastcommentdate'];
  totalnotes = json['totalnotes'];
  createdBy = json['createdBy'];
  createdAt = json['createdAt'];
  iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['_id'] = this.sId;
  data['isSelected'] = this.isSelected;
  data['language'] = this.language;
  if (this.user != null) {
  data['user'] = this.user!.toJson();
  }
  data['school'] = this.school;
  data['class'] = this.classes;
  data['section'] = this.section;
  data['batch'] = this.batch;
  data['studentId'] = this.studentId;
  data['isDeleted'] = this.isDeleted;
  data['updatedAt'] = this.updatedAt;
  data['updatedBy'] = this.updatedBy;
  if (this.classObj != null) {
  data['classObj'] = this.classObj!.toJson();
  }
  if (this.sectionObj != null) {
  data['sectionObj'] = this.sectionObj!.toJson();
  }
  data['lastcommentdate'] = this.lastcommentdate;
  data['totalnotes'] = this.totalnotes;
  data['createdBy'] = this.createdBy;
  data['createdAt'] = this.createdAt;
  data['__v'] = this.iV;
  return data;
  }
}

class User {
  dynamic sId;
  dynamic isMobileVerified;
  dynamic gender;
  List<String>? idDocument;
  List<String>? parentId;
  dynamic isDeleted;
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
  dynamic iV;
  dynamic profilePic;
  dynamic barcode;
  dynamic bloodType;
  dynamic dailyLimit;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceType;
  dynamic deviceVoip;
  dynamic uniqueId;
  dynamic religion;
  dynamic nationality;
  dynamic currentStatus;
  dynamic address;
  dynamic alternativeMobile;
  dynamic country;
  dynamic maritalStatus;
  dynamic sector;
  dynamic starToBecome;
  dynamic statusData;
  dynamic language;
  dynamic nativeLanguage;
  dynamic state;
  dynamic isFirstVerifyActivationRequest;
  dynamic isSendActivationRequest;
  dynamic registrationStep;
  dynamic docDate;

  User({this.sId, this.isMobileVerified, this.gender, this.idDocument, this.parentId, this.isDeleted, this.name, this.email, this.mobile, this.role, this.dob, this.emirateId, this.emirateIdExpire, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.iV, this.profilePic, this.barcode, this.bloodType, this.dailyLimit, this.otp, this.deviceToken, this.deviceType, this.deviceVoip, this.uniqueId, this.religion, this.nationality, this.currentStatus, this.address, this.alternativeMobile, this.country, this.maritalStatus, this.sector, this.starToBecome, this.statusData, this.language, this.nativeLanguage, this.state, this.isFirstVerifyActivationRequest, this.isSendActivationRequest, this.registrationStep, this.docDate});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    parentId = json['parentId'].cast<String>();
    isDeleted = json['isDeleted'];
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
    iV = json['__v'];
    profilePic = json['profilePic'];
    barcode = json['barcode'];
    bloodType = json['bloodType'];
    dailyLimit = json['dailyLimit'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    deviceVoip = json['deviceVoip'];
    uniqueId = json['uniqueId'];
    religion = json['religion'];
    nationality = json['nationality'];
    currentStatus = json['currentStatus'];
    address = json['address'];
    alternativeMobile = json['alternativeMobile'];
    country = json['country'];
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    starToBecome = json['starToBecome'];
    statusData = json['statusData'];
    language = json['language'];
    nativeLanguage = json['nativeLanguage'];
    state = json['state'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    isSendActivationRequest = json['isSendActivationRequest'];
    registrationStep = json['registrationStep'];
    docDate = json['docDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
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
    data['__v'] = this.iV;
    data['profilePic'] = this.profilePic;
    data['barcode'] = this.barcode;
    data['bloodType'] = this.bloodType;
    data['dailyLimit'] = this.dailyLimit;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceType'] = this.deviceType;
    data['deviceVoip'] = this.deviceVoip;
    data['uniqueId'] = this.uniqueId;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
    data['currentStatus'] = this.currentStatus;
    data['address'] = this.address;
    data['alternativeMobile'] = this.alternativeMobile;
    data['country'] = this.country;
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
    data['starToBecome'] = this.starToBecome;
    data['statusData'] = this.statusData;
    data['language'] = this.language;
    data['nativeLanguage'] = this.nativeLanguage;
    data['state'] = this.state;
    data['isFirstVerifyActivationRequest'] = this.isFirstVerifyActivationRequest;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['registrationStep'] = this.registrationStep;
    data['docDate'] = this.docDate;
    return data;
  }
}

class ClassObj {
  dynamic sId;
  dynamic isDeleted;
  dynamic school;
  dynamic name;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;
  dynamic starTheme;

  ClassObj({this.sId, this.isDeleted, this.school, this.name, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy, this.starTheme});

  ClassObj.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    school = json['school'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
    starTheme = json['star_theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['school'] = this.school;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    data['star_theme'] = this.starTheme;
    return data;
  }
}

class SectionObj {
  dynamic sId;
  dynamic isDeleted;
  dynamic school;
  dynamic classes;
  dynamic name;
  dynamic roomNo;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic updatedBy;

  SectionObj({this.sId, this.isDeleted, this.school, this.classes, this.name, this.roomNo, this.status, this.createdBy, this.createdAt, this.updatedAt, this.iV, this.updatedBy});

  SectionObj.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  isDeleted = json['isDeleted'];
  school = json['school'];
  classes = json['class'];
  name = json['name'];
  roomNo = json['roomNo'];
  status = json['status'];
  createdBy = json['createdBy'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['_id'] = this.sId;
  data['isDeleted'] = this.isDeleted;
  data['school'] = this.school;
  data['class'] = this.classes;
  data['name'] = this.name;
  data['roomNo'] = this.roomNo;
  data['status'] = this.status;
  data['createdBy'] = this.createdBy;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
  data['updatedBy'] = this.updatedBy;
  return data;
  }
}
