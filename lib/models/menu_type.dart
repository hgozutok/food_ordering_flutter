class MenuType {
  int? menuTypeId;
  String? typeName;
  String? description;

  MenuType({this.menuTypeId, this.typeName, this.description});

  MenuType.fromJson(Map<String, dynamic> json) {
    menuTypeId = json['menuTypeId'];
    typeName = json['typeName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuTypeId'] = this.menuTypeId;
    data['typeName'] = this.typeName;
    data['description'] = this.description;
    return data;
  }
}
