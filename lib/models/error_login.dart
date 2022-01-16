class ErrorLogin {
  String? type;
  String? title;
  int? status;
  String? traceId;
  Map<String, dynamic>? errors;

  ErrorLogin({this.type, this.title, this.status, this.traceId, this.errors});

  ErrorLogin.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    traceId = json['traceId'];
    errors = json['errors'] != null ? json['errors'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['status'] = this.status;
    data['traceId'] = this.traceId;

    if (this.errors != null) {
      data['errors'] = this.errors!;
    }
    return data;
  }
}
