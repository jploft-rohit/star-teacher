class MessageListResponse {
  dynamic status;
  dynamic message;
  Data? data;

  MessageListResponse({this.status, this.message, this.data});

  MessageListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic receiverName;
  dynamic receiverProfileImage;
  List<ChatData>? chatData;

  Data({this.receiverName, this.receiverProfileImage, this.chatData});

  Data.fromJson(Map<String, dynamic> json) {
    receiverName = json['receiverName'];
    receiverProfileImage = json['receiverProfileImage'];
    if (json['chatData'] != null) {
      chatData = <ChatData>[];
      json['chatData'].forEach((v) {
        chatData!.add(new ChatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiverName'] = this.receiverName;
    data['receiverProfileImage'] = this.receiverProfileImage;
    if (this.chatData != null) {
      data['chatData'] = this.chatData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatData {
  dynamic date;
  List<ChatList>? chatList;

  ChatData({this.date, this.chatList});

  ChatData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['chatList'] != null) {
      chatList = <ChatList>[];
      json['chatList'].forEach((v) {
        chatList!.add(new ChatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.chatList != null) {
      data['chatList'] = this.chatList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatList {
  dynamic type;
  dynamic isRead;
  dynamic readTime;
  dynamic isDeleted;
  dynamic sId;
  SenderId? senderId;
  ReceiverId? receiverId;
  dynamic message;
  bool? isEnglish;
  dynamic roomId;
  dynamic createdAt;
  dynamic updatedAt;

  ChatList(
      {this.type,
        this.isEnglish,
        this.isRead,
        this.readTime,
        this.isDeleted,
        this.sId,
        this.senderId,
        this.receiverId,
        this.message,
        this.roomId,
        this.createdAt,
        this.updatedAt});

  ChatList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    isEnglish = json['isEnglish'] = true;
    isRead = json['isRead'];
    readTime = json['readTime'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    senderId = json['senderId'] != null
        ? new SenderId.fromJson(json['senderId'])
        : null;
    receiverId = json['receiverId'] != null
        ? new ReceiverId.fromJson(json['receiverId'])
        : null;
    message = json['message'];
    roomId = json['roomId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['isEnglish'] = this.isEnglish;
    data['isRead'] = this.isRead;
    data['readTime'] = this.readTime;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    if (this.senderId != null) {
      data['senderId'] = this.senderId!.toJson();
    }
    if (this.receiverId != null) {
      data['receiverId'] = this.receiverId!.toJson();
    }
    data['message'] = this.message;
    data['roomId'] = this.roomId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SenderId {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic idDocument;
  dynamic docDate;
  dynamic deviceType;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
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

  SenderId(
      {this.isMobileVerified,
        this.gender,
        this.idDocument,
        this.docDate,
        this.deviceType,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
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
        this.uniqueId});

  SenderId.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    idDocument = json['idDocument'].cast<String>();
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
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

class ReceiverId {
  dynamic isMobileVerified;
  dynamic gender;
  dynamic docDate;
  dynamic deviceType;
  dynamic isDeleted;
  dynamic currentStatus;
  dynamic isSendActivationRequest;
  dynamic isFirstVerifyActivationRequest;
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic mobile;
  Role? role;
  dynamic dob;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic profilePic;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic language;
  dynamic nationality;
  dynamic nativeLanguage;
  dynamic religion;
  dynamic uniqueId;

  ReceiverId(
      {this.isMobileVerified,
        this.gender,
        this.docDate,
        this.deviceType,
        this.isDeleted,
        this.currentStatus,
        this.isSendActivationRequest,
        this.isFirstVerifyActivationRequest,
        this.sId,
        this.name,
        this.email,
        this.mobile,
        this.role,
        this.dob,
        this.emirateId,
        this.emirateIdExpire,
        this.profilePic,
        this.createdBy,
        this.updatedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.language,
        this.nationality,
        this.nativeLanguage,
        this.religion,
        this.uniqueId});

  ReceiverId.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    docDate = json['docDate'];
    deviceType = json['deviceType'];
    isDeleted = json['isDeleted'];
    currentStatus = json['currentStatus'];
    isSendActivationRequest = json['isSendActivationRequest'];
    isFirstVerifyActivationRequest = json['isFirstVerifyActivationRequest'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    dob = json['dob'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    profilePic = json['profilePic'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    language = json['language'];
    nationality = json['nationality'];
    nativeLanguage = json['nativeLanguage'];
    religion = json['religion'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isMobileVerified'] = this.isMobileVerified;
    data['gender'] = this.gender;
    data['docDate'] = this.docDate;
    data['deviceType'] = this.deviceType;
    data['isDeleted'] = this.isDeleted;
    data['currentStatus'] = this.currentStatus;
    data['isSendActivationRequest'] = this.isSendActivationRequest;
    data['isFirstVerifyActivationRequest'] =
        this.isFirstVerifyActivationRequest;
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
    data['profilePic'] = this.profilePic;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['language'] = this.language;
    data['nationality'] = this.nationality;
    data['nativeLanguage'] = this.nativeLanguage;
    data['religion'] = this.religion;
    data['uniqueId'] = this.uniqueId;
    return data;
  }
}
