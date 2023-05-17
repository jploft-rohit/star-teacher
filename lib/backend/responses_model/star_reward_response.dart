class StarRewardResponse {
  dynamic statusCode;
  dynamic message;
  Data? data;
  Pagination? pagination;

  StarRewardResponse({this.statusCode, this.message, this.data, this.pagination});

  StarRewardResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  List<RewardsList>? rewards;
  List<MyRewards>? user;

  Data({this.rewards, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rewards'] != null) {
      rewards = <RewardsList>[];
      json['rewards'].forEach((v) {
        rewards!.add(new RewardsList.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = <MyRewards>[];
      json['user'].forEach((v) {
        user!.add(new MyRewards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rewards != null) {
      data['rewards'] = this.rewards!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RewardsList {
  dynamic sId;
  dynamic school;
  dynamic title;
  dynamic points;
  dynamic image;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  RewardsList(
      {this.sId,
        this.school,
        this.title,
        this.points,
        this.image,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  RewardsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    school = json['school'];
    title = json['title'];
    points = json['points'];
    image = json['image'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['school'] = this.school;
    data['title'] = this.title;
    data['points'] = this.points;
    data['image'] = this.image;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class MyRewards {
  dynamic sId;
  dynamic name;
  dynamic ratings;
  dynamic school;
  dynamic profilePic;
  dynamic studentId;

  MyRewards(
      {this.sId,
        this.name,
        this.ratings,
        this.school,
        this.profilePic,
        this.studentId});

  MyRewards.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    ratings = json['ratings'];
    school = json['school'];
    profilePic = json['profilePic'];
    studentId = json['studentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['ratings'] = this.ratings;
    data['school'] = this.school;
    data['profilePic'] = this.profilePic;
    data['studentId'] = this.studentId;
    return data;
  }
}

class Pagination {
  dynamic totalCount;
  dynamic totalPages;
  dynamic currentPage;
  dynamic nextPage;
  dynamic prevPage;

  Pagination(
      {this.totalCount,
        this.totalPages,
        this.currentPage,
        this.nextPage,
        this.prevPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['nextPage'] = this.nextPage;
    data['prevPage'] = this.prevPage;
    return data;
  }
}