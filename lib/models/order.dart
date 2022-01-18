class Order {
  int? orderId;
  String? customerId;
  String? orderDate;
  int? totalAmount;
  int? orderStatus;
  int? processedBy;
  Customer? customer;
  List<Tblorderdetails>? tblorderdetails;

  Order(
      {this.orderId,
      this.customerId,
      this.orderDate,
      this.totalAmount,
      this.orderStatus,
      this.processedBy,
      this.customer,
      this.tblorderdetails});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    orderDate = json['orderDate'];
    totalAmount = json['totalAmount'];
    orderStatus = json['orderStatus'];
    processedBy = json['processedBy'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['tblorderdetails'] != null) {
      tblorderdetails = <Tblorderdetails>[];
      json['tblorderdetails'].forEach((v) {
        tblorderdetails!.add(new Tblorderdetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['customerId'] = this.customerId;
    data['orderDate'] = this.orderDate;
    data['totalAmount'] = this.totalAmount;
    data['orderStatus'] = this.orderStatus;
    data['processedBy'] = this.processedBy;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.tblorderdetails != null) {
      data['tblorderdetails'] =
          this.tblorderdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  int? customerId;
  String? customerFirstName;
  String? customerLastName;
  String? customerMiddleName;
  String? customerEmail;
  String? customerPhoneNumber;
  String? customerLandline;
  String? profileImage;
  String? customerUsername;
  String? customerPassword;
  int? accountStatus;
  List<String>? tblorders;

  Customer(
      {this.customerId,
      this.customerFirstName,
      this.customerLastName,
      this.customerMiddleName,
      this.customerEmail,
      this.customerPhoneNumber,
      this.customerLandline,
      this.profileImage,
      this.customerUsername,
      this.customerPassword,
      this.accountStatus,
      this.tblorders});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerFirstName = json['customerFirstName'];
    customerLastName = json['customerLastName'];
    customerMiddleName = json['customerMiddleName'];
    customerEmail = json['customerEmail'];
    customerPhoneNumber = json['customerPhoneNumber'];
    customerLandline = json['customerLandline'];
    profileImage = json['profileImage'];
    customerUsername = json['customerUsername'];
    customerPassword = json['customerPassword'];
    accountStatus = json['accountStatus'];
    tblorders = json['tblorders'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['customerFirstName'] = this.customerFirstName;
    data['customerLastName'] = this.customerLastName;
    data['customerMiddleName'] = this.customerMiddleName;
    data['customerEmail'] = this.customerEmail;
    data['customerPhoneNumber'] = this.customerPhoneNumber;
    data['customerLandline'] = this.customerLandline;
    data['profileImage'] = this.profileImage;
    data['customerUsername'] = this.customerUsername;
    data['customerPassword'] = this.customerPassword;
    data['accountStatus'] = this.accountStatus;
    data['tblorders'] = this.tblorders;
    return data;
  }
}

class Tblorderdetails {
  int? orderDetailsId;
  int? orderId;
  int? menuId;
  int? amount;
  int? noOfServing;
  int? totalAmount;

  Tblorderdetails(
    int i, {
    this.orderDetailsId,
    this.orderId,
    this.menuId,
    this.amount,
    this.noOfServing,
    this.totalAmount,
  });

  Tblorderdetails.fromJson(Map<String, dynamic> json) {
    orderDetailsId = json['orderDetailsId'];
    orderId = json['orderId'];
    menuId = json['menuId'];
    amount = json['amount'];
    noOfServing = json['noOfServing'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderDetailsId'] = this.orderDetailsId;
    data['orderId'] = this.orderId;
    data['menuId'] = this.menuId;
    data['amount'] = this.amount;
    data['noOfServing'] = this.noOfServing;
    data['totalAmount'] = this.totalAmount;

    return data;
  }
}
