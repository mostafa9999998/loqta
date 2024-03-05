class OrderListResponse {
  OrderListResponse({
      this.orders,});

  OrderListResponse.fromJson(dynamic json) {
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }
  List<Orders>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Orders {
  Orders({
      this.order, 
      this.products,});

  Orders.fromJson(dynamic json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    products = json['products'] != null ? Products.fromJson(json['products']) : null;
  }
  Order? order;
  Products? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (products != null) {
      map['products'] = products?.toJson();
    }
    return map;
  }

}

class Products {
  Products({
      this.productId, 
      this.name,});

  Products.fromJson(dynamic json) {
    productId = json['product_id'];
    name = json['name'];
  }
  int? productId;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['name'] = name;
    return map;
  }

}

class Order {
  Order({
      this.orderId, 
      this.quantity, 
      this.price, 
      this.color, 
      this.size,});

  Order.fromJson(dynamic json) {
    orderId = json['order_id'];
    quantity = json['quantity'];
    price = json['price'];
    color = json['color'];
    size = json['size'];
  }
  int? orderId;
  int? quantity;
  String? price;
  String? color;
  String? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['color'] = color;
    map['size'] = size;
    return map;
  }

}