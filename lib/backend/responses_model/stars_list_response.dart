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
      json['data'].forEach((v) { data!.add(new StarsListData.fromJson(v)); });
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

class StarsListData {
  dynamic sId;
  dynamic language;
  User? user;
  dynamic school;
  dynamic classes;
  dynamic section;
  dynamic batch;
  String? lastCommentDate;
  int? totalNotes;
  dynamic studentId;
  dynamic isDeleted;

  StarsListData({this.lastCommentDate,this.totalNotes,this.sId, this.language, this.user, this.school, this.classes, this.section, this.batch, this.studentId, this.isDeleted});

  StarsListData.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  language = json['language'];
  user = json['user'] != null ? new User.fromJson(json['user']) : null;
  school = json['school'];
  classes = json['class'];
  section = json['section'];
  batch = json['batch'];
  lastCommentDate = json['lastcommentdate'];
  totalNotes = json['totalnotes'];
  studentId = json['studentId'];
  isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  data['language'] = this.language;
  if (this.user != null) {
  data['user'] = this.user!.toJson();
  }
  data['lastcommentdate'] = this.lastCommentDate;
  data['totalnotes'] = this.totalNotes;
  data['school'] = this.school;
  data['class'] = this.classes;
  data['section'] = this.section;
  data['batch'] = this.batch;
  data['studentId'] = this.studentId;
  data['isDeleted'] = this.isDeleted;
  return data;
  }
}

class User {
  dynamic sId;
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic parentId;
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

  User({this.sId, this.isMobileVerified, this.gender, this.idDocument, this.parentId, this.isDeleted, this.name, this.email, this.mobile, this.role, this.dob, this.emirateId, this.emirateIdExpire, this.createdBy, this.updatedBy, this.status, this.createdAt, this.updatedAt, this.iV, this.profilePic, this.barcode, this.bloodType, this.dailyLimit});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}