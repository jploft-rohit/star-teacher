class LocationResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;

  LocationResponse({this.statusCode, this.message, this.data});

  LocationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LocationUser? user;
  List<LocationData>? addresses;

  Data({this.user, this.addresses});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? LocationUser.fromJson(json['user']) : null;
    if (json['addresses'] != null) {
      addresses = <LocationData>[];
      json['addresses'].forEach((v) {
        addresses!.add(LocationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic mobile;
  Role? role;
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
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic uniqueId;
  dynamic religion;
  dynamic nationality;

  LocationUser(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
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
        this.profilePic,
        this.barcode,
        this.bloodType,
        this.dailyLimit,
        this.otp,
        this.deviceToken,
        this.deviceVoip,
        this.uniqueId,
        this.religion,
        this.nationality});

  LocationUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    parentId = json['parentId'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
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
    otp = json['otp'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    uniqueId = json['uniqueId'];
    religion = json['religion'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    if (this.idDocument != null) {
      data['idDocument'] = this.idDocument!.map((v) => v.toJson()).toList();
    }
    data['deviceType'] = this.deviceType;
    data['parentId'] = this.parentId;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
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
    data['otp'] = this.otp;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['uniqueId'] = this.uniqueId;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
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
  dynamic displayName;
  dynamic filterType;

  Role(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.displayName,
        this.filterType});

  Role.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    displayName = json['displayName'];
    filterType = json['filterType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['displayName'] = this.displayName;
    data['filterType'] = this.filterType;
    return data;
  }
}

class LocationData {
  Location? location;
  dynamic locationType;
  dynamic isDeleted;
  dynamic sId;
  dynamic sector;
  dynamic area;
  dynamic street;
  dynamic buildingVilla;
  dynamic flatVillaNo;
  dynamic landmark;
  dynamic mobile;
  dynamic landline;
  dynamic user;
  dynamic document;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic address;
  dynamic updatedBy;
  AreaForTransport? areaForTransport;

  LocationData(
      {this.location,
        this.locationType,
        this.isDeleted,
        this.areaForTransport,
        this.sId,
        this.sector,
        this.area,
        this.street,
        this.buildingVilla,
        this.flatVillaNo,
        this.landmark,
        this.mobile,
        this.landline,
        this.user,
        this.document,
        this.createdAt,
        this.updatedAt,
        this.address,
        this.updatedBy});

  LocationData.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    locationType = json['locationType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    areaForTransport = json['areaForTransport'] != null
        ? AreaForTransport.fromJson(json['areaForTransport'])
        : null;
    sector = json['sector'];
    area = json['area'];
    street = json['street'];
    buildingVilla = json['buildingVilla'];
    flatVillaNo = json['flatVillaNo'];
    landmark = json['landmark'];
    mobile = json['mobile'];
    landline = json['landline'];
    user = json['user'];
    document = json['document'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address = json['address'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['locationType'] = this.locationType;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.areaForTransport != null) {
      data['areaForTransport'] = this.areaForTransport!.toJson();
    }
    data['sector'] = this.sector;
    data['area'] = this.area;
    data['street'] = this.street;
    data['buildingVilla'] = this.buildingVilla;
    data['flatVillaNo'] = this.flatVillaNo;
    data['landmark'] = this.landmark;
    data['mobile'] = this.mobile;
    data['landline'] = this.landline;
    data['user'] = this.user;
    data['document'] = this.document;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['address'] = this.address;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Location {
  List<String>? coordinates;
  dynamic type;

  Location({this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<String>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class AreaForTransport {
  Location? location;
  String? address;
  bool? isDeleted;
  String? sId;
  String? name;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? updatedBy;

  AreaForTransport(
      {this.location,
        this.address,
        this.isDeleted,
        this.sId,
        this.name,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.updatedBy});

  AreaForTransport.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    address = json['address'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}
