class OrderResponse {
  OrderResponse({
      this.message, 
      this.order,});

  OrderResponse.fromJson(dynamic json) {
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  String? message;
  Order? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }

}

class Order {
  Order({
      this.usersId, 
      this.productId, 
      this.quantity, 
      this.price, 
      this.color, 
      this.size, 
      this.id,});

  Order.fromJson(dynamic json) {
    usersId = json['users_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    color = json['color'];
    size = json['size'];
    id = json['id'];
  }
  String? usersId;
  String? productId;
  String? quantity;
  String? price;
  String? color;
  String? size;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['users_id'] = usersId;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['color'] = color;
    map['size'] = size;
    map['id'] = id;
    return map;
  }

}