import 'package:get/get.dart';

class CartItem {
  String id;
  String title;
  int quantity = 0;
  double price;
  String image;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'CartItem{id: $id, title: $title, quantity: $quantity, price: $price}';
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      title: map['title'],
      quantity: map['quantity'],
      price: map['price'],
      image: map['image'],
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}

class Cart {
  List<dynamic> items = [];
  double totalPrice = 0.0;

  Cart();

  Cart.fromJson(Map<String, dynamic> json) {
    items =
        (json['items'] as List).map((item) => CartItem.fromJson(item)).toList();
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = items.map((item) => item.toJson()).toList();
    data['totalPrice'] = totalPrice;
    return data;
  }

  void addItem(String productId, double price, String title, int quantity,
      String image) {
    items.add(CartItem(
      id: productId,
      title: title,
      price: price,
      quantity: quantity,
      image: image,
    ));
    totalPrice += price;
  }

  void removeItem(String productId) {
    items.removeWhere((item) => item.id == productId);
  }

  void removeSingleItem(String productId) {
    final item = items.firstWhere((item) => item.id == productId);
    if (item.quantity > 1) {
      item.quantity--;
      totalPrice -= item.price;
    } else {
      items.remove(item);
    }
  }

  void clear() {
    items = [];
    totalPrice = 0.0;
  }

  void addQuantity(String productId) {
    final item = items.firstWhere((item) => item.id == productId);
    item.quantity++;
    totalPrice += item.price;
  }

  void removeQuantity(String productId) {
    final item = items.firstWhere((item) => item.id == productId);
    if (item.quantity > 1) {
      item.quantity--;
      totalPrice -= item.price;
    } else {
      items.remove(item);
    }
  }

  void setQuantity(String productId, int quantity) {
    final item = items.firstWhere((item) => item.id == productId);
    item.quantity = quantity;
    totalPrice = 0.0;
    items.forEach((item) {
      totalPrice += (item.price * item.quantity);
    });
  }

  int getQuantity(String productId) {
    final item = items.firstWhere((item) => item.id == productId);
    return item.quantity;
  }

  double getTotalPrice() {
    totalPrice = 0.0;
    items.forEach((item) {
      totalPrice += (item.price * item.quantity);
    });
    return totalPrice;
  }

  List<dynamic> getItems() {
    return items;
  }

  int getItemCount() {
    return items.length;
  }

  void setItems(List<CartItem> items) {
    this.items = items;
  }

  void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }

  void setTotalPriceFromCart(Cart cart) {
    this.totalPrice = cart.totalPrice;
  }

  void setTotalPriceFromCartItems(List<CartItem> items) {
    this.totalPrice = 0.0;
    items.forEach((item) {
      this.totalPrice += (item.price * item.quantity);
    });
  }

  void setTotalPriceFromCartItemsFromJson(List<dynamic> items) {
    this.totalPrice = 0.0;
    items.forEach((item) {
      this.totalPrice += (item['price'] * item['quantity']);
    });
  }

  void setTotalPriceFromCartItemsFromMap(Map<String, dynamic> items) {
    this.totalPrice = 0.0;
    items.forEach((key, value) {
      this.totalPrice += (value['price'] * value['quantity']);
    });
  }

  void setTotalPriceFromCartItemsFromMapFromJson(Map<String, dynamic> items) {
    this.totalPrice = 0.0;
    items.forEach((key, value) {
      this.totalPrice += (value['price'] * value['quantity']);
    });
  }

  void setTotalPriceFromCartItemsFromMapFromJsonFromJson(
      Map<String, dynamic> items) {
    this.totalPrice = 0.0;
    items.forEach((key, value) {
      this.totalPrice += (value['price'] * value['quantity']);
    });
  }
}
