class AllFeedbackHelpResponse {
  int? statusCode;
  String? message;
  Data? data;

  AllFeedbackHelpResponse({this.statusCode, this.message, this.data});

  AllFeedbackHelpResponse.fromJson(Map<String, dynamic> json) {
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
  List<FeedbackHelp>? feedbackHelp;
  List<Status>? status;

  Data({this.feedbackHelp, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['feedbackHelp'] != null) {
      feedbackHelp = <FeedbackHelp>[];
      json['feedbackHelp'].forEach((v) {
        feedbackHelp!.add(new FeedbackHelp.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feedbackHelp != null) {
      data['feedbackHelp'] = this.feedbackHelp!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeedbackHelp {
  String? forEnquery;
  bool? isDeleted;
  String? sId;
  String? school;
  String? title;
  String? description;
  String? person;
  User? user;
  Null? student;
  String? createdBy;
  String? updatedBy;
  Status? status;
  String? createdAt;
  String? updatedAt;
  String? reply;
  String? id;
  String? help;
  String? document;

  FeedbackHelp(
      {this.forEnquery,
        this.isDeleted,
        this.sId,
        this.school,
        this.title,
        this.description,
        this.person,
        this.user,
        this.student,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.reply,
        this.id,
        this.help,
        this.document});

  FeedbackHelp.fromJson(Map<String, dynamic> json) {
    forEnquery = json['forEnquery'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    title = json['title'];
    description = json['description'];
    person = json['person'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    student = json['student'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    reply = json['reply'];
    id = json['id'];
    help = json['help'];
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forEnquery'] = this.forEnquery;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['title'] = this.title;
    data['description'] = this.description;
    data['person'] = this.person;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['student'] = this.student;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['reply'] = this.reply;
    data['id'] = this.id;
    data['help'] = this.help;
    data['document'] = this.document;
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

class Status {
  bool? isDeleted;
  String? sId;
  String? name;
  String? type;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Status(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
