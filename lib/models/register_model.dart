class RegisterModel {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? password;
  String? image;
  String? message;
  RegisterModel(
      {this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.password,
      this.image,
      this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    return data;
  }
}
