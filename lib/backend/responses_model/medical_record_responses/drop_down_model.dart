class DropDown {
  String? sId;
  String? name;

  DropDown({this.sId, this.name});

  DropDown.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
