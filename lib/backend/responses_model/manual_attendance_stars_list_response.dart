class ManualAttendanceStarsListResponse {
  dynamic statusCode;
  dynamic message;
  List<ManualAttendanceStarsListData>? data;

  ManualAttendanceStarsListResponse({this.statusCode, this.message, this.data});

  ManualAttendanceStarsListResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ManualAttendanceStarsListData>[];
      json['data'].forEach((v) { data!.add(new ManualAttendanceStarsListData.fromJson(v)); });
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

class ManualAttendanceStarsListData {
  dynamic sId;
  bool? isSelected;
  dynamic isDeleted;
  dynamic language;
  dynamic school;
  dynamic classes;
  dynamic section;
  dynamic studentId;
  dynamic batch;
  User? user;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  Attendances? attendances;

  ManualAttendanceStarsListData({this.isSelected, this.sId, this.isDeleted, this.language, this.school, this.classes, this.section, this.studentId, this.batch, this.user, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.iV, this.attendances});

  ManualAttendanceStarsListData.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  isSelected = json['isSelected'];
  isDeleted = json['isDeleted'];
  language = json['language'];
  school = json['school'];
  classes = json['class'];
  section = json['section'];
  studentId = json['studentId'];
  batch = json['batch'];
  user = json['user'] != null ? new User.fromJson(json['user']) : null;
  createdBy = json['createdBy'];
  updatedBy = json['updatedBy'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
  attendances = json['attendances'] != null ? new Attendances.fromJson(json['attendances']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  data['isDeleted'] = this.isDeleted;
  data['language'] = this.language;
  data['school'] = this.school;
  data['class'] = this.classes;
  data['isSelected'] = this.isSelected;
  data['section'] = this.section;
  data['studentId'] = this.studentId;
  data['batch'] = this.batch;
  if (this.user != null) {
  data['user'] = this.user!.toJson();
  }
  data['createdBy'] = this.createdBy;
  data['updatedBy'] = this.updatedBy;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['__v'] = this.iV;
  if (this.attendances != null) {
  data['attendances'] = this.attendances!.toJson();
  }
  return data;
  }
}

class User {
  dynamic sId;
  dynamic isMobileVerified;
  dynamic gender;
  List<String>? idDocument;
  dynamic deviceType;
  List<String>? parentId;
  dynamic isDeleted;
  dynamic name;
  dynamic email;
  dynamic mobile;
  dynamic role;
  dynamic dob;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic profilePic;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic language;
  dynamic nationality;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic currentStatus;
  dynamic uniqueId;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic registrationStep;
  dynamic alternativeMobile;

  User({this.sId, this.isMobileVerified, this.gender, this.idDocument, this.deviceType, this.parentId, this.isDeleted, this.name, this.email, this.mobile, this.role, this.dob, this.emirateId, this.emirateIdExpire, this.profilePic, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.iV, this.language, this.nationality, this.nativeLanguage, this.religion, this.currentStatus, this.uniqueId, this.isSendActivationRequest, this.isFirstVerifyActivationRequest, this.registrationStep, this.alternativeMobile});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
    isDeleted = json['isDeleted'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
    dob = json['dob'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    profilePic = json['profilePic'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    language = json['language'];
    nationality = json['nationality'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    currentStatus = json['currentStatus'];
    uniqueId = json['uniqueId'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    registrationStep = json['registrationStep'];
    alternativeMobile = json['alternativeMobile'];
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
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['dob'] = this.dob;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['profilePic'] = this.profilePic;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['language'] = this.language;
    data['nationality'] = this.nationality;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['currentStatus'] = this.currentStatus;
    data['uniqueId'] = this.uniqueId;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] = this.isFirstVerifyActivationRequest;
    data['registrationStep'] = this.registrationStep;
    data['alternativeMobile'] = this.alternativeMobile;
    return data;
  }
}

class Attendances {
  dynamic sId;
  dynamic attendanceType;

  Attendances({this.sId, this.attendanceType});

  Attendances.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    attendanceType = json['attendanceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['attendanceType'] = this.attendanceType;
    return data;
  }
}