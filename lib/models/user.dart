import 'error_login.dart';

class User {
  String? message;
  bool? isAuthenticated;
  String? userName;
  String? email;
  String? image;
  List<String>? roles;
  String? token;
  String? refreshTokenExpiration;
  ErrorLogin? errorLogin;
  User(
      {this.message,
      this.isAuthenticated,
      this.userName,
      this.email,
      this.image,
      this.roles,
      this.token,
      this.refreshTokenExpiration,
      this.errorLogin});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    userName = json['userName'];
    email = json['email'];
    image = json['image'];
    roles = json['roles'].cast<String>();
    token = json['token'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
    errorLogin = json['errorLogin'] != null
        ? new ErrorLogin.fromJson(json['errorLogin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isAuthenticated'] = this.isAuthenticated;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['image'] = this.image;
    data['roles'] = this.roles;
    data['token'] = this.token;
    data['refreshTokenExpiration'] = this.refreshTokenExpiration;
    if (this.errorLogin != null) {
      data['errorLogin'] = this.errorLogin!.toJson();
    }
    return data;
  }
}
