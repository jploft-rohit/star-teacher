class NotifyAuthority {
  String? option;
  String? dayType;
  String? fromDate;
  String? toDate;
  String? toDateApi;
  String? fromDateApi;
  bool? isYes;

  NotifyAuthority(
      {this.fromDateApi, this.toDateApi, this.option, this.dayType, this.fromDate, this.toDate, this.isYes});

  NotifyAuthority.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    dayType = json['dayType'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    isYes = json['isYes'];
    fromDateApi = json['fromDateApi'];
    toDateApi = json['toDateApi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['option'] = option;
    data['dayType'] = dayType;
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['isYes'] = isYes;
    data['toDateApi'] = toDateApi;
    data['fromDateApi'] = fromDateApi;
    return data;
  }
}