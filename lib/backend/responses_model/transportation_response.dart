class TransportationResponse {
  dynamic statusCode;
  dynamic message;
  TripData? data;

  TransportationResponse({this.statusCode, this.message, this.data});

  TransportationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? TripData.fromJson(json['data']) : null;
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

class TripData {
  PickupLocation? pickupLocation;
  PickupLocation? dropLocation;
  dynamic passangerType;
  dynamic tripStatus;
  dynamic tripType;
  dynamic isWithoutNfc;
  dynamic onVehicleUpdateTime;
  dynamic leftTheBusWithSomeoneUpdateTime;
  dynamic stampedByMistakeUpdateTime;
  dynamic returnToHomeAfterStampedUpdateTime;
  dynamic pendingUpdateTime;
  dynamic readyUpdateTime;
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
  SupervisorUser? supervisorUser;
  Bus? bus;
  dynamic school;
  PassangerUser? passangerUser;
  dynamic pickupAddress;
  dynamic dropAddress;
  dynamic isEmergencyLocation;
  Status? status;
  dynamic lateTime;
  dynamic tripStart;
  dynamic tripEnd;
  dynamic createdAt;
  dynamic updatedAt;

  TripData(
      {this.pickupLocation,
        this.dropLocation,
        this.passangerType,
        this.tripStatus,
        this.tripType,
        this.isWithoutNfc,
        this.onVehicleUpdateTime,
        this.leftTheBusWithSomeoneUpdateTime,
        this.stampedByMistakeUpdateTime,
        this.returnToHomeAfterStampedUpdateTime,
        this.pendingUpdateTime,
        this.readyUpdateTime,
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
        this.supervisorUser,
        this.bus,
        this.school,
        this.passangerUser,
        this.pickupAddress,
        this.dropAddress,
        this.isEmergencyLocation,
        this.status,
        this.lateTime,
        this.tripStart,
        this.tripEnd,
        this.createdAt,
        this.updatedAt});

  TripData.fromJson(Map<String, dynamic> json) {
    pickupLocation = json['pickupLocation'] != null
        ? PickupLocation.fromJson(json['pickupLocation'])
        : null;
    dropLocation = json['dropLocation'] != null
        ? PickupLocation.fromJson(json['dropLocation'])
        : null;
    passangerType = json['passangerType'];
    tripStatus = json['tripStatus'];
    tripType = json['tripType'];
    isWithoutNfc = json['isWithoutNfc'];
    onVehicleUpdateTime = json['onVehicleUpdateTime'];
    leftTheBusWithSomeoneUpdateTime = json['leftTheBusWithSomeoneUpdateTime'];
    stampedByMistakeUpdateTime = json['stampedByMistakeUpdateTime'];
    returnToHomeAfterStampedUpdateTime =
    json['returnToHomeAfterStampedUpdateTime'];
    pendingUpdateTime = json['pendingUpdateTime'];
    readyUpdateTime = json['readyUpdateTime'];
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
    trip = json['trip'] != null ? Trip.fromJson(json['trip']) : null;
    route = json['route'] != null ? Route.fromJson(json['route']) : null;
    driverUser = json['driverUser'] != null
        ? DriverUser.fromJson(json['driverUser'])
        : null;
    supervisorUser = json['supervisorUser'] != null
        ? SupervisorUser.fromJson(json['supervisorUser'])
        : null;
    bus = json['bus'] != null ? Bus.fromJson(json['bus']) : null;
    school = json['school'];
    passangerUser = json['passangerUser'] != null
        ? PassangerUser.fromJson(json['passangerUser'])
        : null;
    pickupAddress = json['pickupAddress'];
    dropAddress = json['dropAddress'];
    isEmergencyLocation = json['isEmergencyLocation'];
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    lateTime = json['lateTime'];
    tripStart = json['tripStart'];
    tripEnd = json['tripEnd'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['onVehicleUpdateTime'] = this.onVehicleUpdateTime;
    data['leftTheBusWithSomeoneUpdateTime'] =
        this.leftTheBusWithSomeoneUpdateTime;
    data['stampedByMistakeUpdateTime'] = this.stampedByMistakeUpdateTime;
    data['returnToHomeAfterStampedUpdateTime'] =
        this.returnToHomeAfterStampedUpdateTime;
    data['pendingUpdateTime'] = this.pendingUpdateTime;
    data['readyUpdateTime'] = this.readyUpdateTime;
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
    if (this.supervisorUser != null) {
      data['supervisorUser'] = this.supervisorUser!.toJson();
    }
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class Trip {
  dynamic tripType;
  dynamic isDeleted;
  dynamic sId;
  dynamic tripNo;
  Route? route;
  dynamic startTime;
  dynamic endTime;
  dynamic school;
  dynamic status;
  Wednesday? wednesday;
  Wednesday? friday;
  Wednesday? monday;
  Wednesday? thursday;
  Wednesday? sunday;
  Wednesday? tuesday;
  Wednesday? saturday;
  dynamic date;
  dynamic createdAt;
  dynamic updatedAt;

  Trip(
      {this.tripType,
        this.isDeleted,
        this.sId,
        this.tripNo,
        this.route,
        this.startTime,
        this.endTime,
        this.school,
        this.status,
        this.wednesday,
        this.friday,
        this.monday,
        this.thursday,
        this.sunday,
        this.tuesday,
        this.saturday,
        this.date,
        this.createdAt,
        this.updatedAt});

  Trip.fromJson(Map<String, dynamic> json) {
    tripType = json['tripType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    tripNo = json['tripNo'];
    route = json['route'] != null ? Route.fromJson(json['route']) : null;
    startTime = json['startTime'];
    endTime = json['endTime'];
    school = json['school'];
    status = json['status'];
    wednesday = json['wednesday'] != null
        ? Wednesday.fromJson(json['wednesday'])
        : null;
    friday =
    json['friday'] != null ? Wednesday.fromJson(json['friday']) : null;
    monday =
    json['monday'] != null ? Wednesday.fromJson(json['monday']) : null;
    thursday = json['thursday'] != null
        ? Wednesday.fromJson(json['thursday'])
        : null;
    sunday =
    json['sunday'] != null ? Wednesday.fromJson(json['sunday']) : null;
    tuesday = json['tuesday'] != null
        ? Wednesday.fromJson(json['tuesday'])
        : null;
    saturday = json['saturday'] != null
        ? Wednesday.fromJson(json['saturday'])
        : null;
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tripType'] = this.tripType;
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
    if (this.wednesday != null) {
      data['wednesday'] = this.wednesday!.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday!.toJson();
    }
    if (this.monday != null) {
      data['monday'] = this.monday!.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday!.toJson();
    }
    if (this.sunday != null) {
      data['sunday'] = this.sunday!.toJson();
    }
    if (this.tuesday != null) {
      data['tuesday'] = this.tuesday!.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday!.toJson();
    }
    data['date'] = this.date;
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
  dynamic school;
  dynamic name;
  dynamic routeNo;
  dynamic startAddress;
  dynamic endAddress;
  dynamic selectedPassanger;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  Route(
      {this.startLocation,
        this.endLocation,
        this.isDeleted,
        this.sId,
        this.school,
        this.name,
        this.routeNo,
        this.startAddress,
        this.endAddress,
        this.selectedPassanger,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  Route.fromJson(Map<String, dynamic> json) {
    startLocation = json['startLocation'] != null
        ? PickupLocation.fromJson(json['startLocation'])
        : null;
    endLocation = json['endLocation'] != null
        ? PickupLocation.fromJson(json['endLocation'])
        : null;
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school = json['school'];
    name = json['name'];
    routeNo = json['routeNo'];
    startAddress = json['startAddress'];
    endAddress = json['endAddress'];
    selectedPassanger = json['selectedPassanger'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.startLocation != null) {
      data['startLocation'] = this.startLocation!.toJson();
    }
    if (this.endLocation != null) {
      data['endLocation'] = this.endLocation!.toJson();
    }
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['name'] = this.name;
    data['routeNo'] = this.routeNo;
    data['startAddress'] = this.startAddress;
    data['endAddress'] = this.endAddress;
    data['selectedPassanger'] = this.selectedPassanger;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Wednesday {
  dynamic driverUser;
  dynamic bus;
  dynamic supervisorUser;

  Wednesday({this.driverUser, this.bus, this.supervisorUser});

  Wednesday.fromJson(Map<String, dynamic> json) {
    driverUser = json['driverUser'];
    bus = json['bus'];
    supervisorUser = json['supervisorUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['driverUser'] = this.driverUser;
    data['bus'] = this.bus;
    data['supervisorUser'] = this.supervisorUser;
    return data;
  }
}

class DriverUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic docDate;
  dynamic deviceType;
  dynamic alternativeMobile;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic profileCompletePercent;
  dynamic classStatus;
  dynamic attendanceStatus;
  dynamic isReadTermCondtion;
  dynamic isReadResponsibility;
  dynamic isAppAccess;
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
  dynamic sector;
  dynamic maritalStatus;
  dynamic barcode;
  dynamic uniqueId;

  DriverUser(
      {this.isMobileVerified,
        this.gender,
        this.docDate,
        this.deviceType,
        this.alternativeMobile,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.profileCompletePercent,
        this.classStatus,
        this.attendanceStatus,
        this.isReadTermCondtion,
        this.isReadResponsibility,
        this.isAppAccess,
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
        this.sector,
        this.maritalStatus,
        this.barcode,
        this.uniqueId});

  DriverUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    alternativeMobile = json['alternativeMobile'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    profileCompletePercent = json['profileCompletePercent'];
    classStatus = json['classStatus'];
    attendanceStatus = json['attendanceStatus'];
    isReadTermCondtion = json['isReadTermCondtion'];
    isReadResponsibility = json['isReadResponsibility'];
    isAppAccess = json['isAppAccess'];
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
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
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
    sector = json['sector'];
    maritalStatus = json['maritalStatus'];
    barcode = json['barcode'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['alternativeMobile'] = this.alternativeMobile;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
    data['profileCompletePercent'] = this.profileCompletePercent;
    data['classStatus'] = this.classStatus;
    data['attendanceStatus'] = this.attendanceStatus;
    data['isReadTermCondtion'] = this.isReadTermCondtion;
    data['isReadResponsibility'] = this.isReadResponsibility;
    data['isAppAccess'] = this.isAppAccess;
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
    data['sector'] = this.sector;
    data['maritalStatus'] = this.maritalStatus;
    data['barcode'] = this.barcode;
    data['uniqueId'] = this.uniqueId;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class SupervisorUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic docDate;
  dynamic deviceType;
  dynamic alternativeMobile;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic profileCompletePercent;
  dynamic classStatus;
  dynamic attendanceStatus;
  dynamic isReadTermCondtion;
  dynamic isReadResponsibility;
  dynamic isAppAccess;
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

  SupervisorUser(
      {this.isMobileVerified,
        this.gender,
        this.docDate,
        this.deviceType,
        this.alternativeMobile,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.profileCompletePercent,
        this.classStatus,
        this.attendanceStatus,
        this.isReadTermCondtion,
        this.isReadResponsibility,
        this.isAppAccess,
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
        this.uniqueId});

  SupervisorUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    alternativeMobile = json['alternativeMobile'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    profileCompletePercent = json['profileCompletePercent'];
    classStatus = json['classStatus'];
    attendanceStatus = json['attendanceStatus'];
    isReadTermCondtion = json['isReadTermCondtion'];
    isReadResponsibility = json['isReadResponsibility'];
    isAppAccess = json['isAppAccess'];
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
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['alternativeMobile'] = this.alternativeMobile;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] = this.isFirstVerifyActivationRequest;
    data['profileCompletePercent'] = this.profileCompletePercent;
    data['classStatus'] = this.classStatus;
    data['attendanceStatus'] = this.attendanceStatus;
    data['isReadTermCondtion'] = this.isReadTermCondtion;
    data['isReadResponsibility'] = this.isReadResponsibility;
    data['isAppAccess'] = this.isAppAccess;
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
    return data;
  }
}

class Bus {
  dynamic isDeleted;
  dynamic sId;
  School? school;
  dynamic plateNo;
  dynamic busSchoolNo;
  dynamic seats;
  dynamic model;
  dynamic year;
  dynamic company;
  dynamic document;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic driver;
  dynamic supervisor;

  Bus(
      {this.isDeleted,
        this.sId,
        this.school,
        this.plateNo,
        this.busSchoolNo,
        this.seats,
        this.model,
        this.year,
        this.company,
        this.document,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.driver,
        this.supervisor});

  Bus.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    school =
    json['school'] != null ? School.fromJson(json['school']) : null;
    plateNo = json['plateNo'];
    busSchoolNo = json['busSchoolNo'];
    seats = json['seats'];
    model = json['model'];
    year = json['year'];
    company = json['company'];
    document = json['document'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    driver = json['driver'];
    supervisor = json['supervisor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['plateNo'] = this.plateNo;
    data['busSchoolNo'] = this.busSchoolNo;
    data['seats'] = this.seats;
    data['model'] = this.model;
    data['year'] = this.year;
    data['company'] = this.company;
    data['document'] = this.document;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['driver'] = this.driver;
    data['supervisor'] = this.supervisor;
    return data;
  }
}

class School {
  PickupLocation? location;
  dynamic brouchure;
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic schoolCategory;
  dynamic schoolSector;
  dynamic schoolArea;
  dynamic address;
  dynamic language;
  dynamic schoolId;
  dynamic helplineNo;
  dynamic email;
  dynamic secondoryEmail;
  dynamic website;
  dynamic mobile;
  dynamic schoolType;
  dynamic user;
  dynamic status;
  dynamic createdBy;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic updatedBy;
  dynamic rating; // double

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
        this.updatedBy,
        this.rating});

  School.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? PickupLocation.fromJson(json['location'])
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
    updatedBy = json['updatedBy'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['updatedBy'] = this.updatedBy;
    data['rating'] = this.rating;
    return data;
  }
}

class PassangerUser {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic docDate;
  dynamic deviceType;
  dynamic alternativeMobile;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic profileCompletePercent;
  dynamic classStatus;
  dynamic attendanceStatus;
  dynamic isReadTermCondtion;
  dynamic isReadResponsibility;
  dynamic isAppAccess;
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
  dynamic address;
  dynamic country;
  dynamic maritalStatus;
  dynamic sector;
  dynamic starToBecome;
  dynamic profileCompleteDate;

  PassangerUser(
      {this.isMobileVerified,
        this.gender,
        this.docDate,
        this.deviceType,
        this.alternativeMobile,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.profileCompletePercent,
        this.classStatus,
        this.attendanceStatus,
        this.isReadTermCondtion,
        this.isReadResponsibility,
        this.isAppAccess,
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
        this.nationality,
        this.address,
        this.country,
        this.maritalStatus,
        this.sector,
        this.starToBecome,
        this.profileCompleteDate});

  PassangerUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    alternativeMobile = json['alternativeMobile'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    profileCompletePercent = json['profileCompletePercent'];
    classStatus = json['classStatus'];
    attendanceStatus = json['attendanceStatus'];
    isReadTermCondtion = json['isReadTermCondtion'];
    isReadResponsibility = json['isReadResponsibility'];
    isAppAccess = json['isAppAccess'];
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
    address = json['address'];
    country = json['country'];
    maritalStatus = json['maritalStatus'];
    sector = json['sector'];
    starToBecome = json['starToBecome'];
    profileCompleteDate = json['profileCompleteDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['alternativeMobile'] = this.alternativeMobile;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
    data['profileCompletePercent'] = this.profileCompletePercent;
    data['classStatus'] = this.classStatus;
    data['attendanceStatus'] = this.attendanceStatus;
    data['isReadTermCondtion'] = this.isReadTermCondtion;
    data['isReadResponsibility'] = this.isReadResponsibility;
    data['isAppAccess'] = this.isAppAccess;
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
    data['address'] = this.address;
    data['country'] = this.country;
    data['maritalStatus'] = this.maritalStatus;
    data['sector'] = this.sector;
    data['starToBecome'] = this.starToBecome;
    data['profileCompleteDate'] = this.profileCompleteDate;
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
  dynamic order;

  Status(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.order});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['order'] = this.order;
    return data;
  }
}
