class AllComplainReportResponse {
  int? statusCode;
  String? message;
  List<AllComplainReportData>? data;

  AllComplainReportResponse({this.statusCode, this.message, this.data});

  AllComplainReportResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AllComplainReportData>[];
      json['data'].forEach((v) {
        data!.add(new AllComplainReportData.fromJson(v));
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

class AllComplainReportData {
  String? forEnquery;
  bool? isDeleted;
  String? sId;
  String? school;
  String? complaintUser;
  String? complaintType;
  String? title;
  String? description;
  String? document;
  User? user;
  String? student;
  String? createdBy;
  String? updatedBy;
  String? status;
  String? createdAt;
  String? updatedAt;

  AllComplainReportData(
      {this.forEnquery,
        this.isDeleted,
        this.sId,
        this.school,
        this.complaintUser,
        this.complaintType,
        this.title,
        this.description,
        this.document,
        this.user,
        this.student,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  AllComplainReportData.fromJson(Map<String, dynamic> json) {
    forEnquery = json['forEnquery'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    complaintUser = json['complaintUser'];
    complaintType = json['complaintType'];
    title = json['title'];
    description = json['description'];
    document = json['document'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    student = json['student'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forEnquery'] = this.forEnquery;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['complaintUser'] = this.complaintUser;
    data['complaintType'] = this.complaintType;
    data['title'] = this.title;
    data['description'] = this.description;
    data['document'] = this.document;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['student'] = this.student;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class User {
  Location? location;
  bool? isMobileVerified;
  String? gender;
  List<String>? idDocument;
  String? deviceType;
  List<String>? parentId;
  bool? isDeleted;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? password;
  int? dob;
  String? createdAt;
  String? updatedAt;
  String? otp;
  String? address;
  String? emirateId;
  String? emirateIdExpire;
  String? deviceToken;
  String? deviceVoip;
  String? role;

  User(
      {this.location,
        this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.sId,
        this.name,
        this.email,
        this.mobile,
        this.password,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.otp,
        this.address,
        this.emirateId,
        this.emirateIdExpire,
        this.deviceToken,
        this.deviceVoip,
        this.role});

  User.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    deviceType = json['deviceType'];
    parentId = json['parentId'].cast<String>();
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
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
