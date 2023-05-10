class AllComplainReportResponse {
  int? statusCode;
  String? message;
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
  String? forEnquery;
  bool? isDeleted;
  String? sId;
  String? school;
  ComplaintUser? complaintUser;
  ComplaintType? complaintType;
  String? title;
  String? description;
  String? document;
  String? student;
  String? createdBy;
  String? updatedBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.forEnquery,
        this.isDeleted,
        this.sId,
        this.school,
        this.complaintUser,
        this.complaintType,
        this.title,
        this.description,
        this.document,
        this.student,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    forEnquery = json['forEnquery'];
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
    student = json['student'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forEnquery'] = this.forEnquery;
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
    data['student'] = this.student;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class ComplaintUser {
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  dynamic parentId;
  bool? isDeleted;
  String? sId;
  String? name;
  String? mobile;
  int? dob;
  String? nationality;
  String? emirateId;
  String? emirateIdExpire;
  String? nativeLanguage;
  String? religion;
  String? profilePic;
  String? role;
  String? createdAt;
  String? updatedAt;
  dynamic address;
  dynamic country;
  dynamic email;
  String? otp;
  String? deviceToken;
  String? deviceVoip;

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
        this.address,
        this.country,
        this.email,
        this.otp,
        this.deviceToken,
        this.deviceVoip});

  ComplaintUser.fromJson(Map<String, dynamic> json) {
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
    address = json['address'];
    country = json['country'];
    email = json['email'];
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
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
    data['address'] = this.address;
    data['country'] = this.country;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    return data;
  }
}

class ComplaintType {
  bool? isDeleted;
  String? sId;
  Null? school;
  String? name;
  String? createdBy;
  String? updatedBy;
  String? status;
  String? createdAt;
  String? updatedAt;

  ComplaintType(
      {this.isDeleted,
        this.sId,
        this.school,
        this.name,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

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
    return data;
  }
}

class User {
  bool? isMobileVerified;
  String? gender;
  dynamic idDocument;
  String? deviceType;
  dynamic parentId;
  bool? isDeleted;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? role;
  int? dob;
  String? emirateId;
  String? emirateIdExpire;
  String? createdBy;
  String? updatedBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? profilePic;

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
        this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
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
    return data;
  }
}