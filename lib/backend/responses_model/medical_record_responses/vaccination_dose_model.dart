class VaccinationDose {
  String? title;
  String? key;
  String? body;

  VaccinationDose({this.title, this.key, this.body});

  VaccinationDose.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['key'] = key;
    data['body'] = body;
    return data;
  }
}
