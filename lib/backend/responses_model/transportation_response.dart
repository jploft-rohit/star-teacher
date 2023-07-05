class TransportationResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;

  TransportationResponse({this.statusCode, this.message, this.data});

  TransportationResponse.fromJson(Map<String, dynamic> json) {
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

  Data(
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
        this.tripData});

  Data.fromJson(Map<String, dynamic> json) {
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

  Status(
      {this.isDeleted,
        this.sId,
        this.name,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Status.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    return data;
  }
}

class TripData {
  PickupLocation? pickupLocation;
  PickupLocation? dropLocation;
  dynamic passangerType;
  dynamic tripStatus;
  dynamic tripType;
  dynamic isDeleted;
  dynamic sId;
  Trip? trip;
  Route? route;
  DriverUser? driverUser;
  Supervisor? supervisor;
  SupervisorUser? supervisorUser;
  Bus? bus;
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
  dynamic createdAt;
  dynamic updatedAt;

  TripData(
      {this.pickupLocation,
        this.dropLocation,
        this.passangerType,
        this.tripStatus,
        this.tripType,
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
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
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
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
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
        this.maritalStatus});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['parentId'] = this.parentId;
    data['deviceType'] = this.deviceType;
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
        this.updatedAt});

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
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
    school = json['school'] != null ? new School.fromJson(json['school']) : null;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  dynamic rating;

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
        ? new PickupLocation.fromJson(json['location'])
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
    data['updatedBy'] = this.updatedBy;
    data['rating'] = this.rating;
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
        this.uniqueId});

  PassangerUser.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'];
    deviceType = json['deviceType'];
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
    return data;
  }
}
