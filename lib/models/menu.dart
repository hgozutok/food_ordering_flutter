class Menu {
  int? menuId;
  String? menuName;
  int? price;
  int? menuTypeId;
  String? menuImage;
  String? ingredients;
  Null? menuStatus;
  Null? menuType;

  Menu(
      {this.menuId,
      this.menuName,
      this.price,
      this.menuTypeId,
      this.menuImage,
      this.ingredients,
      this.menuStatus,
      this.menuType});

  Menu.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    menuName = json['menuName'];
    price = json['price'];
    menuTypeId = json['menuTypeId'];
    menuImage = json['menuImage'];
    ingredients = json['ingredients'];
    menuStatus = json['menuStatus'];
    menuType = json['menuType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['menuName'] = this.menuName;
    data['price'] = this.price;
    data['menuTypeId'] = this.menuTypeId;
    data['menuImage'] = this.menuImage;
    data['ingredients'] = this.ingredients;
    data['menuStatus'] = this.menuStatus;
    data['menuType'] = this.menuType;
    return data;
  }
}
