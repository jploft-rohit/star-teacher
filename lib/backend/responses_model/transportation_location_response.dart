class TransportationLocationResponse {
  dynamic statusCode;
  dynamic message;
  TransportationLocationData? data;

  TransportationLocationResponse({this.statusCode, this.message, this.data});

  TransportationLocationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new TransportationLocationData.fromJson(json['data']) : null;
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

class TransportationLocationData {
  PickupLocation? pickupLocation;
  PickupLocation? dropLocation;
  dynamic passangerType;
  dynamic isDeleted;
  dynamic sId;
  dynamic passanger;
  dynamic passangerUser;
  dynamic pickupAddress;
  dynamic dropAddress;
  dynamic school;
  dynamic createdBy;
  dynamic updatedBy;
  Status? status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  TripData? tripData;
  PassangerUserData? passangerUserData;
  ChangeLocationRequestData? changeLocationRequestData;

  TransportationLocationData(
      {this.pickupLocation,
        this.dropLocation,
        this.passangerType,
        this.isDeleted,
        this.sId,
        this.passanger,
        this.passangerUser,
        this.pickupAddress,
        this.dropAddress,
        this.school,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.tripData,
        this.passangerUserData,
        this.changeLocationRequestData});

  TransportationLocationData.fromJson(Map<String, dynamic> json) {
    pickupLocation = json['pickupLocation'] != null
        ? new PickupLocation.fromJson(json['pickupLocation'])
        : null;
    dropLocation = json['dropLocation'] != null
        ? new PickupLocation.fromJson(json['dropLocation'])
        : null;
    passangerType = json['passangerType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    passanger = json['passanger'];
    passangerUser = json['passangerUser'];
    pickupAddress = json['pickupAddress'];
    dropAddress = json['dropAddress'];
    school = json['school'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    tripData = json['tripData'] != null
        ? new TripData.fromJson(json['tripData'])
        : null;
    passangerUserData = json['passangerUserData'] != null
        ? new PassangerUserData.fromJson(json['passangerUserData'])
        : null;
    changeLocationRequestData = json['changeLocationRequestData'] != null
        ? new ChangeLocationRequestData.fromJson(
        json['changeLocationRequestData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pickupLocation != null) {
      data['pickupLocation'] = this.pickupLocation!.toJson();
    }
    if (this.dropLocation != null) {
      data['dropLocation'] = this.dropLocation!.toJson();
    }
    data['passangerType'] = this.passangerType;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['passanger'] = this.passanger;
    data['passangerUser'] = this.passangerUser;
    data['pickupAddress'] = this.pickupAddress;
    data['dropAddress'] = this.dropAddress;
    data['school'] = this.school;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.tripData != null) {
      data['tripData'] = this.tripData!.toJson();
    }
    if (this.passangerUserData != null) {
      data['passangerUserData'] = this.passangerUserData!.toJson();
    }
    if (this.changeLocationRequestData != null) {
      data['changeLocationRequestData'] =
          this.changeLocationRequestData!.toJson();
    }
    return data;
  }
}

class PickupLocation {
  List<double>? coordinates;
  dynamic type;

  PickupLocation({this.coordinates, this.type});

  PickupLocation.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class Status {
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic type;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;
  dynamic order;

  Status(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.order});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['order'] = this.order;
    return data;
  }
}

class TripData {
  PickupLocation? pickupLocation;
  PickupLocation? dropLocation;
  dynamic passangerType;
  dynamic tripStatus;
  dynamic tripType;
  dynamic isWithoutNfc;
  dynamic pendingUpdateTime;
  dynamic pickupUpdateTime;
  dynamic dropUpdateTime;
  dynamic lateUpdateTime;
  dynamic absentUpdateTime;
  dynamic notshowUpdateTime;
  dynamic requesttoadminUpdateTime;
  dynamic tripStartRealTime;
  dynamic tripEndRealTime;
  dynamic isDeleted;
  dynamic sId;
  Trip? trip;
  Route? route;
  DriverUser? driverUser;
  Supervisor? supervisor;
  SupervisorUser? supervisorUser;
  dynamic bus;
  dynamic passanger;
  dynamic school;
  PassangerUser? passangerUser;
  dynamic pickupAddress;
  dynamic dropAddress;
  dynamic isEmergencyLocation;
  Status? status;
  dynamic lateTime;
  dynamic tripStart;
  dynamic tripEnd;
  dynamic iV;
  dynamic createdAt;
  dynamic updatedAt;

  TripData(
      {this.pickupLocation,
        this.dropLocation,
        this.passangerType,
        this.tripStatus,
        this.tripType,
        this.isWithoutNfc,
        this.pendingUpdateTime,
        this.pickupUpdateTime,
        this.dropUpdateTime,
        this.lateUpdateTime,
        this.absentUpdateTime,
        this.notshowUpdateTime,
        this.requesttoadminUpdateTime,
        this.tripStartRealTime,
        this.tripEndRealTime,
        this.isDeleted,
        this.sId,
        this.trip,
        this.route,
        this.driverUser,
        this.supervisor,
        this.supervisorUser,
        this.bus,
        this.passanger,
        this.school,
        this.passangerUser,
        this.pickupAddress,
        this.dropAddress,
        this.isEmergencyLocation,
        this.status,
        this.lateTime,
        this.tripStart,
        this.tripEnd,
        this.iV,
        this.createdAt,
        this.updatedAt});

  TripData.fromJson(Map<String, dynamic> json) {
    pickupLocation = json['pickupLocation'] != null
        ? new PickupLocation.fromJson(json['pickupLocation'])
        : null;
    dropLocation = json['dropLocation'] != null
        ? new PickupLocation.fromJson(json['dropLocation'])
        : null;
    passangerType = json['passangerType'];
    tripStatus = json['tripStatus'];
    tripType = json['tripType'];
    isWithoutNfc = json['isWithoutNfc'];
    pendingUpdateTime = json['pendingUpdateTime'];
    pickupUpdateTime = json['pickupUpdateTime'];
    dropUpdateTime = json['dropUpdateTime'];
    lateUpdateTime = json['lateUpdateTime'];
    absentUpdateTime = json['absentUpdateTime'];
    notshowUpdateTime = json['notshowUpdateTime'];
    requesttoadminUpdateTime = json['requesttoadminUpdateTime'];
    tripStartRealTime = json['tripStartRealTime'];
    tripEndRealTime = json['tripEndRealTime'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
    route = json['route'] != null ? new Route.fromJson(json['route']) : null;
    driverUser = json['driverUser'] != null
        ? new DriverUser.fromJson(json['driverUser'])
        : null;
    supervisor = json['supervisor'] != null
        ? new Supervisor.fromJson(json['supervisor'])
        : null;
    supervisorUser = json['supervisorUser'] != null
        ? new SupervisorUser.fromJson(json['supervisorUser'])
        : null;
    bus = json['bus'];
    passanger = json['passanger'];
    school = json['school'];
    passangerUser = json['passangerUser'] != null
        ? new PassangerUser.fromJson(json['passangerUser'])
        : null;
    pickupAddress = json['pickupAddress'];
    dropAddress = json['dropAddress'];
    isEmergencyLocation = json['isEmergencyLocation'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    lateTime = json['lateTime'];
    tripStart = json['tripStart'];
    tripEnd = json['tripEnd'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pickupLocation != null) {
      data['pickupLocation'] = this.pickupLocation!.toJson();
    }
    if (this.dropLocation != null) {
      data['dropLocation'] = this.dropLocation!.toJson();
    }
    data['passangerType'] = this.passangerType;
    data['tripStatus'] = this.tripStatus;
    data['tripType'] = this.tripType;
    data['isWithoutNfc'] = this.isWithoutNfc;
    data['pendingUpdateTime'] = this.pendingUpdateTime;
    data['pickupUpdateTime'] = this.pickupUpdateTime;
    data['dropUpdateTime'] = this.dropUpdateTime;
    data['lateUpdateTime'] = this.lateUpdateTime;
    data['absentUpdateTime'] = this.absentUpdateTime;
    data['notshowUpdateTime'] = this.notshowUpdateTime;
    data['requesttoadminUpdateTime'] = this.requesttoadminUpdateTime;
    data['tripStartRealTime'] = this.tripStartRealTime;
    data['tripEndRealTime'] = this.tripEndRealTime;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.trip != null) {
      data['trip'] = this.trip!.toJson();
    }
    if (this.route != null) {
      data['route'] = this.route!.toJson();
    }
    if (this.driverUser != null) {
      data['driverUser'] = this.driverUser!.toJson();
    }
    if (this.supervisor != null) {
      data['supervisor'] = this.supervisor!.toJson();
    }
    if (this.supervisorUser != null) {
      data['supervisorUser'] = this.supervisorUser!.toJson();
    }
    data['bus'] = this.bus;
    data['passanger'] = this.passanger;
    data['school'] = this.school;
    if (this.passangerUser != null) {
      data['passangerUser'] = this.passangerUser!.toJson();
    }
    data['pickupAddress'] = this.pickupAddress;
    data['dropAddress'] = this.dropAddress;
    data['isEmergencyLocation'] = this.isEmergencyLocation;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['lateTime'] = this.lateTime;
    data['tripStart'] = this.tripStart;
    data['tripEnd'] = this.tripEnd;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Trip {
  dynamic tripType;
  List<String>? passanger;
  dynamic isDeleted;
  dynamic sId;
  dynamic tripNo;
  Route? route;
  dynamic startTime;
  dynamic endTime;
  dynamic school;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  Sunday? sunday;
  Sunday? monday;
  Sunday? wednesday;
  Sunday? tuesday;
  Sunday? thursday;
  Sunday? saturday;
  Sunday? friday;
  dynamic createdAt;
  dynamic updatedAt;

  Trip(
      {this.tripType,
        this.passanger,
        this.isDeleted,
        this.sId,
        this.tripNo,
        this.route,
        this.startTime,
        this.endTime,
        this.school,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.sunday,
        this.monday,
        this.wednesday,
        this.tuesday,
        this.thursday,
        this.saturday,
        this.friday,
        this.createdAt,
        this.updatedAt});

  Trip.fromJson(Map<String, dynamic> json) {
    tripType = json['tripType'];
    passanger = json['passanger'].cast<String>();
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    tripNo = json['tripNo'];
    route = json['route'] != null ? new Route.fromJson(json['route']) : null;
    startTime = json['startTime'];
    endTime = json['endTime'];
    school = json['school'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    sunday =
    json['sunday'] != null ? new Sunday.fromJson(json['sunday']) : null;
    monday =
    json['monday'] != null ? new Sunday.fromJson(json['monday']) : null;
    wednesday = json['wednesday'] != null
        ? new Sunday.fromJson(json['wednesday'])
        : null;
    tuesday =
    json['tuesday'] != null ? new Sunday.fromJson(json['tuesday']) : null;
    thursday =
    json['thursday'] != null ? new Sunday.fromJson(json['thursday']) : null;
    saturday =
    json['saturday'] != null ? new Sunday.fromJson(json['saturday']) : null;
    friday =
    json['friday'] != null ? new Sunday.fromJson(json['friday']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripType'] = this.tripType;
    data['passanger'] = this.passanger;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['tripNo'] = this.tripNo;
    if (this.route != null) {
      data['route'] = this.route!.toJson();
    }
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['school'] = this.school;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    if (this.sunday != null) {
      data['sunday'] = this.sunday!.toJson();
    }
    if (this.monday != null) {
      data['monday'] = this.monday!.toJson();
    }
    if (this.wednesday != null) {
      data['wednesday'] = this.wednesday!.toJson();
    }
    if (this.tuesday != null) {
      data['tuesday'] = this.tuesday!.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday!.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday!.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Route {
  PickupLocation? startLocation;
  PickupLocation? endLocation;
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic startAddress;
  dynamic startLatitude;
  dynamic startLongitude;
  dynamic endAddress;
  dynamic endLatitude;
  dynamic endLongitude;
  dynamic createdAt;
  dynamic updatedAt;

  Route(
      {this.startLocation,
        this.endLocation,
        this.isDeleted,
        this.sId,
        this.name,
        this.startAddress,
        this.startLatitude,
        this.startLongitude,
        this.endAddress,
        this.endLatitude,
        this.endLongitude,
        this.createdAt,
        this.updatedAt});

  Route.fromJson(Map<String, dynamic> json) {
    startLocation = json['startLocation'] != null
        ? new PickupLocation.fromJson(json['startLocation'])
        : null;
    endLocation = json['endLocation'] != null
        ? new PickupLocation.fromJson(json['endLocation'])
        : null;
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    startAddress = json['startAddress'];
    startLatitude = json['startLatitude'];
    startLongitude = json['startLongitude'];
    endAddress = json['endAddress'];
    endLatitude = json['endLatitude'];
    endLongitude = json['endLongitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startLocation != null) {
      data['startLocation'] = this.startLocation!.toJson();
    }
    if (this.endLocation != null) {
      data['endLocation'] = this.endLocation!.toJson();
    }
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['startAddress'] = this.startAddress;
    data['startLatitude'] = this.startLatitude;
    data['startLongitude'] = this.startLongitude;
    data['endAddress'] = this.endAddress;
    data['endLatitude'] = this.endLatitude;
    data['endLongitude'] = this.endLongitude;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Sunday {
  dynamic driverUser;
  dynamic bus;
  dynamic supervisorUser;
  dynamic supervisor;

  Sunday({this.driverUser, this.bus, this.supervisorUser, this.supervisor});

  Sunday.fromJson(Map<String, dynamic> json) {
    driverUser = json['driverUser'];
    bus = json['bus'];
    supervisorUser = json['supervisorUser'];
    supervisor = json['supervisor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverUser'] = this.driverUser;
    data['bus'] = this.bus;
    data['supervisorUser'] = this.supervisorUser;
    data['supervisor'] = this.supervisor;
    return data;
  }
}

class DriverUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
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
  dynamic createdAt;
  dynamic updatedAt;
  dynamic otp;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic address;
  dynamic country;
  dynamic email;
  dynamic status;
  dynamic state;
  dynamic alternativeMobile;
  dynamic sector;
  dynamic maritalStatus;
  dynamic uniqueId;
  RatingData? ratingData;

  DriverUser(
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
        this.ratingData});

  DriverUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    deviceType = json['deviceType'];
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
    ratingData = json['ratingData'] != null
        ? new RatingData.fromJson(json['ratingData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
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
    if (this.ratingData != null) {
      data['ratingData'] = this.ratingData!.toJson();
    }
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

class RatingData {
  dynamic isAnonymous;
  dynamic isDeleted;
  dynamic sId;
  dynamic ratedBy;
  dynamic user;
  dynamic comment;
  dynamic createdAt;
  dynamic createdBy;
  dynamic rating;
  dynamic ratingUserName;
  dynamic updatedAt;
  dynamic updatedBy;

  RatingData(
      {this.isAnonymous,
        this.isDeleted,
        this.sId,
        this.ratedBy,
        this.user,
        this.comment,
        this.createdAt,
        this.createdBy,
        this.rating,
        this.ratingUserName,
        this.updatedAt,
        this.updatedBy});

  RatingData.fromJson(Map<String, dynamic> json) {
    isAnonymous = json['isAnonymous'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    ratedBy = json['ratedBy'];
    user = json['user'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    rating = json['rating'];
    ratingUserName = json['ratingUserName'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAnonymous'] = this.isAnonymous;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['ratedBy'] = this.ratedBy;
    data['user'] = this.user;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['rating'] = this.rating;
    data['ratingUserName'] = this.ratingUserName;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Supervisor {
  dynamic isDeleted;
  dynamic sId;
  dynamic user;
  dynamic school;
  dynamic role;
  dynamic dateOfEmployment;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  Supervisor(
      {this.isDeleted,
        this.sId,
        this.user,
        this.school,
        this.role,
        this.dateOfEmployment,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  Supervisor.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    user = json['user'];
    school = json['school'];
    role = json['role'];
    dateOfEmployment = json['dateOfEmployment'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['school'] = this.school;
    data['role'] = this.role;
    data['dateOfEmployment'] = this.dateOfEmployment;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SupervisorUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
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
  dynamic createdAt;
  dynamic updatedAt;
  dynamic uniqueId;
  RatingData? ratingData;

  SupervisorUser(
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
        this.uniqueId,
        this.ratingData});

  SupervisorUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    deviceType = json['deviceType'];
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
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    uniqueId = json['uniqueId'];
    ratingData = json['ratingData'] != null
        ? new RatingData.fromJson(json['ratingData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
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
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['uniqueId'] = this.uniqueId;
    if (this.ratingData != null) {
      data['ratingData'] = this.ratingData!.toJson();
    }
    return data;
  }
}

class PassangerUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
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

  PassangerUser(
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

  PassangerUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    deviceType = json['deviceType'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
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

class PassangerUserData {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic deviceType;
  dynamic parentId;
  dynamic isDeleted;
  dynamic sId;
  dynamic mobile;
  dynamic address;
  dynamic createdAt;
  dynamic dob;
  dynamic email;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic isEmailVerified;
  dynamic name;
  dynamic nationality;
  dynamic otp;
  dynamic profilePic;
  Role? role;
  dynamic updatedAt;
  dynamic deviceToken;
  dynamic deviceVoip;
  dynamic country;
  dynamic sector;
  dynamic maritalStatus;
  dynamic alternativeMobile;
  dynamic state;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic uniqueId;

  PassangerUserData(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.deviceType,
        this.parentId,
        this.isDeleted,
        this.sId,
        this.mobile,
        this.address,
        this.createdAt,
        this.dob,
        this.email,
        this.emirateId,
        this.emirateIdExpire,
        this.isEmailVerified,
        this.name,
        this.nationality,
        this.otp,
        this.profilePic,
        this.role,
        this.updatedAt,
        this.deviceToken,
        this.deviceVoip,
        this.country,
        this.sector,
        this.maritalStatus,
        this.alternativeMobile,
        this.state,
        this.nativeLanguage,
        this.religion,
        this.uniqueId,
      });

  PassangerUserData.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    parentId = json['parentId'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    mobile = json['mobile'];
    address = json['address'];
    createdAt = json['createdAt'];
    dob = json['dob'];
    email = json['email'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    isEmailVerified = json['isEmailVerified'];
    name = json['name'];
    nationality = json['nationality'];
    otp = json['otp'];
    profilePic = json['profilePic'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    updatedAt = json['updatedAt'];
    deviceToken = json['deviceToken'];
    deviceVoip = json['deviceVoip'];
    country = json['country'];
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
    alternativeMobile = json['alternativeMobile'];
    state = json['state'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    uniqueId = json['uniqueId'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['deviceType'] = this.deviceType;
    if (this.parentId != null) {
      data['parentId'] = this.parentId!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['isEmailVerified'] = this.isEmailVerified;
    data['name'] = this.name;
    data['nationality'] = this.nationality;
    data['otp'] = this.otp;
    data['profilePic'] = this.profilePic;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['updatedAt'] = this.updatedAt;
    data['deviceToken'] = this.deviceToken;
    data['deviceVoip'] = this.deviceVoip;
    data['country'] = this.country;
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
    data['alternativeMobile'] = this.alternativeMobile;
    data['state'] = this.state;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['uniqueId'] = this.uniqueId;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ChangeLocationRequestData {
  dynamic date;
  dynamic time;
  dynamic outTime;
  dynamic inTime;
  dynamic reason;
  dynamic comment;
  dynamic meetingUrl;
  dynamic meetingFeedBackRating;
  dynamic meetingFeedBackDesc;
  dynamic isLeavePermission;
  dynamic isDeleted;
  dynamic sId;
  dynamic sector;
  dynamic area;
  dynamic street;
  dynamic landmark;
  dynamic latitude;
  dynamic longitude;
  dynamic addressType;
  dynamic building;
  dynamic flat;
  dynamic mobileNo;
  dynamic location;
  dynamic landlineNo;
  dynamic trip;
  dynamic typeOfRequest;
  PassangerUserData? user;
  PassangerUserData? createdBy;
  PassangerUserData? updatedBy;
  dynamic document;
  dynamic flatPhoto;
  dynamic status;
  dynamic requestId;
  dynamic createdAt;
  dynamic updatedAt;
  List<RequestStatus>? requestStatus;
  ChangeLocationRequestData(
      {this.date,
        this.time,
        this.outTime,
        this.requestStatus,
        this.inTime,
        this.reason,
        this.comment,
        this.meetingUrl,
        this.meetingFeedBackRating,
        this.meetingFeedBackDesc,
        this.isLeavePermission,
        this.isDeleted,
        this.sId,
        this.sector,
        this.area,
        this.street,
        this.landmark,
        this.latitude,
        this.longitude,
        this.addressType,
        this.building,
        this.flat,
        this.mobileNo,
        this.location,
        this.landlineNo,
        this.trip,
        this.typeOfRequest,
        this.user,
        this.createdBy,
        this.updatedBy,
        this.document,
        this.flatPhoto,
        this.status,
        this.requestId,
        this.createdAt,
        this.updatedAt});

  ChangeLocationRequestData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    outTime = json['outTime'];
    inTime = json['inTime'];
    reason = json['reason'];
    comment = json['comment'];
    meetingUrl = json['meetingUrl'];
    meetingFeedBackRating = json['meetingFeedBackRating'];
    meetingFeedBackDesc = json['meetingFeedBackDesc'];
    isLeavePermission = json['isLeavePermission'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    sector = json['sector'];
    area = json['area'];
    street = json['street'];
    landmark = json['landmark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addressType = json['addressType'];
    building = json['building'];
    flat = json['flat'];
    mobileNo = json['mobileNo'];
    location = json['location'];
    landlineNo = json['landlineNo'];
    trip = json['trip'];
    typeOfRequest = json['typeOfRequest'];
    user = json['user'] != null
        ? new PassangerUserData.fromJson(json['user'])
        : null;
    createdBy = json['createdBy'] != null
        ? new PassangerUserData.fromJson(json['createdBy'])
        : null;
    updatedBy = json['updatedBy'] != null
        ? new PassangerUserData.fromJson(json['updatedBy'])
        : null;
    document = json['document'];
    flatPhoto = json['flatPhoto'];
    status = json['status'];
    requestId = json['requestId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['requestStatus'] != null) {
      requestStatus = <RequestStatus>[];
      json['requestStatus'].forEach((v) { requestStatus!.add(new RequestStatus.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['outTime'] = this.outTime;
    data['inTime'] = this.inTime;
    data['reason'] = this.reason;
    data['comment'] = this.comment;
    data['meetingUrl'] = this.meetingUrl;
    data['meetingFeedBackRating'] = this.meetingFeedBackRating;
    data['meetingFeedBackDesc'] = this.meetingFeedBackDesc;
    data['isLeavePermission'] = this.isLeavePermission;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['sector'] = this.sector;
    data['area'] = this.area;
    data['street'] = this.street;
    data['landmark'] = this.landmark;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['addressType'] = this.addressType;
    data['building'] = this.building;
    data['flat'] = this.flat;
    data['mobileNo'] = this.mobileNo;
    data['location'] = this.location;
    data['landlineNo'] = this.landlineNo;
    data['trip'] = this.trip;
    data['typeOfRequest'] = this.typeOfRequest;
    if (this.requestStatus != null) {
      data['requestStatus'] = this.requestStatus!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    data['document'] = this.document;
    data['flatPhoto'] = this.flatPhoto;
    data['status'] = this.status;
    data['requestId'] = this.requestId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class RequestStatus {
  bool? isDeleted;
  String? sId;
  String? name;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? order;
  String? time;

  RequestStatus({this.isDeleted, this.sId, this.name, this.type, this.createdAt, this.updatedAt, this.iV, this.order, this.time});

  RequestStatus.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    order = json['order'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['order'] = this.order;
    data['time'] = this.time;
    return data;
  }
}