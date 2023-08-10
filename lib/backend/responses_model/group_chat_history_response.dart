class GroupChatHistoryResponse {
  int? statusCode;
  String? message;
  List<Data>? data;

  GroupChatHistoryResponse({this.statusCode, this.message, this.data});

  GroupChatHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  Null? message;

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
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    groupUsers = json['groupUsers'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    roomId = json['roomId'];
    title = json['title'];
    createdBy = json['createdBy'];
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
    groupProfile = json['groupProfile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    message = json['message'];
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
    data['message'] = this.message;
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
